import 'widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:nawel/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height:
                MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Flexible space that shrinks when keyboard appears
                    Flexible(flex: 1, child: verticalSpace(60)),
                    Image.asset(
                      'assets/images/logo.png',
                      width: 336.w,
                      height: 336.h,
                    ),
                    verticalSpace(40),
                    const LoginForm(),
                    // Flexible space at bottom
                    Flexible(flex: 1, child: SizedBox(height: 20.h)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
