import 'package:flutter/material.dart';

class ThemeSchema {
  static bool light = false;
  static final Color primaryColor = ThemeSchema.light ? Color(0xffffffff) : Color(0xff2A2C36);
  static final Color secondaryColor = Color(0xffDB3022);
  static final Color backgroundColor = ThemeSchema.light ? Color(0xfff9f9f9) : Color(0xff1E1F28);
  static final Color grey = Colors.grey;
  static final Color textColor = ThemeSchema.light ? Colors.black : Colors.white;
  static final Color success = Color(0xff2AA952);
  static final Color iconsColor = ThemeSchema.light ? Colors.grey : Colors.white;
  static final Color border = ThemeSchema.light ? Colors.grey.withOpacity(.2) :  Color(0xff1E1F28);
  static final Color divider = ThemeSchema.light ? Colors.grey.withOpacity(.2) :  Color(0xff2A2C36);
  static final Color hintColor = ThemeSchema.light ? Colors.grey:  Colors.white;

  static TextStyle get headline1 {
    return TextStyle(
        color: ThemeSchema.textColor,
        fontWeight: FontWeight.bold,
        fontSize: 34
    );
  }

  static TextStyle get headline2 {
    return TextStyle(
        color: ThemeSchema.textColor,
        fontWeight: FontWeight.w600,
        fontSize: 24
    );
  }

  static TextStyle get headline3 {
    return TextStyle(
        color: ThemeSchema.textColor,
        fontWeight: FontWeight.w600,
        fontSize: 18
    );
  }

  static TextStyle get subhead {
    return TextStyle(
        color: ThemeSchema.textColor,
        fontWeight: FontWeight.w600,
        fontSize: 16
    );
  }

  static TextStyle get text {
    return TextStyle(
        color: ThemeSchema.textColor,
        fontWeight: FontWeight.w400,
        fontSize: 16
    );
  }

  static TextStyle get title {
    return TextStyle(
        color: ThemeSchema.textColor,
        fontWeight: FontWeight.w800,
        fontSize: 16
    );
  }


  static TextStyle get descriptive {
    return TextStyle(
        color: ThemeSchema.textColor,
        fontWeight: FontWeight.w500,
        fontSize: 14
    );
  }

  static TextStyle get descriptiveLight {
    return TextStyle(
        color: ThemeSchema.textColor,
        fontWeight: FontWeight.w400,
        fontSize: 14
    );
  }

  static TextStyle get helper {
    return TextStyle(
        color: ThemeSchema.grey,
        fontWeight: FontWeight.w400,
        fontSize: 11
    );
  }

}