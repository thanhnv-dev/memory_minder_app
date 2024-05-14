import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:memory_minder_app/constant/app_assets.dart';
import 'package:memory_minder_app/utils/utils.dart';

class CheckButton extends StatefulWidget {
  const CheckButton({super.key, required this.state, required this.onPressed});

  final bool state;
  final void Function()? onPressed;

  @override
  CheckButtonState createState() => CheckButtonState();
}

class CheckButtonState extends State<CheckButton> {
  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      style: FilledButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(
            color: Utils.getThemeColorScheme(context).primary,
          ),
        ),
        minimumSize: const Size(22, 22),
        backgroundColor: widget.state ? Utils.getThemeColorScheme(context).primary : Colors.transparent,
      ),
      onPressed: widget.onPressed,
      child: SvgPicture.asset(
        AppSvgIcons.check,
        colorFilter: ColorFilter.mode(
          Utils.getThemeColorScheme(context).surface,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
