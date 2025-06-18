import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nawel/core/theming/font_weight.dart';
import 'package:nawel/core/theming/colors_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  // --- Black Styles ---
  static TextStyle font10BlackMedium58Opacity = GoogleFonts.dmSans(
    fontSize: 10.sp,
    color: ColorsManager.greyWithOpacity58,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font12BlackMedium = GoogleFonts.dmSans(
    fontSize: 12.sp,
    color: ColorsManager.black,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font12BlackBold = GoogleFonts.dmSans(
    fontSize: 12.sp,
    color: ColorsManager.black,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font14BlackMedium = GoogleFonts.dmSans(
    fontSize: 14.sp,
    color: ColorsManager.blackWith50Opacity,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle mulish14BlackWith50Opacity = GoogleFonts.mulish(
    fontSize: 14.sp,
    color: ColorsManager.blackWith50Opacity,
    fontWeight: FontWeightHelper.light,
  );
  static TextStyle font16BlackBold = GoogleFonts.dmSans(
    fontSize: 16.sp,
    color: ColorsManager.black,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font20BlackBold = GoogleFonts.dmSans(
    fontSize: 20.sp,
    color: ColorsManager.black,
    fontWeight: FontWeightHelper.bold,
  );

  // --- Secondary Black Styles ---
  static TextStyle font28SecondaryBlackMedium = GoogleFonts.rubik(
    fontSize: 28.sp,
    color: ColorsManager.secondryBlack,
    fontWeight: FontWeightHelper.medium,
  );

  // --- White Styles ---
  static TextStyle font12WhiteMedium = GoogleFonts.rubik(
    fontSize: 12.sp,
    color: ColorsManager.white,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font18WhiteMedium = GoogleFonts.rubik(
    fontSize: 18.sp,
    color: ColorsManager.white,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font30WhiteBold = GoogleFonts.rubik(
    fontSize: 30.sp,
    color: ColorsManager.white,
    fontWeight: FontWeightHelper.bold,
  );

  // --- Blue Styles ---
  static TextStyle font14BlueWith90OpacityRegular = GoogleFonts.rubik(
    fontSize: 14.sp,
    color: ColorsManager.blueWith90Opacity,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle dmSans14blueBold = GoogleFonts.dmSans(
    fontSize: 14.sp,
    color: ColorsManager.blue,
    fontWeight: FontWeightHelper.bold,
  );

  // --- Grey Styles ---
  static TextStyle font14GreyRegular = GoogleFonts.rubik(
    fontSize: 14.sp,
    color: ColorsManager.greyWord,
    fontWeight: FontWeightHelper.regular,
  );

  // --- Light Grey Styles (Mulish) ---
  static TextStyle mulish14LightGreyWith20Opacity = GoogleFonts.mulish(
    fontSize: 14.sp,
    color: ColorsManager.lightGreyWith20Opacity,
    fontWeight: FontWeightHelper.light,
  );
}