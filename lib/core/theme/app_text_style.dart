
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moniepointtest/core/constants/colors.dart';

class AppTextStyle {
  static AppTextStyle instance = AppTextStyle();

  TextStyle appBarTile = GoogleFonts.roboto(fontSize: 14.0, fontWeight: FontWeight.w400,);

 TextStyle titleLarge = GoogleFonts.inter(fontSize: 18.0, fontWeight: FontWeight.w400,);

  TextStyle titleSmall = GoogleFonts.inter(fontSize: 24.0, fontWeight: FontWeight.w500,color: color1);

   TextStyle titleMedium = GoogleFonts.inter(fontSize: 34.0, fontWeight: FontWeight.w600 ,color: Colors.black,height: 1.2);
  //
  // ///CV TextStyle
  // TextStyle experienceStyles =
  // GoogleFonts.inter(fontSize: 18.0, fontWeight: FontWeight.w400, color: AppColor.blackColor);
}
