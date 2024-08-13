import 'package:currency_converter/presentation/core/extensions/theme_mode_extensions.dart';
import 'package:currency_converter/presentation/core/themes/app_themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

/// Extension on [BuildContext] to help using it and make a lot of shortcuts that would
/// maintain clean and reusable code.
extension TextThemeExtensions on BuildContext {
  TextStyle get font12w400 => GoogleFonts.roboto(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: isDarkMode ? kNeutralColorsDarkMode : kNeutralColors,
      );
  TextStyle get font15w400 => GoogleFonts.roboto(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: isDarkMode ? kNeutralColorsDarkMode : kNeutralColors,
      );
  TextStyle get font16w400 => GoogleFonts.roboto(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: isDarkMode ? kNeutralColorsDarkMode : kNeutralColors,
      );
  TextStyle get font16w700 => GoogleFonts.roboto(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: isDarkMode ? kNeutralColorsDarkMode : kNeutralColors,
      );
  TextStyle get font18w500 => GoogleFonts.roboto(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: isDarkMode ? kNeutralColorsDarkMode : kNeutralColors,
      );
  TextStyle get font20w600 => GoogleFonts.roboto(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: isDarkMode ? kNeutralColorsDarkMode : kNeutralColors,
      );
  TextStyle get font25W700 => GoogleFonts.roboto(
        fontSize: 25.sp,
        fontWeight: FontWeight.w700,
        color: isDarkMode ? kNeutralColorsDarkMode : kNeutralColors,
      );
}
