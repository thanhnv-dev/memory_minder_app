import 'package:flutter/material.dart';
import 'package:memory_minder_app/i18n/i18n_func.dart';
import 'package:memory_minder_app/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppTonalButton extends StatefulWidget {
  const AppTonalButton({super.key, this.titleKey, this.svgAsset, required this.onPressed});

  final String? titleKey;
  final String? svgAsset;
  final void Function()? onPressed;

  @override
  AppTonalButtonState createState() => AppTonalButtonState();
}

class AppTonalButtonState extends State<AppTonalButton> {
  @override
  Widget build(BuildContext context) {
    String? titleKey = widget.titleKey;
    String? svgAsset = widget.svgAsset;

    return FilledButton.tonal(
      style: FilledButton.styleFrom(
        fixedSize: const Size(double.infinity, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: Utils.getThemeColorScheme(context).secondaryContainer,
      ),
      onPressed: widget.onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          titleKey != null
              ? Text(
                  I18nFunc.getLocaleMessage(titleKey),
                  style: Utils.getTextTheme(context).titleSmall?.copyWith(
                        color: Utils.getThemeColorScheme(context).onSecondaryContainer,
                      ),
                )
              : const SizedBox(),
          svgAsset != null
              ? SvgPicture.asset(
                  svgAsset,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
