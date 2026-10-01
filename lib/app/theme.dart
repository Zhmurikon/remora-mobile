import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Базовая палитра «Живой тетради знаний».
///
/// Виджеты используют роли [ColorScheme] и [RemoraThemeTokens], а не эти
/// значения напрямую. Публичные имена сохранены для постепенного переноса
/// существующих экранов без смешивания двух палитр.
abstract final class RemoraColors {
  // Светлая тема: бумага, хвойные чернила, нефрит и тёплые пометки.
  static const lightBg = Color(0xFFF8F4EA);
  static const lightSurface = Color(0xFFFFFCF6);
  static const lightSurfaceMuted = Color(0xFFF1ECE0);
  static const lightSurfaceElevated = Color(0xFFE8E1D2);
  static const lightBorder = Color(0xFFD8D2C4);
  static const lightBorderStrong = Color(0xFFB8B2A5);
  static const lightFg = Color(0xFF123B33);
  static const lightFgMuted = Color(0xFF52655E);
  static const lightFgSubtle = Color(0xFF707F79);
  static const lightPrimary = Color(0xFF087D67);
  static const lightPrimaryHover = Color(0xFF066552);
  static const lightPrimaryFg = Color(0xFFFFFFFF);
  static const lightPrimarySubtle = Color(0xFFD9F0E8);
  static const lightAccent = Color(0xFFE76F51);
  static const lightAccentFg = Color(0xFF3D120A);
  static const lightAccentSubtle = Color(0xFFFFE3D8);
  static const lightOchre = Color(0xFFC48718);
  static const lightOchreSubtle = Color(0xFFFFEBC2);
  static const lightSuccess = Color(0xFF167554);
  static const lightSuccessSubtle = Color(0xFFD9EFE4);
  static const lightWarning = Color(0xFF9A6810);
  static const lightWarningSubtle = Color(0xFFFFEBC2);
  static const lightDanger = Color(0xFFB43D3D);
  static const lightDangerSubtle = Color(0xFFF9DEDC);

  // Тёмная тема: чернильно-зелёная основа и самостоятельные тональные слои.
  static const darkBg = Color(0xFF061A16);
  static const darkSurface = Color(0xFF0B2821);
  static const darkSurfaceMuted = Color(0xFF10352B);
  static const darkSurfaceElevated = Color(0xFF174438);
  static const darkBorder = Color(0xFF31574D);
  static const darkBorderStrong = Color(0xFF52766C);
  static const darkFg = Color(0xFFF7F1E4);
  static const darkFgMuted = Color(0xFFB9C8C1);
  static const darkFgSubtle = Color(0xFF91A59D);
  static const darkPrimary = Color(0xFF58DDB9);
  static const darkPrimaryHover = Color(0xFF77E8C9);
  static const darkPrimaryFg = Color(0xFF063B30);
  static const darkPrimarySubtle = Color(0xFF174E40);
  static const darkAccent = Color(0xFFFF8168);
  static const darkAccentFg = Color(0xFF40130B);
  static const darkAccentSubtle = Color(0xFF51291F);
  static const darkOchre = Color(0xFFF2BC54);
  static const darkOchreSubtle = Color(0xFF4A3918);
  static const darkSuccess = Color(0xFF63D5A5);
  static const darkSuccessSubtle = Color(0xFF173F31);
  static const darkWarning = Color(0xFFF2BC54);
  static const darkWarningSubtle = Color(0xFF4A3918);
  static const darkDanger = Color(0xFFFF8A86);
  static const darkDangerSubtle = Color(0xFF512426);
}

/// Общие размеры интерфейса. Шкала остаётся кратной четырём.
abstract final class RemoraSpacing {
  static const xxs = 4.0;
  static const xs = 8.0;
  static const sm = 12.0;
  static const md = 16.0;
  static const lg = 20.0;
  static const xl = 24.0;
  static const xxl = 32.0;
  static const xxxl = 40.0;
  static const huge = 48.0;
}

abstract final class RemoraRadii {
  static const small = 10.0;
  static const control = 12.0;
  static const card = 16.0;
  static const large = 24.0;
}

