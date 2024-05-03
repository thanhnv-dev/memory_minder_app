import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:memory_minder_app/utils/utils.dart';

class CustomTabPageSelector extends StatelessWidget {
  const CustomTabPageSelector({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Utils.getThemeColorScheme(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _animatedDot(
          colorScheme: colorScheme,
          active: 0 == currentIndex,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          child: _animatedDot(
            colorScheme: colorScheme,
            active: 1 == currentIndex,
          ),
        ),
        _animatedDot(
          colorScheme: colorScheme,
          active: 2 == currentIndex,
        ),
      ],
    );
  }

  AnimatedContainer _animatedDot({
    required ColorScheme colorScheme,
    required bool active,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
      width: active ? 25 : 10,
      height: 8,
      decoration: BoxDecoration(
        color: active ? colorScheme.primary : colorScheme.primaryContainer,
        borderRadius: const BorderRadius.all(
          Radius.circular(100),
        ),
      ),
    );
  }
}
