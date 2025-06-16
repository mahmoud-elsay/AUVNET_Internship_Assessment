import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nawel/core/theming/font_weight.dart';
import 'package:nawel/core/theming/color_manager.dart';
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
}
