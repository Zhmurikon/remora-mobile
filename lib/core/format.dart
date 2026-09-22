/// Форматирование интервалов повторения — порт `packages/core/src/format.ts`.
/// Русское склонение числительных + человекочитаемые интервалы для кнопок самооценки.
library;

/// Русское склонение числительных.
/// `plural(5, ['карточка', 'карточки', 'карточек'])` → `'карточек'`
String plural(int count, List<String> forms) {
  final mod10 = count % 10;
  final mod100 = count % 100;
  if (mod10 == 1 && mod100 != 11) return forms[0];
  if (mod10 >= 2 && mod10 <= 4 && (mod100 < 12 || mod100 > 14)) return forms[1];
  return forms[2];
}

String pluralWithCount(int count, List<String> forms) {
  return '$count ${plural(count, forms)}';
}

/// Человекочитаемый интервал повторения от числа дней.
String formatInterval(double days) {
  if (days < 1 / 24) {
    final minutes = (days * 24 * 60).round().clamp(1, 99999);
    return pluralWithCount(minutes, ['минута', 'минуты', 'минут']);
  }
  if (days < 1) {
    final hours = (days * 24).round().clamp(1, 99999);
    return pluralWithCount(hours, ['час', 'часа', 'часов']);
  }
  if (days < 30) {
    final d = days.round();
    return pluralWithCount(d, ['день', 'дня', 'дней']);
  }
  if (days < 365) {
    final months = ((days / 30.4) * 10).round() / 10;
    return '${_fmt(months)} ${plural(months.round(), ['месяц', 'месяца', 'месяцев'])}';
  }
  final years = ((days / 365) * 10).round() / 10;
  return '${_fmt(years)} ${plural(years.round(), ['год', 'года', 'лет'])}';
}

String _fmt(double v) => v == v.roundToDouble() ? '${v.toInt()}' : '$v';

/// То же, но от секунд: планировщик отдаёт интервалы именно в них.
String formatIntervalSeconds(int seconds) {
  return formatInterval(seconds / 86400);
}
