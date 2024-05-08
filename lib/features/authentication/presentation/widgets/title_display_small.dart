import 'package:flutter/material.dart';
import 'package:memory_minder_app/utils/utils.dart';

class TitleDisplaySmall extends StatelessWidget {
  const TitleDisplaySmall({
    super.key,
    required this.data,
    this.margin,
  });

  final String data;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Text(
        data,
        style: Utils.getTextTheme(context).displaySmall?.copyWith(
              color: Utils.getThemeColorScheme(context).onSurface,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
