import 'package:flutter/material.dart';

import 'custom_themes/appbar_theme.dart';
import 'custom_themes/buttom_sheet_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/custom_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/text_field_theme.dart';


class TAppTheme{
TAppTheme._();

 static ThemeData lightTheme = ThemeData(
   useMaterial3: true,
   fontFamily: 'Poppins',
   brightness: Brightness.light,
   primaryColor: Colors.blue,
   scaffoldBackgroundColor: Colors.white,
   textTheme: TTextTheme.lightTextTheme,
   chipTheme: TChipTheme.lightChipTheme,
   appBarTheme: TAppBarTheme.LightAppBarTheme,
   checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
   bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
   elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
   outlinedButtonTheme: TOutlinedButtonTheme.LightOutLinedButtonTheme,
   inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,

 );
 static ThemeData darkMode = ThemeData(
   useMaterial3: true,
   fontFamily: 'Poppins',
   brightness: Brightness.dark,
   primaryColor: Colors.blue,
   scaffoldBackgroundColor: Colors.black,
   textTheme: TTextTheme.darkTextTheme,
   appBarTheme: TAppBarTheme.darkAppBarTheme,
   chipTheme: TChipTheme.darkChipTheme,
   checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
   bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
   elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
   outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
   inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,

 );
}