import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:memory_minder_app/constant/app_assets.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/app_filled_button.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/app_tonal_button.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/custom_onboarding_title.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/custom_tab_page_selector.dart';
import 'package:memory_minder_app/i18n/generated/locale_keys.dart';
import 'package:memory_minder_app/i18n/i18n_func.dart';
import 'package:memory_minder_app/utils/utils.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> with TickerProviderStateMixin {
  late PageController _pageViewController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    bool goToSelectLoginMethod = _currentPageIndex == 3;

    return Scaffold(
      body: PageView(
        children: [
          Stack(
            children: [
              PageView(
                onPageChanged: (index) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
                controller: _pageViewController,
                physics: const ClampingScrollPhysics(),
                children: [
                  _backgroundLayout(AppOtherImages.onboarding1),
                  _backgroundLayout(AppOtherImages.onboarding2),
                  _backgroundLayout(AppOtherImages.onboarding3),
                  _backgroundLayout(AppOtherImages.intro),
                ],
              ),
              Column(
                children: [
                  AnimatedContainer(
                    height: screenHeight / 100 * (goToSelectLoginMethod ? 50 : 60),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                  ),
                  AnimatedContainer(
                    height: screenHeight / 100 * (goToSelectLoginMethod ? 50 : 40),
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: Utils.getThemeColorScheme(context).surface,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(13),
                        topRight: Radius.circular(13),
                      ),
                      border: Border(
                        top: BorderSide(
                          width: 1,
                          color: Utils.getThemeColorScheme(context).outline,
                        ),
                      ),
                    ),
                    curve: Curves.linear,
                    child: goToSelectLoginMethod
                        ? Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    I18nFunc.getLocaleMessage(
                                      LocaleKeys.authMethodTitle,
                                    ),
                                    style: Utils.getTextTheme(context).displaySmall?.copyWith(
                                          color: Utils.getThemeColorScheme(context).onSurface,
                                        ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Text(
                                  I18nFunc.getLocaleMessage(
                                    LocaleKeys.authMethodSubTitle,
                                  ),
                                  style: Utils.getTextTheme(context).titleSmall?.copyWith(
                                        color: Utils.getThemeColorScheme(context).onSurface,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                                AppFilledButton(
                                  titleKey: LocaleKeys.authMethodEmailButtonTitle,
                                  onPressed: () {},
                                ),
                                Text(
                                  I18nFunc.getLocaleMessage(LocaleKeys.commonOrText),
                                  style: Utils.getTextTheme(context).bodySmall?.copyWith(
                                        color: Utils.getThemeColorScheme(context).onSurface,
                                      ),
                                ),
                                AppTonalButton(
                                  titleKey: LocaleKeys.authMethodEmailButtonTitle,
                                  onPressed: () {},
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 10,
                                      child: Container(
                                        margin: const EdgeInsets.only(right: 5),
                                        child: AppTonalButton(
                                          svgAsset: AppSvgIcons.google,
                                          onPressed: () {},
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 10,
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 5),
                                        child: AppTonalButton(
                                          svgAsset: AppSvgIcons.apple,
                                          onPressed: () {},
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                      text: "${I18nFunc.getLocaleMessage(LocaleKeys.termsTextPartStart)}\n",
                                      style: Utils.getTextTheme(context).bodySmall?.copyWith(
                                            color: Utils.getThemeColorScheme(context).onSurface,
                                          ),
                                      children: [
                                        TextSpan(
                                          text: I18nFunc.getLocaleMessage(LocaleKeys.commonTerms),
                                          style: Utils.getTextTheme(context).bodySmall?.copyWith(
                                                color: Utils.getThemeColorScheme(context).primary,
                                                decoration: TextDecoration.underline,
                                              ),
                                          recognizer: TapGestureRecognizer()..onTap = () => print('Tap Here Terms'),
                                        ),
                                        TextSpan(
                                          text: " ${I18nFunc.getLocaleMessage(LocaleKeys.commonAnd)} ",
                                          style: Utils.getTextTheme(context).bodySmall?.copyWith(
                                                color: Utils.getThemeColorScheme(context).onSurface,
                                              ),
                                        ),
                                        TextSpan(
                                          text: " ${I18nFunc.getLocaleMessage(LocaleKeys.commonPrivacy)}",
                                          style: Utils.getTextTheme(context).bodySmall?.copyWith(
                                                color: Utils.getThemeColorScheme(context).primary,
                                                decoration: TextDecoration.underline,
                                              ),
                                          recognizer: TapGestureRecognizer()..onTap = () => print('Tap Here Privacy'),
                                        ),
                                        TextSpan(
                                          text: " ${I18nFunc.getLocaleMessage(LocaleKeys.termsTextPartEnd)}",
                                          style: Utils.getTextTheme(context).bodySmall?.copyWith(
                                                color: Utils.getThemeColorScheme(context).onSurface,
                                              ),
                                        ),
                                      ]),
                                ),
                              ],
                            ),
                          )
                        : onboardingLayer(context),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget onboardingLayer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomOnboardingTitle(currentPageIndex: _currentPageIndex),
                  CustomTabPageSelector(currentPageIndex: _currentPageIndex),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: AppFilledButton(
              titleKey: _currentPageIndex == 2 ? LocaleKeys.onboardingButtonStartedTitle : LocaleKeys.commonNext,
              onPressed: () {
                if (_currentPageIndex < 3) {
                  _pageViewController.animateToPage(
                    _currentPageIndex + 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Column _backgroundLayout(String imageName) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Image.asset(
            imageName,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        const Expanded(
          flex: 3,
          child: SizedBox(),
        ),
      ],
    );
  }
}
