import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:memory_minder_app/constant/app_assets.dart';
import 'package:memory_minder_app/i18n/generated/locale_keys.dart';
import 'package:memory_minder_app/i18n/i18n_func.dart';

class AppBackButton extends StatefulWidget {
  const AppBackButton({
    super.key,
  });

  @override
  AppBackButtonState createState() => AppBackButtonState();
}

class AppBackButtonState extends State<AppBackButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        context.router.back();
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      icon: SvgPicture.asset(AppSvgIcons.arrowLeft),
      label: Text(
        I18nFunc.getLocaleMessage(LocaleKeys.commonBack),
      ),
    );
  }
}
