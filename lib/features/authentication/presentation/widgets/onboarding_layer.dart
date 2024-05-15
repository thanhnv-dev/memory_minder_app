import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/app_filled_button.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/onboarding_title.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/page_selector.dart';
import 'package:memory_minder_app/i18n/generated/locale_keys.dart';

class OnboardingLayer extends StatefulWidget {
  const OnboardingLayer({
    super.key,
    required this.authIndexPart,
    required this.pageViewController,
    required this.nextPart,
  });

  final int authIndexPart;
  final PageController pageViewController;
  final void Function() nextPart;

  @override
  OnboardingLayerState createState() => OnboardingLayerState();
}

class OnboardingLayerState extends State<OnboardingLayer> {
  @override
  Widget build(BuildContext context) {
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
                  OnboardingTitle(currentIndex: widget.authIndexPart),
                  PageSelector(currentIndex: widget.authIndexPart),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
            child: AppFilledButton(
              titleKey: widget.authIndexPart == 2 ? LocaleKeys.onboardingButtonStartedTitle : LocaleKeys.commonNext,
              onPressed: widget.nextPart,
            ),
          )
        ],
      ),
    );
  }
}
