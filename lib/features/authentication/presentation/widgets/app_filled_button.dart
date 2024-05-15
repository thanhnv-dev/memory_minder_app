import 'package:flutter/material.dart';
import 'package:memory_minder_app/i18n/i18n_func.dart';
import 'package:memory_minder_app/utils/utils.dart';

class AppFilledButton extends StatefulWidget {
  const AppFilledButton({super.key, required this.titleKey, required this.onPressed});

  final String titleKey;
  final void Function()? onPressed;

  @override
  AppFilledButtonState createState() => AppFilledButtonState();
}

class AppFilledButtonState extends State<AppFilledButton> {
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
          fixedSize: const Size(double.maxFinite, 54),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          )),
      onPressed: widget.onPressed,
      child: Text(
        I18nFunc.getLocaleMessage(widget.titleKey),
        style: Utils.getTextTheme(context).titleMedium?.copyWith(
              color: Utils.getThemeColorScheme(context).onPrimary,
            ),
      ),
    );
  }
}