abstract final class RemoraSizes {
  static const minTouchTarget = 48.0;
  static const navigationHeight = 72.0;
  static const thinLine = 1.0;
  static const strongLine = 2.0;
}

/// Роли, которых нет в стандартном [ColorScheme].
@immutable
class RemoraThemeTokens extends ThemeExtension<RemoraThemeTokens> {
  const RemoraThemeTokens({
    required this.background,
    required this.surfaceMuted,
    required this.surfaceElevated,
    required this.borderStrong,
    required this.textSubtle,
    required this.success,
    required this.successContainer,
    required this.onSuccessContainer,
    required this.warning,
    required this.warningContainer,
    required this.onWarningContainer,
    required this.ochre,
    required this.ochreContainer,
    required this.studySurface,
    required this.studyInk,
  });

  final Color background;
  final Color surfaceMuted;
  final Color surfaceElevated;
  final Color borderStrong;
  final Color textSubtle;
  final Color success;
  final Color successContainer;
  final Color onSuccessContainer;
  final Color warning;
  final Color warningContainer;
  final Color onWarningContainer;
  final Color ochre;
  final Color ochreContainer;
  final Color studySurface;
  final Color studyInk;

  @override
  RemoraThemeTokens copyWith({
    Color? background,
    Color? surfaceMuted,
    Color? surfaceElevated,
    Color? borderStrong,
    Color? textSubtle,
    Color? success,
    Color? successContainer,
    Color? onSuccessContainer,
    Color? warning,
    Color? warningContainer,
    Color? onWarningContainer,
    Color? ochre,
    Color? ochreContainer,
    Color? studySurface,
    Color? studyInk,
  }) {
    return RemoraThemeTokens(
      background: background ?? this.background,
      surfaceMuted: surfaceMuted ?? this.surfaceMuted,
      surfaceElevated: surfaceElevated ?? this.surfaceElevated,
      borderStrong: borderStrong ?? this.borderStrong,
      textSubtle: textSubtle ?? this.textSubtle,
      success: success ?? this.success,
      successContainer: successContainer ?? this.successContainer,
      onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
      warning: warning ?? this.warning,
      warningContainer: warningContainer ?? this.warningContainer,
      onWarningContainer: onWarningContainer ?? this.onWarningContainer,
      ochre: ochre ?? this.ochre,
      ochreContainer: ochreContainer ?? this.ochreContainer,
      studySurface: studySurface ?? this.studySurface,
      studyInk: studyInk ?? this.studyInk,
    );
  }

  @override
  RemoraThemeTokens lerp(covariant RemoraThemeTokens? other, double t) {
    if (other == null) return this;
    return RemoraThemeTokens(
      background: Color.lerp(background, other.background, t)!,
      surfaceMuted: Color.lerp(surfaceMuted, other.surfaceMuted, t)!,
      surfaceElevated: Color.lerp(surfaceElevated, other.surfaceElevated, t)!,
      borderStrong: Color.lerp(borderStrong, other.borderStrong, t)!,
      textSubtle: Color.lerp(textSubtle, other.textSubtle, t)!,
      success: Color.lerp(success, other.success, t)!,
      successContainer: Color.lerp(
        successContainer,
        other.successContainer,
        t,
      )!,
      onSuccessContainer: Color.lerp(
        onSuccessContainer,
        other.onSuccessContainer,
        t,
      )!,
      warning: Color.lerp(warning, other.warning, t)!,
      warningContainer: Color.lerp(
        warningContainer,
        other.warningContainer,
        t,
      )!,
      onWarningContainer: Color.lerp(
        onWarningContainer,
        other.onWarningContainer,
        t,
      )!,
      ochre: Color.lerp(ochre, other.ochre, t)!,
      ochreContainer: Color.lerp(ochreContainer, other.ochreContainer, t)!,
      studySurface: Color.lerp(studySurface, other.studySurface, t)!,
      studyInk: Color.lerp(studyInk, other.studyInk, t)!,
    );
  }
}

/// Типографические роли длинного чтения и учебных поверхностей.
@immutable
class RemoraTypography extends ThemeExtension<RemoraTypography> {
  const RemoraTypography({
    required this.readingTitle,
    required this.readingBody,
    required this.studyCard,
    required this.compactLabel,
  });

