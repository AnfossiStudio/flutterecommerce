import 'package:flutter/material.dart';

class ThemeApp with ChangeNotifier {
  bool _light = true;
  final Color secondaryColor = Color(0xffDB3022);
  final Color grey = Colors.grey;
  final Color success = Color(0xff2AA952);
  Color get primaryColor {
    return _light ? Color(0xffffffff) : Color(0xff2A2C36);
  }

  Color get backgroundColor {
    return _light ? Color(0xfff9f9f9) : Color(0xff1E1F28);
  }

  Color get textColor {
    return _light ? Colors.black : Colors.white;
  }

  Color get iconsColor {
    return _light ? Colors.grey : Colors.white;
  }

  Color get border {
    return _light ? Colors.grey.withOpacity(.2) : Color(0xff1E1F28);
  }

  Color get divider {
    return _light ? Colors.grey.withOpacity(.2) : Color(0xff2A2C36);
  }

  Color get hintColor {
    return _light ? Colors.grey : Colors.white;
  }

  TextStyle get headline1 {
    return TextStyle(
        color: textColor, fontWeight: FontWeight.bold, fontSize: 34);
  }

  TextStyle get headline2 {
    return TextStyle(
        color: textColor, fontWeight: FontWeight.w600, fontSize: 24);
  }

  TextStyle get headline3 {
    return TextStyle(
        color: textColor, fontWeight: FontWeight.w600, fontSize: 18);
  }

  TextStyle get subhead {
    return TextStyle(
        color: textColor, fontWeight: FontWeight.w600, fontSize: 16);
  }

  TextStyle get text {
    return TextStyle(
        color: textColor, fontWeight: FontWeight.w400, fontSize: 16);
  }

  TextStyle get title {
    return TextStyle(
        color: textColor, fontWeight: FontWeight.w800, fontSize: 16);
  }

  TextStyle get descriptive {
    return TextStyle(
        color: textColor, fontWeight: FontWeight.w500, fontSize: 14);
  }

  TextStyle get descriptiveLight {
    return TextStyle(
        color: textColor, fontWeight: FontWeight.w400, fontSize: 14);
  }

  TextStyle get helper {
    return TextStyle(
        color: grey, fontWeight: FontWeight.w400, fontSize: 11);
  }

  switchTheme(){
    _light = !_light;
    notifyListeners();
  }

  mode() => _light;
}
