import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:memory_minder_app/i18n/generated/locale_keys.dart';
import 'package:memory_minder_app/i18n/i18n_func.dart';
import 'package:memory_minder_app/utils/utils.dart';

class TermsAndPrivacy extends StatefulWidget {
  const TermsAndPrivacy({super.key});

  @override
  TermsAndPrivacyState createState() => TermsAndPrivacyState();
}

class TermsAndPrivacyState extends State<TermsAndPrivacy> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: RichText(
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
                    decorationColor: Utils.getThemeColorScheme(context).primary,
                  ),
              recognizer: TapGestureRecognizer()..onTap = () => debugPrint('Tap Here Terms'),
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
                    decorationColor: Utils.getThemeColorScheme(context).primary,
                  ),
              recognizer: TapGestureRecognizer()..onTap = () => debugPrint('Tap Here Privacy'),
            ),
            TextSpan(
              text: " ${I18nFunc.getLocaleMessage(LocaleKeys.termsTextPartEnd)}",
              style: Utils.getTextTheme(context).bodySmall?.copyWith(
                    color: Utils.getThemeColorScheme(context).onSurface,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
