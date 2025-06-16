import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/core/helpers/spacing.dart';
import 'package:nawel/features/auth/sign_up/widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                verticalSpace(60),
                Image.asset(
                  'assets/images/logo.png',
                  width: 336.w,
                  height: 336.h,
                ),
                verticalSpace(40),
                const SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
