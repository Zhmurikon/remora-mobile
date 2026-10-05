import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:uuid/uuid.dart';

import '../../data/api_client.dart';
import '../../data/preferences.dart';
import 'battle_answer_retry.dart';
import 'card_content_widget.dart';

Uri battleInviteUrl(String battleId, String inviteToken) {
  return Uri.parse(baseUrl).replace(
    path: '/app/battles/$battleId',
    queryParameters: {'invite': inviteToken},
  );
}

class BattleSetupScreen extends ConsumerStatefulWidget {
  const BattleSetupScreen({
    super.key,
    required this.setId,
    required this.setTitle,
  });
  final String setId, setTitle;
  @override
  ConsumerState<BattleSetupScreen> createState() => _BattleSetupScreenState();
}

class _BattleSetupScreenState extends ConsumerState<BattleSetupScreen> {
  int _count = 10;
  String _direction = 'term_to_def';
  bool _loading = false;
  String? _error;
  String? _activeBattleId;

  @override
  void initState() {
    super.initState();
    _activeBattleId = ref.read(appPreferencesProvider).activeBattleId;
  }

  Future<void> _create() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final battle = await ref
          .read(apiClientProvider)
          .createBattle(
            BattleCreate(
              setId: widget.setId,
              requestKey: const Uuid().v4(),
              questionCount: _count,
              direction: _direction,
            ),
          );
      if (mounted) {
        context.go(
          '/battle/${battle.id}?invite=${Uri.encodeComponent(battle.inviteToken)}',
        );
      }
    } catch (_) {
      if (mounted) {
        setState(() => _error = 'Не удалось создать приглашение');
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(widget.setTitle)),
    body: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text('Битва 1×1', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 8),
        const Text(
          'Точность важнее скорости. Соперник получит ту же последовательность вопросов.',
        ),
        const SizedBox(height: 24),
        DropdownButtonFormField<int>(
          initialValue: _count,
          decoration: const InputDecoration(labelText: 'Вопросов'),
          items: const [
            4,
            5,
            10,
            15,
            20,
          ].map((v) => DropdownMenuItem(value: v, child: Text('$v'))).toList(),
          onChanged: (v) => setState(() => _count = v!),
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          initialValue: _direction,
          decoration: const InputDecoration(labelText: 'Направление'),
          items: const [
            DropdownMenuItem(
              value: 'term_to_def',
              child: Text('Термин → определение'),
            ),
            DropdownMenuItem(
              value: 'def_to_term',
              child: Text('Определение → термин'),
            ),
          ],
          onChanged: (v) => setState(() => _direction = v!),
        ),
        if (_error != null)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              _error!,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        const SizedBox(height: 24),
        FilledButton(
          onPressed: _loading ? null : _create,
          child: Text(_loading ? 'Создаём…' : 'Создать приглашение'),
        ),
        if (_activeBattleId != null) ...[
          const SizedBox(height: 12),
          TextButton(
            onPressed: () => context.go('/battle/$_activeBattleId'),
            child: const Text('Вернуться в текущую битву'),
          ),
        ],
      ],
    ),
  );
}

class BattleScreen extends ConsumerStatefulWidget {
  const BattleScreen({super.key, required this.battleId, this.inviteToken});
  final String battleId;
  final String? inviteToken;
  @override
  ConsumerState<BattleScreen> createState() => _BattleScreenState();
}