  final TextStyle readingTitle;
  final TextStyle readingBody;
  final TextStyle studyCard;
  final TextStyle compactLabel;

  @override
  RemoraTypography copyWith({
    TextStyle? readingTitle,
    TextStyle? readingBody,
    TextStyle? studyCard,
    TextStyle? compactLabel,
  }) {
    return RemoraTypography(
      readingTitle: readingTitle ?? this.readingTitle,
      readingBody: readingBody ?? this.readingBody,
      studyCard: studyCard ?? this.studyCard,
      compactLabel: compactLabel ?? this.compactLabel,
    );
  }

  @override
  RemoraTypography lerp(covariant RemoraTypography? other, double t) {
    if (other == null) return this;
    return RemoraTypography(
      readingTitle: TextStyle.lerp(readingTitle, other.readingTitle, t)!,
      readingBody: TextStyle.lerp(readingBody, other.readingBody, t)!,
      studyCard: TextStyle.lerp(studyCard, other.studyCard, t)!,
      compactLabel: TextStyle.lerp(compactLabel, other.compactLabel, t)!,
    );
  }
}

extension RemoraThemeContext on BuildContext {
  RemoraThemeTokens get remora =>
      Theme.of(this).extension<RemoraThemeTokens>()!;

  RemoraTypography get remoraType =>
      Theme.of(this).extension<RemoraTypography>()!;
}

ThemeData remoraLightTheme() => _buildTheme(Brightness.light);

ThemeData remoraDarkTheme() => _buildTheme(Brightness.dark);

