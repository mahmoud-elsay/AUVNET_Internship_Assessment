import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nawel/core/theming/font_weight.dart';
import 'package:nawel/core/theming/colors_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font28SecondaryBlackMedium = GoogleFonts.rubik(
    fontSize: 28.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.secondryBlack,
  );
  static TextStyle font14BlueWith90OpacityRegular = GoogleFonts.rubik(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.blueWith90Opacity,
  );
  static TextStyle font18WhiteMedium = GoogleFonts.rubik(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.white,
  );
  static TextStyle mulish14LightGreyWith20Opacity = GoogleFonts.mulish(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.light,
    color: ColorsManager.lightGreyWith20Opacity,
  );
  static TextStyle dmSans14blueBold = GoogleFonts.dmSans(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.blue,
  );
  static TextStyle mulish14BlackWith50Opacity = GoogleFonts.mulish(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.light,
    color: ColorsManager.blackWith50Opacity,
  );
  static TextStyle font12BlackBold = GoogleFonts.dmSans(
    fontSize: 12.sp,
    color: ColorsManager.black,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font12BlackMedium = GoogleFonts.dmSans(
    fontSize: 12.sp,
    color: ColorsManager.black,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font16BlackBold = GoogleFonts.dmSans(
    fontSize: 16.sp,
    color: ColorsManager.black,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font30WhiteBold = GoogleFonts.rubik(
    fontSize: 30.sp,
    color: ColorsManager.white,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font12WhiteMedium = GoogleFonts.rubik(
    fontSize: 12.sp,
    color: ColorsManager.white,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font10BlackMedium58Opacity = GoogleFonts.dmSans(
    fontSize: 10.sp,
    color: ColorsManager.greyWithOpacity58,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font14GreyRegular = GoogleFonts.rubik(
    fontSize: 14.sp,
    color: ColorsManager.greyWord,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font14BlackMedium = GoogleFonts.dmSans(
    fontSize: 14.sp,
    color: ColorsManager.blackWith50Opacity,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font20BlackBold = GoogleFonts.dmSans(
    fontSize: 20.sp,
    color: ColorsManager.black,
    fontWeight: FontWeightHelper.bold,
  );
}
