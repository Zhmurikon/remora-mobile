import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/api_client.dart';
import '../../data/network_errors.dart';
import '../../data/repositories/outbox_service.dart';
import 'learn_settings_controls.dart';

/// Настройки заучивания для конкретного набора: типы упражнений, число
/// успешных ответов, способ проверки написанного. Переопределяют общие
/// настройки профиля только для этого набора — как на вебе и в ботах.
///
/// Работает и без сети: без ответа сервера экран показывает то, чем уже
/// пользуется офлайн-очередь заучивания, а сохранение откладывается в
/// локальную очередь и досылается при восстановлении связи (см.
/// `OutboxService._flushLearnSettings`). Новое значение при этом сразу
/// применяется к локальному кэшу — следующая офлайн-сессия его увидит,
/// не дожидаясь синхронизации.
class LearnSettingsScreen extends ConsumerStatefulWidget {
  const LearnSettingsScreen({
    super.key,
    required this.setId,
    required this.setTitle,
  });

  final String setId;
  final String setTitle;

  @override
  ConsumerState<LearnSettingsScreen> createState() =>
      _LearnSettingsScreenState();
}

class _LearnSettingsScreenState extends ConsumerState<LearnSettingsScreen> {
  LearnPreferences _value = defaultLearnPreferences;
  bool _customized = false;
  bool _offline = false;
  bool _loading = true;
  bool _saving = false;
  String? _loadError;
  String? _message;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _loadError = null;
    });

    try {
      final settings = await ref
          .read(apiClientProvider)
          .getSetLearnSettings(widget.setId);
      setState(() {
        _value = LearnPreferences(
          questionTypes: settings.questionTypes,
          successesRequired: settings.successesRequired,
          typingCheck: settings.typingCheck,
          matchPercent: settings.matchPercent,
        );
        _customized = settings.customized;
        _offline = false;
        _loading = false;
      });
      // Достучались до сервера — заодно отправим то, что могло скопиться офлайн.
      unawaited(ref.read(outboxServiceProvider).flush());
      return;
    } catch (e) {
      if (!isNetworkFailure(e)) {
        setState(() {
          _loadError = 'Не удалось загрузить настройки набора.';
          _loading = false;
        });
        return;
      }
    }

    // Сети нет — показываем то, чем уже пользуется офлайн-очередь заучивания,
    // поверх которого может лежать ещё не отправленное локальное изменение.
    final repo = ref.read(studyRepositoryProvider);
    final pending = await repo.getPendingLearnSettings(widget.setId);
    final cached = await repo.getCachedLearnSettings(widget.setId);
    setState(() {
      if (pending != null && pending.action == 'update') {
        _value = LearnPreferences(
          questionTypes:
              _decodeTypes(pending.questionTypes) ?? cached.questionTypes,
          successesRequired: pending.successesRequired ?? cached.successesRequired,
          typingCheck: pending.typingCheck ?? cached.typingCheck,
          matchPercent: pending.matchPercent ?? cached.matchPercent,
        );
        _customized = true;
      } else {
        _value = LearnPreferences(
          questionTypes: cached.questionTypes,
          successesRequired: cached.successesRequired,
          typingCheck: cached.typingCheck,
          matchPercent: cached.matchPercent,
        );
        _customized = false;
      }
      _offline = true;
      _loading = false;
    });
  }

  Future<void> _save() async {
    if (_value.questionTypes.isEmpty) {
      setState(() => _message = 'Выберите хотя бы один тип упражнения');
      return;
    }
    setState(() {
      _saving = true;
      _message = null;
    });

    final repo = ref.read(studyRepositoryProvider);
    try {
      final settings = await ref.read(apiClientProvider).updateSetLearnSettings(
            widget.setId,
            SetLearnSettingsInput(
              questionTypes: _value.questionTypes,
              successesRequired: _value.successesRequired,
              typingCheck: _value.typingCheck,
              matchPercent: _value.matchPercent,
            ),
          );
      await repo.clearPendingLearnSettings(widget.setId);
      setState(() {
        _customized = settings.customized;
        _offline = false;
        _message = 'Настройки этого набора сохранены';
        _saving = false;
      });
    } catch (e) {
      if (!isNetworkFailure(e)) {
        setState(() {
          _message = 'Не удалось сохранить';
          _saving = false;
        });
        return;
      }
      await repo.stagePendingLearnSettingsUpdate(
        widget.setId,
        _value.questionTypes,
        _value.successesRequired,
        _value.typingCheck,
        _value.matchPercent,
      );
      setState(() {
        _customized = true;
        _offline = true;
        _message = 'Сети нет — сохранили на устройстве, отправим при подключении';
        _saving = false;
      });
    }
  }

  Future<void> _reset() async {
    setState(() {
      _saving = true;
      _message = null;
    });

    final repo = ref.read(studyRepositoryProvider);
    try {
      await ref.read(apiClientProvider).resetSetLearnSettings(widget.setId);
      await repo.clearPendingLearnSettings(widget.setId);
      await _load();
      setState(() => _message = 'Снова используются общие настройки');
    } catch (e) {
      if (!isNetworkFailure(e)) {
        setState(() => _message = 'Не удалось вернуть общие настройки');
      } else {
        await repo.stagePendingLearnSettingsReset(widget.setId);
        setState(() {
          _customized = false;
          _offline = true;
          _message = 'Сети нет — вернём общие настройки при подключении';
        });
      }
    } finally {
      setState(() => _saving = false);
    }
  }

  List<String>? _decodeTypes(String? raw) {
    if (raw == null) return null;
    try {
      final decoded = jsonDecode(raw);
      return decoded is List ? decoded.map((e) => e.toString()).toList() : null;
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Настройки — ${widget.setTitle}')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _loadError != null
              ? Center(child: Text(_loadError!))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (_offline) ...[
                        _buildOfflineNotice(context),
                        const SizedBox(height: 12),
                      ],
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Изменения применятся только к этому набору. '
                              'Общие настройки профиля останутся прежними.',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                          if (_customized) ...[
                            const SizedBox(width: 8),
                            const Chip(label: Text('Для этого набора')),
                          ],
                        ],
                      ),
                      const SizedBox(height: 20),
                      LearnSettingsControls(
                        value: _value,
                        onChanged: (v) => setState(() => _value = v),
                      ),
                      if (_message != null) ...[
                        const SizedBox(height: 16),
                        Text(
                          _message!,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 48,
                        child: FilledButton(
                          onPressed: _saving ? null : _save,
                          child: _saving
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text('Сохранить для набора'),
                        ),
                      ),
                      if (_customized) ...[
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 48,
                          child: OutlinedButton(
                            onPressed: _saving ? null : _reset,
                            child: const Text('Использовать общие'),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
    );
  }

  Widget _buildOfflineNotice(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.cloud_off, size: 18, color: theme.colorScheme.onSecondaryContainer),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Нет сети — показаны настройки с устройства. Изменения сохранятся '
              'локально и отправятся на сервер при подключении.',
              style: theme.textTheme.bodySmall
                  ?.copyWith(color: theme.colorScheme.onSecondaryContainer),
            ),
          ),
        ],
      ),
    );
  }
}