ThemeData _buildTheme(Brightness brightness) {
  final dark = brightness == Brightness.dark;
  final background = dark ? RemoraColors.darkBg : RemoraColors.lightBg;
  final surface = dark ? RemoraColors.darkSurface : RemoraColors.lightSurface;
  final surfaceMuted = dark
      ? RemoraColors.darkSurfaceMuted
      : RemoraColors.lightSurfaceMuted;
  final surfaceElevated = dark
      ? RemoraColors.darkSurfaceElevated
      : RemoraColors.lightSurfaceElevated;
  final foreground = dark ? RemoraColors.darkFg : RemoraColors.lightFg;
  final foregroundMuted = dark
      ? RemoraColors.darkFgMuted
      : RemoraColors.lightFgMuted;
  final foregroundSubtle = dark
      ? RemoraColors.darkFgSubtle
      : RemoraColors.lightFgSubtle;
  final primary = dark ? RemoraColors.darkPrimary : RemoraColors.lightPrimary;
  final onPrimary = dark
      ? RemoraColors.darkPrimaryFg
      : RemoraColors.lightPrimaryFg;
  final primaryContainer = dark
      ? RemoraColors.darkPrimarySubtle
      : RemoraColors.lightPrimarySubtle;
  final secondary = dark ? RemoraColors.darkAccent : RemoraColors.lightAccent;
  final onSecondary = dark
      ? RemoraColors.darkAccentFg
      : RemoraColors.lightAccentFg;
  final secondaryContainer = dark
      ? RemoraColors.darkAccentSubtle
      : RemoraColors.lightAccentSubtle;
  final tertiary = dark ? RemoraColors.darkOchre : RemoraColors.lightOchre;
  final tertiaryContainer = dark
      ? RemoraColors.darkOchreSubtle
      : RemoraColors.lightOchreSubtle;
  final outline = dark ? RemoraColors.darkBorder : RemoraColors.lightBorder;
  final outlineStrong = dark
      ? RemoraColors.darkBorderStrong
      : RemoraColors.lightBorderStrong;
  final danger = dark ? RemoraColors.darkDanger : RemoraColors.lightDanger;
  final dangerContainer = dark
      ? RemoraColors.darkDangerSubtle
      : RemoraColors.lightDangerSubtle;

  final scheme =
      ColorScheme.fromSeed(seedColor: primary, brightness: brightness).copyWith(
        primary: primary,
        onPrimary: onPrimary,
        primaryContainer: primaryContainer,
        onPrimaryContainer: foreground,
        secondary: secondary,
        onSecondary: onSecondary,
        secondaryContainer: secondaryContainer,
        onSecondaryContainer: foreground,
        tertiary: tertiary,
        onTertiary: dark ? const Color(0xFF352607) : const Color(0xFFFFFFFF),
        tertiaryContainer: tertiaryContainer,
        onTertiaryContainer: foreground,
        error: danger,
        onError: dark ? const Color(0xFF4A090D) : const Color(0xFFFFFFFF),
        errorContainer: dangerContainer,
        onErrorContainer: foreground,
        surface: surface,
        onSurface: foreground,
        surfaceContainerLowest: background,
        surfaceContainerLow: surface,
        surfaceContainer: surfaceMuted,
        surfaceContainerHigh: surfaceElevated,
        surfaceContainerHighest: surfaceElevated,
        onSurfaceVariant: foregroundMuted,
        outline: outline,
        outlineVariant: outlineStrong,
        inverseSurface: dark ? RemoraColors.lightFg : RemoraColors.darkFg,
        onInverseSurface: dark ? RemoraColors.darkFg : RemoraColors.lightFg,
        inversePrimary: dark
            ? RemoraColors.lightPrimary
            : RemoraColors.darkPrimary,
        shadow: dark ? const Color(0xFF000000) : const Color(0xFF29443B),
        scrim: const Color(0xFF000000),
      );

  final textTheme = _textTheme(foreground, foregroundMuted);
  final controlShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(RemoraRadii.control),
  );
  final cardShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(RemoraRadii.card),
  );
  final overlayStyle = dark
      ? SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: background,
        )
      : SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: background,
        );

  return ThemeData(
    useMaterial3: true,
    brightness: brightness,
    colorScheme: scheme,
    scaffoldBackgroundColor: background,
    canvasColor: background,
    fontFamily: 'NotoSans',
    textTheme: textTheme,
    primaryTextTheme: textTheme,
    materialTapTargetSize: MaterialTapTargetSize.padded,
    visualDensity: VisualDensity.standard,
    splashFactory: InkSparkle.splashFactory,
    extensions: [
      RemoraThemeTokens(
        background: background,
        surfaceMuted: surfaceMuted,
        surfaceElevated: surfaceElevated,
        borderStrong: outlineStrong,
        textSubtle: foregroundSubtle,
        success: dark ? RemoraColors.darkSuccess : RemoraColors.lightSuccess,
        successContainer: dark
            ? RemoraColors.darkSuccessSubtle
            : RemoraColors.lightSuccessSubtle,
        onSuccessContainer: foreground,
        warning: dark ? RemoraColors.darkWarning : RemoraColors.lightWarning,
        warningContainer: dark
            ? RemoraColors.darkWarningSubtle
            : RemoraColors.lightWarningSubtle,
        onWarningContainer: foreground,
        ochre: tertiary,
        ochreContainer: tertiaryContainer,
        studySurface: surface,
        studyInk: foreground,
      ),
      RemoraTypography(
        readingTitle: TextStyle(
          color: foreground,
          fontFamily: 'NotoSerifDisplay',
          fontSize: 30,
          fontWeight: FontWeight.w600,
          height: 1.2,
          letterSpacing: -0.2,
        ),
        readingBody: TextStyle(
          color: foreground,
          fontSize: 18,
          fontWeight: FontWeight.w400,
          height: 1.75,
        ),
        studyCard: TextStyle(
          color: foreground,
          fontFamily: 'NotoSerifDisplay',
          fontSize: 30,
          fontWeight: FontWeight.w500,
          height: 1.3,
          letterSpacing: -0.15,
        ),
        compactLabel: TextStyle(
          color: foregroundSubtle,
          fontSize: 11,
          fontWeight: FontWeight.w700,
          height: 1.2,
          letterSpacing: 1.3,
        ),
      ),
    ],
    appBarTheme: AppBarTheme(
      backgroundColor: background,
      foregroundColor: foreground,
      surfaceTintColor: surfaceMuted,
      elevation: 0,
      scrolledUnderElevation: 1,
      centerTitle: false,
      titleTextStyle: textTheme.titleLarge,
      systemOverlayStyle: overlayStyle,
      iconTheme: IconThemeData(color: foreground, size: 24),
      actionsIconTheme: IconThemeData(color: foreground, size: 24),
    ),
    cardTheme: CardThemeData(
      color: surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: cardShape,
    ),
    listTileTheme: ListTileThemeData(
      iconColor: foreground,
      textColor: foreground,
      minTileHeight: RemoraSizes.minTouchTarget,
      minVerticalPadding: RemoraSpacing.sm,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: RemoraSpacing.md,
        vertical: RemoraSpacing.xxs,
      ),
      shape: cardShape,
    ),
    dividerTheme: DividerThemeData(
      color: outline,
      thickness: RemoraSizes.thinLine,
      space: RemoraSizes.thinLine,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: onPrimary,
        disabledBackgroundColor: surfaceElevated,
        disabledForegroundColor: foregroundSubtle,
        minimumSize: const Size(
          RemoraSizes.minTouchTarget,
          RemoraSizes.minTouchTarget,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: RemoraSpacing.lg,
          vertical: RemoraSpacing.sm,
        ),
        elevation: 0,
        shape: controlShape,
        textStyle: textTheme.labelLarge,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: onPrimary,
        disabledBackgroundColor: surfaceElevated,
        disabledForegroundColor: foregroundSubtle,
        minimumSize: const Size(
          RemoraSizes.minTouchTarget,
          RemoraSizes.minTouchTarget,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: RemoraSpacing.lg,
          vertical: RemoraSpacing.sm,
        ),
        shape: controlShape,
        textStyle: textTheme.labelLarge,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primary,
        minimumSize: const Size(
          RemoraSizes.minTouchTarget,
          RemoraSizes.minTouchTarget,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: RemoraSpacing.lg,
          vertical: RemoraSpacing.sm,
        ),
        side: BorderSide(color: outlineStrong),
        shape: controlShape,
        textStyle: textTheme.labelLarge,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primary,
        minimumSize: const Size(
          RemoraSizes.minTouchTarget,
          RemoraSizes.minTouchTarget,
        ),
        padding: const EdgeInsets.symmetric(horizontal: RemoraSpacing.sm),
        shape: controlShape,
        textStyle: textTheme.labelLarge,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: foreground,
        minimumSize: const Size.square(RemoraSizes.minTouchTarget),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surfaceMuted,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: RemoraSpacing.md,
        vertical: RemoraSpacing.sm,
      ),
      constraints: const BoxConstraints(minHeight: 52),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RemoraRadii.control),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RemoraRadii.control),
        borderSide: BorderSide(color: outline),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RemoraRadii.control),
        borderSide: BorderSide(color: primary, width: RemoraSizes.strongLine),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RemoraRadii.control),
        borderSide: BorderSide(color: danger),
      ),
      labelStyle: TextStyle(color: foregroundMuted),
      hintStyle: TextStyle(color: foregroundSubtle),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      height: RemoraSizes.navigationHeight,
      indicatorColor: primaryContainer,
      indicatorShape: const StadiumBorder(),
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      iconTheme: WidgetStateProperty.resolveWith((states) {
        return IconThemeData(
          color: states.contains(WidgetState.selected)
              ? primary
              : foregroundMuted,
          size: 23,
        );
      }),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        return textTheme.labelSmall?.copyWith(
          color: states.contains(WidgetState.selected)
              ? primary
              : foregroundMuted,
          fontWeight: states.contains(WidgetState.selected)
              ? FontWeight.w700
              : FontWeight.w500,
        );
      }),
    ),
    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: surface,
      indicatorColor: primaryContainer,
      selectedIconTheme: IconThemeData(color: primary),
      unselectedIconTheme: IconThemeData(color: foregroundMuted),
      selectedLabelTextStyle: textTheme.labelMedium?.copyWith(color: primary),
      unselectedLabelTextStyle: textTheme.labelMedium?.copyWith(
        color: foregroundMuted,
      ),
      useIndicator: true,
      labelType: NavigationRailLabelType.all,
    ),
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        minimumSize: const WidgetStatePropertyAll(
          Size(0, RemoraSizes.minTouchTarget),
        ),
        shape: WidgetStatePropertyAll(controlShape),
        side: WidgetStatePropertyAll(BorderSide(color: outline)),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.selected)
              ? primaryContainer
              : surface;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.selected)
              ? foreground
              : foregroundMuted;
        }),
      ),
    ),
    switchTheme: SwitchThemeData(
      materialTapTargetSize: MaterialTapTargetSize.padded,
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return primary;
        return surfaceElevated;
      }),
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return onPrimary;
        return foregroundMuted;
      }),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: surfaceMuted,
      selectedColor: primaryContainer,
      disabledColor: surfaceElevated,
      side: BorderSide(color: outline),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(RemoraRadii.control),
      ),
      labelStyle: textTheme.labelMedium!,
      padding: const EdgeInsets.symmetric(horizontal: RemoraSpacing.xs),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: dark ? RemoraColors.lightFg : RemoraColors.darkSurface,
      contentTextStyle: textTheme.bodyMedium?.copyWith(
        color: dark ? RemoraColors.darkFg : RemoraColors.lightSurface,
      ),
      actionTextColor: dark
          ? RemoraColors.darkPrimary
          : RemoraColors.lightPrimary,
      behavior: SnackBarBehavior.floating,
      shape: controlShape,
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: surface,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(RemoraRadii.large),
      ),
      titleTextStyle: textTheme.headlineSmall,
      contentTextStyle: textTheme.bodyLarge,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: surface,
      surfaceTintColor: Colors.transparent,
      modalBackgroundColor: surface,
      modalBarrierColor: scheme.scrim.withValues(alpha: 0.42),
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(RemoraRadii.large),
        ),
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: primary,
      linearTrackColor: surfaceElevated,
      circularTrackColor: surfaceElevated,
      linearMinHeight: 4,
    ),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: dark ? RemoraColors.lightFg : RemoraColors.darkSurface,
        borderRadius: BorderRadius.circular(RemoraRadii.small),
      ),
      textStyle: textTheme.bodySmall?.copyWith(
        color: dark ? RemoraColors.darkFg : RemoraColors.lightSurface,
      ),
      waitDuration: const Duration(milliseconds: 500),
    ),
    focusColor: primary.withValues(alpha: 0.16),
    hoverColor: primary.withValues(alpha: 0.08),
    highlightColor: primary.withValues(alpha: 0.10),
  );
}

