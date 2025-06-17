import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/core/theming/colors_manager.dart';
import 'package:nawel/core/theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged; // Add this line

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.backgroundColor,
    this.validator,
    this.controller,
    this.keyboardType,
    this.onChanged, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged, // Add this line
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: ColorsManager.primaryPurple,
                width: 1.5,
              ),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: Colors.transparent, width: 0),
            ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.red, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.red, width: 1.5),
        ),
        hintStyle:
            hintStyle ??
            TextStyles.mulish14BlackWith50Opacity.copyWith(
              fontSize: 14.sp,
              color: Colors.grey[600],
            ),
        hintText: hintText,
        // Updated error style to handle overflow better
        errorStyle: TextStyle(fontSize: 12.sp, color: Colors.red, height: 1.0),
        errorMaxLines: 2, // Allow up to 2 lines for error messages
        suffixIcon:
            suffixIcon != null
                ? Container(
                  width: 40.w,
                  height: 40.h,
                  alignment: Alignment.center,
                  child: suffixIcon,
                )
                : null,
        suffixIconConstraints: BoxConstraints(minWidth: 40.w, minHeight: 40.h),
        prefixIcon:
            prefixIcon != null
                ? Container(
                  width: 40.w,
                  height: 40.h,
                  alignment: Alignment.center,
                  child: prefixIcon,
                )
                : null,
        prefixIconConstraints: BoxConstraints(minWidth: 40.w, minHeight: 40.h),
        fillColor: backgroundColor ?? ColorsManager.white,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      style:
          inputTextStyle ??
          TextStyles.mulish14BlackWith50Opacity.copyWith(
            fontSize: 14.sp,
            color: Colors.black87,
          ),
      validator: validator,
    );
  }
}
