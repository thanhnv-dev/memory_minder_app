import 'package:flutter/material.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/title_display_small.dart';
import 'package:memory_minder_app/i18n/generated/locale_keys.dart';
import 'package:memory_minder_app/i18n/i18n_func.dart';
import 'package:memory_minder_app/utils/utils.dart';

class OnboardingTitle extends StatelessWidget {
  const OnboardingTitle({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Utils.getTextTheme(context);
    ColorScheme colorScheme = Utils.getThemeColorScheme(context);
    return Stack(
      children: [
        _customTitle(
          show: currentIndex == 0,
          titleKey: LocaleKeys.onboardingFirstTitle,
          subTitleKey: LocaleKeys.onboardingFirstSubTitle,
          textTheme: textTheme,
          colorScheme: colorScheme,
        ),
        _customTitle(
          show: currentIndex == 1,
          titleKey: LocaleKeys.onboardingSecondTitle,
          subTitleKey: LocaleKeys.onboardingSecondSubTitle,
          textTheme: textTheme,
          colorScheme: colorScheme,
        ),
        _customTitle(
          show: currentIndex == 2,
          titleKey: LocaleKeys.onboardingThirdTitle,
          subTitleKey: LocaleKeys.onboardingThirdSubTitle,
          textTheme: textTheme,
          colorScheme: colorScheme,
        ),
      ],
    );
  }

  Widget _customTitle({
    required String titleKey,
    required String subTitleKey,
    required bool show,
    required TextTheme textTheme,
    required ColorScheme colorScheme,
  }) {
    return show
        ? Column(
            children: [
              TitleDisplaySmall(
                data: I18nFunc.getLocaleMessage(
                  titleKey,
                ),
                margin: const EdgeInsets.only(bottom: 10),
              ),
              Text(
                I18nFunc.getLocaleMessage(
                  subTitleKey,
                ),
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          )
        : const SizedBox();
  }
}