TextTheme _textTheme(Color foreground, Color muted) {
  TextStyle style(
    double size,
    FontWeight weight, {
    double? height,
    double? letterSpacing,
    Color? color,
  }) => TextStyle(
    fontSize: size,
    fontWeight: weight,
    height: height,
    letterSpacing: letterSpacing,
    color: color ?? foreground,
  );

  return TextTheme(
    displayLarge: style(48, FontWeight.w700, height: 1.05, letterSpacing: -1.4),
    displayMedium: style(40, FontWeight.w700, height: 1.08, letterSpacing: -1),
    displaySmall: style(36, FontWeight.w700, height: 1.1, letterSpacing: -0.7),
    headlineLarge: style(
      32,
      FontWeight.w700,
      height: 1.12,
      letterSpacing: -0.45,
    ),
    headlineMedium: style(
      28,
      FontWeight.w700,
      height: 1.15,
      letterSpacing: -0.25,
    ),
    headlineSmall: style(24, FontWeight.w600, height: 1.2, letterSpacing: -0.1),
    titleLarge: style(22, FontWeight.w700, height: 1.2),
    titleMedium: style(18, FontWeight.w600, height: 1.3),
    titleSmall: style(16, FontWeight.w600, height: 1.35),
    bodyLarge: style(16, FontWeight.w400, height: 1.5),
    bodyMedium: style(14, FontWeight.w400, height: 1.45, color: muted),
    bodySmall: style(12, FontWeight.w400, height: 1.4, color: muted),
    labelLarge: style(14, FontWeight.w700, height: 1.25),
    labelMedium: style(12, FontWeight.w600, height: 1.25),
    labelSmall: style(11, FontWeight.w600, height: 1.2, letterSpacing: 0.1),
  );
}
