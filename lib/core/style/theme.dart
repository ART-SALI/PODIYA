import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

class CTheme {
  static final theme = ThemeData(
    fontFamily: 'Montserrat',
    brightness: Brightness.light,
    scaffoldBackgroundColor: CColors.white,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
  );
}

final darkTheme = ThemeData(
  fontFamily: 'Montserrat',
  colorScheme: const ColorScheme.dark(
      background: Color(0xcc434343),
      onBackground: Color(0xffFFFFFF),

      primary: Color(0xff654BB3),
      onPrimary: Color(0xffffffff),

      primaryContainer: Color(0xccD9D9D9),
      onPrimaryContainer: Color(0xff535353),

      secondary: Color(0xff3E3E3E),
      secondaryContainer: Color(0x993E3E3E),
      onSecondary: Color(0xffffffff),

      tertiary: Color(0x80785396),
      onTertiary: Color(0xffffffff),

      tertiaryContainer: Color(0xff5C5264),
      onTertiaryContainer: Color(0xffffffff)),
);

final lightTheme = ThemeData(
    fontFamily: 'Montserrat',
  colorScheme: const ColorScheme.light(
      background: Color(0xffFFFFFF),
      onBackground: Color(0xff000000),

      primary: Color(0xff8970D1),
      onPrimary: Color(0xffffffff),

      primaryContainer: Color(0xccD9D9D9),
      onPrimaryContainer: Color(0xff535353),

      secondary: Color(0xff676767),
      secondaryContainer: Color(0x99676767),
      onSecondary: Color(0xffffffff),

      tertiary: Color(0x80C6AED9),
      onTertiary: Color(0xff000000),

      tertiaryContainer: Color(0xff9A8CA4),
      onTertiaryContainer: Color(0xffffffff)),
);
