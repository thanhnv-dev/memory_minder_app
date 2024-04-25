import 'package:flutter/material.dart';
import 'package:memory_minder_app/utils/utils.dart';

class CustomTabPageSelector extends StatelessWidget {
  const CustomTabPageSelector({
    super.key,
    required int currentPageIndex,
  }) : _currentPageIndex = currentPageIndex;

  final int _currentPageIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _animatedDot(context, 0),
        const SizedBox(width: 3),
        _animatedDot(context, 1),
        const SizedBox(width: 3),
        _animatedDot(context, 2),
      ],
    );
  }

  AnimatedContainer _animatedDot(BuildContext context, int index) {
    ColorScheme colorScheme = Utils.getThemeColorScheme(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
      width: _currentPageIndex == index ? 25 : 10,
      height: 8,
      decoration: BoxDecoration(
        color: _currentPageIndex == index ? colorScheme.primary : colorScheme.primaryContainer,
        borderRadius: const BorderRadius.all(
          Radius.circular(100),
        ),
      ),
    );
  }
}
