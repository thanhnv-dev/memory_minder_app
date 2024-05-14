import 'package:flutter/material.dart';
import 'package:memory_minder_app/constant/app_fonts_family.dart';

class AppTextStyles {
  static final display = Display();
  static final headline = Headline();
  static final title = Title();
  static final label = Label();
  static final body = Body();
  static final custom = Custom();
}

class Display {
  final TextStyle large = TextStyle(
    fontFamily: AppFontsFamily.roboto.regular,
    fontSize: 57,
    letterSpacing: -0.25,
  );
  final TextStyle medium = TextStyle(
    fontFamily: AppFontsFamily.roboto.regular,
    fontSize: 45,
  );
  final TextStyle small = TextStyle(
    fontFamily: AppFontsFamily.roboto.regular,
    fontSize: 36,
  );
}

class Headline {
  final TextStyle large = TextStyle(
    fontFamily: AppFontsFamily.roboto.regular,
    fontSize: 32,
  );
  final TextStyle medium = TextStyle(
    fontFamily: AppFontsFamily.roboto.regular,
    fontSize: 28,
  );
  final TextStyle small = TextStyle(
    fontFamily: AppFontsFamily.roboto.regular,
    fontSize: 24,
  );
}

class Title {
  final TextStyle large = TextStyle(
    fontFamily: AppFontsFamily.roboto.regular,
    fontSize: 22,
  );
  final TextStyle medium = TextStyle(
    fontFamily: AppFontsFamily.roboto.medium,
    fontSize: 16,
    letterSpacing: 0.15,
  );
  final TextStyle small = TextStyle(
    fontFamily: AppFontsFamily.roboto.black,
    // fontFamily: AppFontsFamily.roboto.medium,
    fontSize: 14,

    letterSpacing: 0.1,
  );
}

class Label {
  final TextStyle large = TextStyle(
    fontFamily: AppFontsFamily.roboto.medium,
    fontSize: 14,
    letterSpacing: 0.1,
  );
  final TextStyle medium = TextStyle(
    fontFamily: AppFontsFamily.roboto.medium,
    fontSize: 12,
    letterSpacing: 0.5,
  );
  final TextStyle small = TextStyle(
    fontFamily: AppFontsFamily.roboto.medium,
    fontSize: 11,
    letterSpacing: 0.5,
  );
}

class Body {
  final TextStyle large = TextStyle(
    fontFamily: AppFontsFamily.roboto.regular,
    fontSize: 16,
    letterSpacing: 0.5,
  );
  final TextStyle medium = TextStyle(
    fontFamily: AppFontsFamily.roboto.regular,
    fontSize: 14,
    letterSpacing: 0.25,
  );
  final TextStyle small = TextStyle(
    fontFamily: AppFontsFamily.roboto.regular,
    fontSize: 12,
    letterSpacing: 0.4,
  );
}

class Custom {
  final TextStyle titleLogo = TextStyle(
    fontFamily: AppFontsFamily.roboto.bold,
    fontWeight: FontWeight.w900,
    fontSize: 30,
  );

  final TextStyle bold20 = TextStyle(
    fontFamily: AppFontsFamily.roboto.bold,
    fontWeight: FontWeight.w700,
    fontSize: 20,
  );
}
