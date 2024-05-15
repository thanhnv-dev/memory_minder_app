import 'package:flutter/material.dart';

class TitleHeadlineLarge extends StatelessWidget {
  const TitleHeadlineLarge({
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
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
    );
  }
}
