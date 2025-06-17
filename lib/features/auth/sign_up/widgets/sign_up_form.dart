import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nawel/core/helpers/extension.dart';
import 'package:nawel/core/routing/routes.dart';
import 'package:nawel/core/widgets/app_text_form_field.dart';
import 'package:nawel/core/widgets/app_text_button.dart';
import 'package:nawel/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/core/helpers/spacing.dart';
import 'package:nawel/core/helpers/app_vaildtion.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Email',
            prefixIcon: Container(
              padding: EdgeInsets.all(12.w),
              child: SvgPicture.asset(
                'assets/svgs/mail_icon.svg',
                width: 16.w,
                height: 16.h,
                fit: BoxFit.scaleDown,
              ),
            ),
            backgroundColor: const Color(0xFFF5F5F5),
            controller: _emailController,
            validator: validateEmail,
            keyboardType: TextInputType.emailAddress,
          ),
          verticalSpace(16),
          AppTextFormField(
            hintText: 'Password',
            isObscureText: !_isPasswordVisible,
            prefixIcon: Container(
              padding: EdgeInsets.all(12.w),
              child: SvgPicture.asset(
                'assets/svgs/password_icon.svg',
                width: 16.w,
                height: 16.h,
                fit: BoxFit.scaleDown,
              ),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
              child: Container(
                padding: EdgeInsets.all(12.w),
                child: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey[600],
                  size: 20.w,
                ),
              ),
            ),
            backgroundColor: const Color(0xFFF5F5F5),
            controller: _passwordController,
            validator: validatePassword,
            onChanged: (value) {
              _formKey.currentState?.validate();
            },
          ),
          verticalSpace(16),
          AppTextFormField(
            hintText: 'Confirm Password',
            isObscureText: !_isConfirmPasswordVisible,
            prefixIcon: Container(
              padding: EdgeInsets.all(12.w),
              child: SvgPicture.asset(
                'assets/svgs/password_icon.svg',
                width: 16.w,
                height: 16.h,
                fit: BoxFit.scaleDown,
              ),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                });
              },
              child: Container(
                padding: EdgeInsets.all(12.w),
                child: Icon(
                  _isConfirmPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.grey[600],
                  size: 20.w,
                ),
              ),
            ),
            backgroundColor: const Color(0xFFF5F5F5),
            controller: _confirmPasswordController,
            validator:
                (value) =>
                    validateConfirmPassword(value, _passwordController.text),
            onChanged: (value) {
              _formKey.currentState?.validate();
            },
          ),
          verticalSpace(32),
          AppTextButton(
            buttonText: 'Sign up',
            textStyle: TextStyles.font18WhiteMedium,
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {}
            },
          ),
          verticalSpace(16),
          GestureDetector(
            onTap: () {
              context.pushNamed(Routes.loginScreen);
            },
            child: Text(
              'Already have an account? Log in',
              style: TextStyles.dmSans14blueBold,
            ),
          ),
        ],
      ),
    );
  }
}
