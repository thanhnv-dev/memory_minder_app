import "package:flutter/material.dart";
import "package:memory_minder_app/constant/app_text_styles.dart";

final TextTheme appTextTheme = TextTheme(
  displayLarge: AppTextStyles.display.large,
  displayMedium: AppTextStyles.display.medium,
  displaySmall: AppTextStyles.display.small,
  headlineLarge: AppTextStyles.headline.large,
  headlineMedium: AppTextStyles.headline.medium,
  headlineSmall: AppTextStyles.headline.small,
  titleLarge: AppTextStyles.title.large,
  titleMedium: AppTextStyles.title.medium,
  titleSmall: AppTextStyles.title.small,
  labelLarge: AppTextStyles.label.large,
  labelMedium: AppTextStyles.label.medium,
  labelSmall: AppTextStyles.label.small,
  bodyLarge: AppTextStyles.body.large,
  bodyMedium: AppTextStyles.body.medium,
  bodySmall: AppTextStyles.body.small,
);

final ThemeData appLightTheme = MaterialTheme(
  appTextTheme,
  scheme: MaterialTheme.lightScheme(),
).light();

final ThemeData appDarkTheme = MaterialTheme(
  appTextTheme,
  scheme: MaterialTheme.darkScheme(),
).dark();

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme, {required scheme});

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff406836),
      surfaceTint: Color(0xff406836),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffc0efb0),
      onPrimaryContainer: Color(0xff002200),
      secondary: Color(0xff54634d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffd7e8cd),
      onSecondaryContainer: Color(0xff121f0e),
      tertiary: Color(0xff386568),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffbcebee),
      onTertiaryContainer: Color(0xff002022),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xfff8fbf1),
      onBackground: Color(0xff191d17),
      surface: Color(0xfff8fbf1),
      onSurface: Color(0xff191d17),
      surfaceVariant: Color(0xffdfe4d7),
      onSurfaceVariant: Color(0xff43483f),
      outline: Color(0xff73796e),
      outlineVariant: Color(0xffc3c8bc),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e322b),
      inverseOnSurface: Color(0xffeff2e8),
      inversePrimary: Color(0xffa5d396),
      primaryFixed: Color(0xffc0efb0),
      onPrimaryFixed: Color(0xff002200),
      primaryFixedDim: Color(0xffa5d396),
      onPrimaryFixedVariant: Color(0xff285020),
      secondaryFixed: Color(0xffd7e8cd),
      onSecondaryFixed: Color(0xff121f0e),
      secondaryFixedDim: Color(0xffbbcbb2),
      onSecondaryFixedVariant: Color(0xff3c4b37),
      tertiaryFixed: Color(0xffbcebee),
      onTertiaryFixed: Color(0xff002022),
      tertiaryFixedDim: Color(0xffa0cfd2),
      onTertiaryFixedVariant: Color(0xff1e4d50),
      surfaceDim: Color(0xffd8dbd2),
      surfaceBright: Color(0xfff8fbf1),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f5eb),
      surfaceContainer: Color(0xffecefe5),
      surfaceContainerHigh: Color(0xffe6e9e0),
      surfaceContainerHighest: Color(0xffe1e4da),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff244b1d),
      surfaceTint: Color(0xff406836),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff557f4a),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff384733),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff6a7963),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff19494c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff4f7c7f),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfff8fbf1),
      onBackground: Color(0xff191d17),
      surface: Color(0xfff8fbf1),
      onSurface: Color(0xff191d17),
      surfaceVariant: Color(0xffdfe4d7),
      onSurfaceVariant: Color(0xff3f453b),
      outline: Color(0xff5b6157),
      outlineVariant: Color(0xff777d72),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e322b),
      inverseOnSurface: Color(0xffeff2e8),
      inversePrimary: Color(0xffa5d396),
      primaryFixed: Color(0xff557f4a),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff3d6634),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff6a7963),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff51604b),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff4f7c7f),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff366366),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd8dbd2),
      surfaceBright: Color(0xfff8fbf1),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f5eb),
      surfaceContainer: Color(0xffecefe5),
      surfaceContainerHigh: Color(0xffe6e9e0),
      surfaceContainerHighest: Color(0xffe1e4da),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff012901),
      surfaceTint: Color(0xff406836),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff244b1d),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff182614),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff384733),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff002729),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff19494c),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfff8fbf1),
      onBackground: Color(0xff191d17),
      surface: Color(0xfff8fbf1),
      onSurface: Color(0xff000000),
      surfaceVariant: Color(0xffdfe4d7),
      onSurfaceVariant: Color(0xff20251d),
      outline: Color(0xff3f453b),
      outlineVariant: Color(0xff3f453b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e322b),
      inverseOnSurface: Color(0xffffffff),
      inversePrimary: Color(0xffcaf9b9),
      primaryFixed: Color(0xff244b1d),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff0d3408),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff384733),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff23301e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff19494c),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff003235),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd8dbd2),
      surfaceBright: Color(0xfff8fbf1),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f5eb),
      surfaceContainer: Color(0xffecefe5),
      surfaceContainerHigh: Color(0xffe6e9e0),
      surfaceContainerHighest: Color(0xffe1e4da),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa5d396),
      surfaceTint: Color(0xffa5d396),
      onPrimary: Color(0xff11380b),
      primaryContainer: Color(0xff285020),
      onPrimaryContainer: Color(0xffc0efb0),
      secondary: Color(0xffbbcbb2),
      onSecondary: Color(0xff263422),
      secondaryContainer: Color(0xff3c4b37),
      onSecondaryContainer: Color(0xffd7e8cd),
      tertiary: Color(0xffa0cfd2),
      onTertiary: Color(0xff003739),
      tertiaryContainer: Color(0xff1e4d50),
      onTertiaryContainer: Color(0xffbcebee),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      background: Color(0xff11140f),
      onBackground: Color(0xffe1e4da),
      surface: Color(0xff11140f),
      onSurface: Color(0xffe1e4da),
      surfaceVariant: Color(0xff43483f),
      onSurfaceVariant: Color(0xffc3c8bc),
      outline: Color(0xff8d9387),
      outlineVariant: Color(0xff43483f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e4da),
      inverseOnSurface: Color(0xff2e322b),
      inversePrimary: Color(0xff406836),
      primaryFixed: Color(0xffc0efb0),
      onPrimaryFixed: Color(0xff002200),
      primaryFixedDim: Color(0xffa5d396),
      onPrimaryFixedVariant: Color(0xff285020),
      secondaryFixed: Color(0xffd7e8cd),
      onSecondaryFixed: Color(0xff121f0e),
      secondaryFixedDim: Color(0xffbbcbb2),
      onSecondaryFixedVariant: Color(0xff3c4b37),
      tertiaryFixed: Color(0xffbcebee),
      onTertiaryFixed: Color(0xff002022),
      tertiaryFixedDim: Color(0xffa0cfd2),
      onTertiaryFixedVariant: Color(0xff1e4d50),
      surfaceDim: Color(0xff11140f),
      surfaceBright: Color(0xff363a34),
      surfaceContainerLowest: Color(0xff0b0f0a),
      surfaceContainerLow: Color(0xff191d17),
      surfaceContainer: Color(0xff1d211b),
      surfaceContainerHigh: Color(0xff272b25),
      surfaceContainerHighest: Color(0xff32362f),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa9d79a),
      surfaceTint: Color(0xffa5d396),
      onPrimary: Color(0xff001c00),
      primaryContainer: Color(0xff719c64),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffbfd0b6),
      onSecondary: Color(0xff0d1909),
      secondaryContainer: Color(0xff86957e),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffa4d3d6),
      onTertiary: Color(0xff001a1c),
      tertiaryContainer: Color(0xff6b989c),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff11140f),
      onBackground: Color(0xffe1e4da),
      surface: Color(0xff11140f),
      onSurface: Color(0xfff9fcf2),
      surfaceVariant: Color(0xff43483f),
      onSurfaceVariant: Color(0xffc7cdc0),
      outline: Color(0xff9fa599),
      outlineVariant: Color(0xff7f857a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e4da),
      inverseOnSurface: Color(0xff272b25),
      inversePrimary: Color(0xff295121),
      primaryFixed: Color(0xffc0efb0),
      onPrimaryFixed: Color(0xff001600),
      primaryFixedDim: Color(0xffa5d396),
      onPrimaryFixedVariant: Color(0xff173e11),
      secondaryFixed: Color(0xffd7e8cd),
      onSecondaryFixed: Color(0xff081405),
      secondaryFixedDim: Color(0xffbbcbb2),
      onSecondaryFixedVariant: Color(0xff2c3a27),
      tertiaryFixed: Color(0xffbcebee),
      onTertiaryFixed: Color(0xff001416),
      tertiaryFixedDim: Color(0xffa0cfd2),
      onTertiaryFixedVariant: Color(0xff073d3f),
      surfaceDim: Color(0xff11140f),
      surfaceBright: Color(0xff363a34),
      surfaceContainerLowest: Color(0xff0b0f0a),
      surfaceContainerLow: Color(0xff191d17),
      surfaceContainer: Color(0xff1d211b),
      surfaceContainerHigh: Color(0xff272b25),
      surfaceContainerHighest: Color(0xff32362f),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff1ffe8),
      surfaceTint: Color(0xffa5d396),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffa9d79a),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfff1ffe8),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffbfd0b6),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffecfeff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffa4d3d6),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff11140f),
      onBackground: Color(0xffe1e4da),
      surface: Color(0xff11140f),
      onSurface: Color(0xffffffff),
      surfaceVariant: Color(0xff43483f),
      onSurfaceVariant: Color(0xfff7fdef),
      outline: Color(0xffc7cdc0),
      outlineVariant: Color(0xffc7cdc0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e4da),
      inverseOnSurface: Color(0xff000000),
      inversePrimary: Color(0xff093106),
      primaryFixed: Color(0xffc4f4b4),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffa9d79a),
      onPrimaryFixedVariant: Color(0xff001c00),
      secondaryFixed: Color(0xffdbecd1),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffbfd0b6),
      onSecondaryFixedVariant: Color(0xff0d1909),
      tertiaryFixed: Color(0xffc0eff3),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffa4d3d6),
      onTertiaryFixedVariant: Color(0xff001a1c),
      surfaceDim: Color(0xff11140f),
      surfaceBright: Color(0xff363a34),
      surfaceContainerLowest: Color(0xff0b0f0a),
      surfaceContainerLow: Color(0xff191d17),
      surfaceContainer: Color(0xff1d211b),
      surfaceContainerHigh: Color(0xff272b25),
      surfaceContainerHighest: Color(0xff32362f),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;

  static light() {}
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
