import 'package:flutter/material.dart';

import '../../app/theme.dart';

/// Настройки адаптивного «Заучивания»: какие упражнения включены, сколько
/// успешных ответов нужно на карточку, как проверяется написанный ответ.
///
/// Порт `LearnSettingsControls.tsx` — те же поля, пресеты и формулировки,
/// чтобы веб, боты и мобильное приложение вели себя одинаково.
class LearnPreferences {
  const LearnPreferences({
    required this.questionTypes,
    required this.successesRequired,
    required this.typingCheck,
    required this.matchPercent,
  });

  final List<String> questionTypes;
  final int successesRequired;
  final String typingCheck;
  final int matchPercent;

  LearnPreferences copyWith({
    List<String>? questionTypes,
    int? successesRequired,
    String? typingCheck,
    int? matchPercent,
  }) {
    return LearnPreferences(
      questionTypes: questionTypes ?? this.questionTypes,
      successesRequired: successesRequired ?? this.successesRequired,
      typingCheck: typingCheck ?? this.typingCheck,
      matchPercent: matchPercent ?? this.matchPercent,
    );
  }
}

const defaultLearnPreferences = LearnPreferences(
  questionTypes: ['choice', 'typing', 'recall'],
  successesRequired: 1,
  typingCheck: 'automatic',
  matchPercent: 90,
);

class _Preset {
  const _Preset(this.label, this.value);
  final String label;
  final LearnPreferences value;
}

const _presets = [
  _Preset(
    'Быстро',
    LearnPreferences(
      questionTypes: ['choice', 'recall'],
      successesRequired: 1,
      typingCheck: 'automatic',
      matchPercent: 80,
    ),
  ),
  _Preset('Обычно', defaultLearnPreferences),
  _Preset(
    'Тщательно',
    LearnPreferences(
      questionTypes: ['choice', 'typing', 'recall'],
      successesRequired: 3,
      typingCheck: 'automatic',
      matchPercent: 95,
    ),
  ),
];

const _questionTypeLabels = [
  ('choice', 'Выбор ответа'),
  ('typing', 'Написание ответа'),
  ('recall', 'Карточка с самооценкой'),
];

class LearnSettingsControls extends StatelessWidget {
  const LearnSettingsControls({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final LearnPreferences value;
  final ValueChanged<LearnPreferences> onChanged;

  void _toggleType(String type) {
    final enabled = value.questionTypes.contains(type);
    final next = enabled
        ? value.questionTypes.where((t) => t != type).toList()
        : [...value.questionTypes, type];
    onChanged(value.copyWith(questionTypes: next));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final subtle =
        isDark ? RemoraColors.darkFgSubtle : RemoraColors.lightFgSubtle;
    final border = isDark ? RemoraColors.darkBorder : RemoraColors.lightBorder;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Готовые варианты', style: theme.textTheme.labelLarge),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _presets
              .map((preset) => OutlinedButton(
                    onPressed: () => onChanged(preset.value),
                    child: Text(preset.label),
                  ))
              .toList(),
        ),
        const SizedBox(height: 8),
        Text(
          '«Быстро» — одно узнавание, «Обычно» — адаптивный режим, '
          '«Тщательно» — три успешных ответа.',
          style: theme.textTheme.bodySmall?.copyWith(color: subtle),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: border),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Упражнения', style: theme.textTheme.titleSmall),
              const SizedBox(height: 4),
              Text(
                'Remora подбирает подходящий тип из включённых по тому, '
                'насколько хорошо знакома карточка.',
                style: theme.textTheme.bodySmall?.copyWith(color: subtle),
              ),
              const SizedBox(height: 8),
              for (final (type, label) in _questionTypeLabels)
                CheckboxListTile(
                  value: value.questionTypes.contains(type),
                  onChanged: (_) => _toggleType(type),
                  title: Text(label),
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text('Успешных ответов на карточку', style: theme.textTheme.labelLarge),
        const SizedBox(height: 4),
        Text(
          'Сколько раз нужно правильно ответить в одной сессии. Ошибки не '
          'сбрасывают уже набранные успехи.',
          style: theme.textTheme.bodySmall?.copyWith(color: subtle),
        ),
        const SizedBox(height: 8),
        Row(
          children: List.generate(5, (i) {
            final n = i + 1;
            final selected = value.successesRequired == n;
            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: i < 4 ? 8 : 0),
                child: SizedBox(
                  height: 44,
                  child: OutlinedButton(
                    onPressed: () =>
                        onChanged(value.copyWith(successesRequired: n)),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: selected
                          ? theme.colorScheme.primary
                          : null,
                      foregroundColor:
                          selected ? theme.colorScheme.onPrimary : null,
                    ),
                    child: Text('$n'),
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 20),
        Text('Проверка написанного ответа', style: theme.textTheme.labelLarge),
        const SizedBox(height: 8),
        SegmentedButton<String>(
          segments: const [
            ButtonSegment(
              value: 'automatic',
              label: Text('Автоматически'),
            ),
            ButtonSegment(
              value: 'self_check',
              label: Text('Самооценка'),
            ),
          ],
          selected: {value.typingCheck},
          onSelectionChanged: (selection) =>
              onChanged(value.copyWith(typingCheck: selection.first)),
        ),
        const SizedBox(height: 4),
        Text(
          'Самооценка полезна для длинных определений, где важен смысл, '
          'а не дословная формулировка.',
          style: theme.textTheme.bodySmall?.copyWith(color: subtle),
        ),
        const SizedBox(height: 20),
        Opacity(
          opacity: value.typingCheck == 'self_check' ? 0.5 : 1,
          child: IgnorePointer(
            ignoring: value.typingCheck == 'self_check',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Минимальное совпадение: ${value.matchPercent}%',
                    style: theme.textTheme.labelLarge),
                Slider(
                  value: value.matchPercent.toDouble(),
                  min: 50,
                  max: 100,
                  divisions: 10,
                  label: '${value.matchPercent}%',
                  onChanged: (v) =>
                      onChanged(value.copyWith(matchPercent: v.round())),
                ),
                Text(
                  'Доля совпавших символов после нормализации регистра и '
                  'пробелов. Рекомендуем 90%.',
                  style: theme.textTheme.bodySmall?.copyWith(color: subtle),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
