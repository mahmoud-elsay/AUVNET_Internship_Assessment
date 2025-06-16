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

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'mail',
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
            hintText: 'password',
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
          ),
          verticalSpace(32),
          AppTextButton(
            buttonText: 'Log in',
            textStyle: TextStyles.font18WhiteMedium,
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                // TODO: Handle successful login
              }
            },
          ),
          verticalSpace(16),
          GestureDetector(
            onTap: () {
              context.pushNamed(Routes.signUpScreen);
            },
            child: Text(
              'Create an account',
              style: TextStyles.dmSans14blueBold,
            ),
          ),
        ],
      ),
    );
  }
}
