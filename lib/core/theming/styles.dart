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
}
