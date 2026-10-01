import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remora_mobile/app/theme.dart';
import 'package:remora_mobile/widgets/remora_components.dart';

void main() {
  for (final entry in {
    'светлой': remoraLightTheme(),
    'тёмной': remoraDarkTheme(),
  }.entries) {
    testWidgets('общие компоненты отображаются в ${entry.key} теме', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(412, 1200);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        MaterialApp(
          theme: entry.value,
          home: Scaffold(
            body: ListView(
              children: [
                const RemoraScreenHeader(
                  title: 'Очень длинное название учебного раздела',
                  subtitle: 'Подзаголовок переносится и сохраняет иерархию',
                  motif: KnowledgeMotifType.books,
                ),
                Padding(
                  padding: const EdgeInsets.all(RemoraSpacing.md),
                  child: Column(
                    children: [
                      const RemoraSurface(
                        level: RemoraSurfaceLevel.tonal,
                        child: Text('Тональная поверхность'),
                      ),
                      const SizedBox(height: RemoraSpacing.md),
                      const RemoraListRow(
                        title: 'Набор по визуализации и анализу данных',
                        metadata: '173 карточки',
                        markerColor: RemoraColors.lightAccent,
                        trailing: RemoraOfflineStatus(
                          state: RemoraOfflineState.available,
                          compact: true,
                        ),
                      ),
                      const SizedBox(height: RemoraSpacing.md),
                      SizedBox(
                        height: 360,
                        child: RemoraStudySurface(
                          label: 'Вопрос',
                          child: Text('Почему повторение укрепляет память?'),
                        ),
                      ),
                      const RemoraStateView.empty(
                        title: 'Здесь пока пусто',
                        message: 'Сохраните первый курс, чтобы учиться офлайн.',
                      ),
                      RemoraBottomAction(
                        label: 'Продолжить обучение',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      expect(tester.takeException(), isNull);
      expect(find.text('Доступно офлайн'), findsNothing);
      expect(find.text('ВОПРОС'), findsNothing);
      expect(find.text('Тональная поверхность'), findsOneWidget);
      expect(find.byType(CustomPaint), findsWidgets);
    });
  }

  testWidgets('ошибка предлагает доступное повторное действие', (tester) async {
    var retried = false;
    await tester.pumpWidget(
      MaterialApp(
        theme: remoraLightTheme(),
        home: Scaffold(
          body: RemoraStateView.error(
            title: 'Не удалось загрузить курсы',
            message: 'Проверьте подключение и попробуйте снова.',
            onAction: () => retried = true,
          ),
        ),
      ),
    );

    final button = find.widgetWithText(FilledButton, 'Повторить');
    expect(tester.getSize(button).height, greaterThanOrEqualTo(48));
    await tester.tap(button);
    expect(retried, isTrue);
  });
}
