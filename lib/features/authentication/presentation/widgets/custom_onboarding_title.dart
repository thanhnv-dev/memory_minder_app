import 'package:flutter/material.dart';
import 'package:memory_minder_app/i18n/generated/locale_keys.dart';
import 'package:memory_minder_app/i18n/i18n_func.dart';
import 'package:memory_minder_app/utils/utils.dart';

class CustomOnboardingTitle extends StatelessWidget {
  const CustomOnboardingTitle({
    super.key,
    required int currentPageIndex,
  }) : _currentPageIndex = currentPageIndex;

  final int _currentPageIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _customTitle(
          context: context,
          index: 0,
          titleKey: LocaleKeys.onboardingFirstTitle,
          subTitleKey: LocaleKeys.onboardingFirstSubTitle,
        ),
        _customTitle(
          context: context,
          index: 1,
          titleKey: LocaleKeys.onboardingSecondTitle,
          subTitleKey: LocaleKeys.onboardingSecondSubTitle,
        ),
        _customTitle(
          context: context,
          index: 2,
          titleKey: LocaleKeys.onboardingThirdTitle,
          subTitleKey: LocaleKeys.onboardingThirdSubTitle,
        ),
      ],
    );
  }

  Widget _customTitle({
    required BuildContext context,
    required int index,
    required String titleKey,
    required String subTitleKey,
  }) {
    TextTheme textTheme = Utils.getTextTheme(context);
    ColorScheme colorScheme = Utils.getThemeColorScheme(context);
    return _currentPageIndex == index
        ? Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: Text(
                  I18nFunc.getLocaleMessage(
                    titleKey,
                  ),
                  style: textTheme.displaySmall?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                I18nFunc.getLocaleMessage(
                  subTitleKey,
                ),
                style: textTheme.titleSmall?.copyWith(
                  color: colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          )
        : const SizedBox();
  }
}
