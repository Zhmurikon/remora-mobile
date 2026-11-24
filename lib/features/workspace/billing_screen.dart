import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

import '../../widgets/ink_motion.dart';
import '../../data/api_client.dart';
import '../../widgets/ink_illustration.dart';
import 'workspace.dart';

String rubles(int kopecks) =>
    '${(kopecks / 100).toStringAsFixed(kopecks % 100 == 0 ? 0 : 2).replaceAll('.', ',')} ₽';

class BillingScreen extends ConsumerStatefulWidget {
  const BillingScreen({super.key});
  @override
  ConsumerState<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends ConsumerState<BillingScreen>
    with WidgetsBindingObserver {
  String interval = 'month';
  final promo = TextEditingController();
  final keys = <String, String>{};
  bool paying = false;
  final overview = workspaceDocument('billing/overview');
  final plans = workspaceList('billing/plans');
  final entitlements = workspaceDocument('billing/entitlements');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    promo.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) refresh();
  }

  void refresh() {
    ref.invalidate(overview);
    ref.invalidate(entitlements);
  }

  Future<void> checkout(Json plan) async {
    if (paying) return;
    setState(() => paying = true);
    try {
      final code = promo.text.trim();
      final key = '${plan['code']}/$interval/$code';
      final result = await ref
          .read(dioProvider)
          .post<Json>(
            '/api/v1/billing/checkout',
            data: {
              'request_key': keys.putIfAbsent(key, () => const Uuid().v4()),
              'plan_code': plan['code'],
              'interval': interval,
              'promo_code': code.isEmpty ? null : code,
            },
          );
      if (!mounted) return;
      final uri = Uri.parse(result.data!['confirmation_url']);
      if (uri.scheme != 'https' ||
          !await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw StateError('checkout');
      }
      // Повторный переход к тому же заказу открывает созданный платёж.
    } finally {
      if (mounted) setState(() => paying = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final access = ref.watch(entitlements);
    final catalogue = ref.watch(plans);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Тариф и подписка'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: refresh,
            tooltip: 'Обновить подписку',
          ),
        ],
      ),
      body: RemoteContent(
        ref.watch(overview),
        retry: refresh,
        builder: (account) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SectionHeading(
              'Ваш тариф · ${account['subscription']?['plan_name'] ?? 'Free'}',
            ),
            if (account['subscription']?['current_period_end']
                case final String end)
              Text('Действует до ${end.split('T').first}'),
            RemoteContent(
              access,
              retry: refresh,
              builder: (rights) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final entry in const {
                    'ai.transcription_minutes_per_week': 'Минуты расшифровки',
                    'ai.generation_tokens_per_week': 'Токены генерации',
                  }.entries)
                    Text(
                      '${entry.value}: осталось ${rights['remaining'][entry.key] ?? 'без ограничений'}',
                    ),
                ],
              ),
            ),
            const SectionHeading('Тарифы'),
            SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: 'month', label: Text('На месяц')),
                ButtonSegment(value: 'year', label: Text('На год')),
              ],
              selected: {interval},
              onSelectionChanged: paying
                  ? null
                  : (v) => setState(() => interval = v.first),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: promo,
              enabled: !paying,
              maxLength: 48,
              decoration: const InputDecoration(labelText: 'Промокод'),
            ),
            RemoteContent(
              catalogue,
              retry: () => ref.invalidate(plans),
              builder: (items) => Column(
                children: [
                  for (final plan in items)
                    ListTile(
                      leading: InkIllustration(
                        switch (plan['code']) {
                          'pro' => InkDrawing.books,
                          'plus' => InkDrawing.notebook,
                          _ => InkDrawing.cards,
                        },
                        width: 42,
                        height: 38,
                      ),
                      title: Text(plan['name']),
                      subtitle: InkReveal(
                        onMount: false,
                        change: plan['price_$interval'],
                        child: Text(
                          plan['code'] == 'free'
                              ? 'Бесплатно'
                              : rubles(plan['price_$interval'] ?? 0),
                        ),
                      ),
                      trailing:
                          plan['code'] == 'free' ||
                              plan['price_$interval'] == null ||
                              plan['code'] ==
                                  account['subscription']?['plan_code']
                          ? null
                          : ActionButton(
                              label: 'К оплате',
                              run: paying ? null : () => checkout(plan),
                            ),
                    ),
                ],
              ),
            ),
            const SectionHeading('История платежей'),
            if (rows(account['payments']).isEmpty)
              const Text('Платежей пока нет'),
            for (final pay in rows(account['payments']))
              ListTile(
                title: Text('${pay['plan_name']} · ${rubles(pay['amount'])}'),
                subtitle: Text(
                  const {
                        'pending': 'Ожидает оплаты',
                        'succeeded': 'Оплачен',
                        'canceled': 'Отменён',
                        'refunded': 'Возвращён',
                      }[pay['status']] ??
                      'Обрабатывается',
                ),
              ),
            ListTile(
              title: const Text('Реферальный код'),
              subtitle: SelectableText(account['referral_code']),
              trailing: IconButton(
                icon: const Icon(Icons.copy),
                tooltip: 'Скопировать ссылку',
                onPressed: () => Clipboard.setData(
                  ClipboardData(
                    text:
                        '$baseUrl/register?ref=${Uri.encodeQueryComponent(account['referral_code'])}',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