class _BattleScreenState extends ConsumerState<BattleScreen>
    with WidgetsBindingObserver {
  BattleRoom? _room;
  Timer? _poll;
  int _index = 0;
  bool _joining = false, _answering = false;
  String? _error;
  final _answerRetry = BattleAnswerRetry();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _load(join: widget.inviteToken != null);
    _poll = Timer.periodic(const Duration(seconds: 1), (_) => _load());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _poll?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _load();
    }
  }

  Future<void> _load({bool join = false}) async {
    if (_joining) {
      return;
    }
    try {
      final api = ref.read(apiClientProvider);
      if (join) {
        _joining = true;
        _acceptRoom(await api.joinBattle(widget.inviteToken!));
      } else {
        _acceptRoom(await api.getBattle(widget.battleId));
      }
      if (mounted) {
        setState(() {});
      }
    } catch (_) {
      if (mounted) {
        setState(() => _error = 'Не удалось обновить состояние битвы');
      }
    } finally {
      _joining = false;
    }
  }

  void _acceptRoom(BattleRoom room) {
    _room = room;
    final mine = room.participants.where(
      (participant) => participant.isCurrent,
    );
    if (mine.isNotEmpty && room.questions.isNotEmpty) {
      _index = mine.first.answeredCount.clamp(0, room.questions.length - 1);
    }
    final preferences = ref.read(appPreferencesProvider);
    if (room.status == 'finished') {
      preferences.clearActiveBattleId();
    } else {
      preferences.setActiveBattleId(room.id);
    }
  }

  Future<void> _ready() async {
    try {
      _acceptRoom(
        await ref.read(apiClientProvider).readyForBattle(widget.battleId),
      );
      if (mounted) {
        setState(() {});
      }
    } catch (_) {
      if (mounted) {
        setState(() => _error = 'Не удалось подтвердить готовность');
      }
    }
  }

  Future<void> _answer(String value) async {
    final q = _room?.questions[_index];
    if (q == null || _answering) {
      return;
    }
    final answer = _answerRetry.prepare(questionId: q.id, value: value);
    setState(() => _answering = true);
    try {
      final reply = await ref
          .read(apiClientProvider)
          .answerBattle(widget.battleId, answer);
      _answerRetry.complete();
      _acceptRoom(reply.room);
      if (mounted) {
        setState(() {});
      }
    } catch (_) {
      if (mounted) {
        setState(() => _error = 'Ответ не отправлен. Повторите выбор.');
      }
    } finally {
      if (mounted) setState(() => _answering = false);
    }
  }

  Future<void> _leave() async {
    try {
      await ref.read(apiClientProvider).leaveBattle(widget.battleId);
      await ref.read(appPreferencesProvider).clearActiveBattleId();
      if (mounted) {
        context.go('/set/${_room!.setId}/study');
      }
    } catch (_) {
      if (mounted) {
        setState(() => _error = 'Не удалось отменить битву');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final room = _room;
    if (room == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (room.status == 'finished') return _BattleResult(room: room);
    final mine = room.participants.where((p) => p.isCurrent).firstOrNull;
    final countdown = room.startsAt?.difference(DateTime.now()).inSeconds;
    return Scaffold(
      appBar: AppBar(title: Text(room.setTitle)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            room.status == 'active'
                ? 'Вопрос ${_index + 1} из ${room.questionCount}'
                : 'Комната битвы',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 12),
          ...room.participants.map(
            (p) => ListTile(
              title: Text(p.displayName ?? p.username),
              subtitle: Text(
                '${p.isConnected ? 'В сети' : 'Нет связи'} · '
                '${p.ready ? 'Готов' : 'Ожидает'} · '
                '${p.answeredCount}/${room.questionCount}',
              ),
              trailing: p.isCurrent ? const Text('Вы') : null,
            ),
          ),
          if (room.status == 'waiting') ...[
            const SizedBox(height: 16),
            if (widget.inviteToken != null)
              OutlinedButton.icon(
                onPressed: () => SharePlus.instance.share(
                  ShareParams(
                    text:
                        'Сыграем в Remora: '
                        '${battleInviteUrl(room.id, widget.inviteToken!)}',
                  ),
                ),
                icon: const Icon(Icons.share),
                label: const Text('Поделиться'),
              ),
            const SizedBox(height: 8),
            FilledButton(
              onPressed: mine?.ready == true ? null : _ready,
              child: Text(mine?.ready == true ? 'Вы готовы' : 'Я готов'),
            ),
            TextButton(onPressed: _leave, child: const Text('Отменить битву')),
          ],
          if (room.status == 'countdown')
            Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  'Старт через ${countdown == null ? '…' : countdown.clamp(1, 3)}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
          if (room.status == 'active')
            _Question(
              question: room.questions[_index],
              busy: _answering || _answerRetry.pending != null,
              onAnswer: _answer,
            ),
          if (_answerRetry.pending != null && !_answering)
            OutlinedButton(
              onPressed: () => _answer(_answerRetry.pending!.value),
              child: const Text('Повторить отправку ответа'),
            ),
          if (_error != null)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                _error!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ),
        ],
      ),
    );
  }
}

class _Question extends StatelessWidget {
  const _Question({
    required this.question,
    required this.busy,
    required this.onAnswer,
  });
  final BattleQuestion question;
  final bool busy;
  final ValueChanged<String> onAnswer;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      const SizedBox(height: 24),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: CardContentWidget(
            value: question.prompt,
            contentType: question.contentType,
            codeLanguage: question.codeLanguage,
            imageUrl: question.promptImageUrl,
          ),
        ),
      ),
      const SizedBox(height: 16),
      ...question.options.map(
        (option) => Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: OutlinedButton(
            onPressed: busy ? null : () => onAnswer(option),
            child: CardContentWidget(value: option),
          ),
        ),
      ),
    ],
  );
}

class _BattleResult extends ConsumerWidget {
  const _BattleResult({required this.room});
  final BattleRoom room;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mine = room.participants.where((p) => p.isCurrent).firstOrNull;
    return Scaffold(
      appBar: AppBar(title: const Text('Результат битвы')),
      body: FutureBuilder<BattleResult>(
        future: ref.read(apiClientProvider).getBattleResult(room.id),
        builder: (context, snapshot) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  room.winnerId == mine?.userId
                      ? 'Победа'
                      : room.isDraw
                      ? 'Ничья'
                      : 'Битва завершена',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                Text(
                  'Результаты',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                ...room.participants.map(
                  (participant) => ListTile(
                    title: Text(
                      '${participant.displayName ?? participant.username}'
                      '${participant.isCurrent ? ' · вы' : ''}',
                    ),
                    subtitle: Text(
                      '${participant.correctCount ?? 0} из ${room.questionCount} верно · '
                      '${((participant.durationMs ?? 0) / 1000).toStringAsFixed(1)} с',
                    ),
                  ),
                ),
                if (snapshot.hasData) ...[
                  const SizedBox(height: 16),
                  ...snapshot.data!.review
                      .where((item) => !item.correct)
                      .map(
                        (item) => ListTile(
                          title: Text(
                            'Ваш ответ: ${item.given.isEmpty ? 'нет ответа' : item.given}',
                          ),
                          subtitle: Text('Правильный: ${item.expected}'),
                        ),
                      ),
                ],
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: () async {
                    try {
                      final rematch = await ref
                          .read(apiClientProvider)
                          .rematchBattle(room.id, const Uuid().v4());
                      if (context.mounted) {
                        context.go(
                          '/battle/${rematch.id}?invite=${Uri.encodeComponent(rematch.inviteToken)}',
                        );
                      }
                    } catch (_) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Не удалось создать реванш'),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text('Реванш'),
                ),
                TextButton(
                  onPressed: () => context.go('/set/${room.setId}/study'),
                  child: const Text('К набору'),
                ),
                TextButton(
                  onPressed: () => context.go('/set/${room.setId}/study/learn'),
                  child: const Text('Заучивать ошибки'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
