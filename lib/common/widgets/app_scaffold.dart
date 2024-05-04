import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final Widget? appBar;
  final Widget? drawer;
  final bool activeUnFocusKeyboard;

  const AppScaffold({
    super.key,
    required this.child,
    this.appBar,
    this.drawer,
    this.activeUnFocusKeyboard = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer,
      body: GestureDetector(
        onTap: (activeUnFocusKeyboard)
            ? () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              }
            : null,
        child: child,
      ),
    );
  }
}
