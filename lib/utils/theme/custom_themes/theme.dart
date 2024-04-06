import 'package:flutter/material.dart';

import 'botton_sheet_theme.dart';
import 'checkbox_theme.dart';
import 'chip_theme.dart';
import 'elevated_botton_theme.dart';
import 'outlined_button_theme.dart';
import 'text_field_theme.dart';
import 'text_theme.dart';
import 'appbar_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.green,
    textTheme: TTextTheme.LightTextTheme,
    chipTheme: TChipTheme.LightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: TAppBarTheme.LightAppBarTheme,
    checkboxTheme: TCheckboxTheme.LightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.LightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.LightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.LightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.LightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Color(0xFFCF5051),
    textTheme: TTextTheme.DarkTextTheme,
    chipTheme: TChipTheme.DarkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: TAppBarTheme.DarkAppBarTheme,
    checkboxTheme: TCheckboxTheme.DarkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.DarkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.DarkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.DarkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.DarkInputDecorationTheme,
  );
}
