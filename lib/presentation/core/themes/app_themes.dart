import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

/// I did not have a full and good schema designs and there is no time to improve it, will do later .
enum AppTheme {
  light,
  dark,
}

MaterialColor kNeutralColors = const MaterialColor(
  0xFF1F2261,
  <int, Color>{
    0: Color(0XFFFFFFFF),
    100: Color(0XFFF3F7F9),
    200: Color(0XFFE8EAEE),
    300: Color(0XFFD0D5DC),
    400: Color(0XFFB6BEC9),
    500: Color(0XFF96A0B5),
    600: Color(0XFF697896),
    700: Color(0XFF121F3E),
    800: Color(0XFF21273B),
    900: Color(0XFF1F2261),
  },
);

Color kBlueColor = const Color(0XFF5599F5);
Color kOrangeColor = const Color(0XFFFD7722);
Color kPinkColor = const Color(0XFFE84C88);
Color kGreenColor = const Color(0XFF5ECEB3);
Color kPurpleColor = const Color(0XFFD08CDF);
Color kRedColor = const Color(0XFFDD4A4A);

MaterialColor kBackgroundColors = const MaterialColor(
  0XFFF3F3F3,
  <int, Color>{
    0: Color(0XFFFFFFFF),
    100: Color(0XFFF3F3F3),
    200: Color(0XFFE7E7E7),
    300: Color(0XFFB7B7B7),
    400: Color(0XFF707070),
    500: Color(0XFF111111),
  },
);

Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.light: ThemeData(
    useMaterial3: true,
    colorSchemeSeed: kNeutralColors,
    scaffoldBackgroundColor: Color(0xFFF6F6F6),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: kNeutralColors),
    ),
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 32),
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        foregroundColor: kNeutralColors[0],
        backgroundColor: kNeutralColors,
      ),
    ),
    textTheme: GoogleFonts.robotoTextTheme(),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF3C3C3C),
      ),
      labelStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: kNeutralColors),
      suffixIconColor: kNeutralColors[500],
      prefixIconColor: kNeutralColors[500],
      contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 11.h),
      filled: true,
      fillColor: const Color(0xFFEFEFEF),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide(color: kNeutralColors[200]!, width: 1.5)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide(color: kNeutralColors[200]!, width: 1.5)),
      focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide(color: kNeutralColors[200]!, width: 1.5)),
      disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide(color: kNeutralColors[200]!, width: 1.5)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide(color: kNeutralColors[200]!, width: 1.5)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide(color: kNeutralColors[200]!, width: 1.5)),
    ),
  ),
  AppTheme.dark: ThemeData(
    useMaterial3: true,
    colorSchemeSeed: kNeutralColorsDarkMode,
    // TODO : Fix Colors later
    scaffoldBackgroundColor: Color(0xFFF6F6F6),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: kNeutralColorsDarkMode),
    ),
    brightness: Brightness.dark,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 32),
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        foregroundColor: kNeutralColorsDarkMode[0],
        backgroundColor: kColorButtonBackgroundColor,
      ),
    ),
    textTheme: GoogleFonts.robotoTextTheme(),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF3C3C3C),
      ),
      labelStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: kNeutralColorsDarkMode),
      suffixIconColor: kNeutralColorsDarkMode[500],
      prefixIconColor: kNeutralColorsDarkMode[500],
      contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 11.h),
      filled: true,
      fillColor: const Color(0xFFEFEFEF),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide(color: kNeutralColors[200]!, width: 1.5)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide(color: kNeutralColors[200]!, width: 1.5)),
      focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide(color: kNeutralColors[200]!, width: 1.5)),
      disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide(color: kNeutralColors[200]!, width: 1.5)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide(color: kNeutralColors[200]!, width: 1.5)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide(color: kNeutralColors[200]!, width: 1.5)),
    ),
  ),
};

Color kColorButtonBackgroundColor = const Color(0XFF101219);
MaterialColor kNeutralColorsDarkMode = const MaterialColor(
  0xFFD6D9E4,
  <int, Color>{
    0: Color(0XFFFFFFFF),
    100: Color(0XFFF3F7F9),
    200: Color(0XFF393F49),
    300: Color(0XFFD0D5DC),
    400: Color(0XFFB6BEC9),
    500: Color(0XFF96A0B5),
    600: Color(0XFF697896),
    700: Color(0XFF2A2C38),
    800: Color(0XFF21273B),
    900: Color(0XFF191D2B),
  },
);
