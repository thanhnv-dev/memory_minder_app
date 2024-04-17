import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_minder_app/constant/app_assets.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/custome_tab_page_selector.dart';
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
                ],
              ),
              Column(
                children: [
                  const Expanded(
                    flex: 6,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      width: double.infinity,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  I18nFunc.getLocaleMessage(
                                    LocaleKeys.onboardingFirstTitle,
                                  ),
                                  style: Utils.getTextTheme(context).displaySmall?.copyWith(
                                        color: Utils.getThemeColorScheme(context).onSurface,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Text(
                                I18nFunc.getLocaleMessage(
                                  LocaleKeys.onboardingFirstSubTitle,
                                ),
                                style: Utils.getTextTheme(context).titleSmall?.copyWith(
                                      color: Utils.getThemeColorScheme(context).onSurface,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          CustomeTabPageSelector(currentPageIndex: _currentPageIndex),
                          FilledButton(
                            style: FilledButton.styleFrom(
                                fixedSize: const Size(double.maxFinite, 54),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                )),
                            onPressed: () {},
                            child: Text(
                              I18nFunc.getLocaleMessage(LocaleKeys.commonNext),
                              style: Utils.getTextTheme(context).titleMedium?.copyWith(
                                    color: Utils.getThemeColorScheme(context).onPrimary,
                                  ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
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
