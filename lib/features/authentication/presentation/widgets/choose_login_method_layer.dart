import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:memory_minder_app/constant/app_assets.dart';
import 'package:memory_minder_app/constant/app_colors.dart';
import 'package:memory_minder_app/constant/app_text_styles.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/app_filled_button.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/other_login_method.dart';
import 'package:memory_minder_app/features/authentication/presentation/widgets/terms_and_privacy.dart';
import 'package:memory_minder_app/i18n/generated/locale_keys.dart';
import 'package:memory_minder_app/i18n/i18n_func.dart';
import 'package:memory_minder_app/utils/utils.dart';

class ChooseLoginMethodLayer extends StatefulWidget {
  const ChooseLoginMethodLayer({
    super.key,
    required this.pageViewController,
    required this.onPressContinueWithEmail,
    required this.partLoginWithEmail,
  });

  final PageController pageViewController;
  final void Function() onPressContinueWithEmail;
  final bool partLoginWithEmail;

  @override
  ChooseLoginMethodLayerState createState() => ChooseLoginMethodLayerState();
}

class ChooseLoginMethodLayerState extends State<ChooseLoginMethodLayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.partLoginWithEmail ? _logoAndAppName() : _title(context),
          _loginAction(context),
          const TermsAndPrivacy(),
        ],
      ),
    );
  }

  Column _logoAndAppName() {
    return Column(
      children: [
        Image.asset(
          AppOtherIcons.logo,
          width: 200,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              I18nFunc.getLocaleMessage(LocaleKeys.appNamePart1),
              style: AppTextStyles.custom.titleLogo.copyWith(color: AppColors.logoColor1),
            ),
            Text(
              " ${I18nFunc.getLocaleMessage(LocaleKeys.appNamePart2)}",
              style: AppTextStyles.custom.titleLogo.copyWith(color: AppColors.logoColor2),
            ),
          ],
        )
      ],
    );
  }

  Expanded _loginAction(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AppFilledButton(
            titleKey: LocaleKeys.authMethodEmailButtonTitle,
            onPressed: widget.onPressContinueWithEmail,
          ),
          Text(
            I18nFunc.getLocaleMessage(LocaleKeys.commonOrText),
            style: Utils.getTextTheme(context).bodySmall?.copyWith(
                  color: Utils.getThemeColorScheme(context).onSurface,
                ),
          ),
          const OtherLoginMethod(),
        ],
      ),
    );
  }

  Expanded _title(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            I18nFunc.getLocaleMessage(
              LocaleKeys.authMethodTitle,
            ),
            style: Utils.getTextTheme(context).displaySmall?.copyWith(
                  color: Utils.getThemeColorScheme(context).onSurface,
                ),
            textAlign: TextAlign.center,
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
        ],
      ),
    );
  }
}
