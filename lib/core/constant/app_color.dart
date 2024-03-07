import 'package:flutter/widgets.dart';

class AppColor {
  static const kPrimaryColor = Color.fromARGB(255, 132, 28, 180);
  static const kPrimarysecandColor = Color.fromARGB(255, 230, 192, 248);
  static const kPrimaryTextColor = Color.fromARGB(255, 170, 78, 231);
  static const kPrimaryLightColor = Color(0xFFFFECDF);
  static const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFA53E), Color.fromARGB(255, 167, 31, 194)],
  );
  static const kSecondaryColor = Color(0xFF979797);
  static const kTextColor = Color(0xFF757575);
}
