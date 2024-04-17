import 'package:flutter/material.dart';
import 'package:memory_minder_app/utils/utils.dart';

class CustomeTabPageSelector extends StatelessWidget {
  const CustomeTabPageSelector({
    super.key,
    required int currentPageIndex,
  }) : _currentPageIndex = currentPageIndex;

  final int _currentPageIndex;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Utils.getThemeColorScheme(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
          width: _currentPageIndex == 0 ? 25 : 10,
          height: 8,
          decoration: BoxDecoration(
            color: _currentPageIndex == 0 ? colorScheme.primary : colorScheme.primaryContainer,
            borderRadius: const BorderRadius.all(
              Radius.circular(100),
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
          width: _currentPageIndex == 1 ? 25 : 10,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: _currentPageIndex == 1 ? colorScheme.primary : colorScheme.primaryContainer,
            borderRadius: const BorderRadius.all(
              Radius.circular(100),
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
          width: _currentPageIndex == 2 ? 25 : 10,
          height: 8,
          decoration: BoxDecoration(
            color: _currentPageIndex == 2 ? colorScheme.primary : colorScheme.primaryContainer,
            borderRadius: const BorderRadius.all(
              Radius.circular(100),
            ),
          ),
        ),
      ],
    );
  }
}
