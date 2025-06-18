import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel/core/routing/routes.dart';
import 'package:nawel/core/theming/styles.dart';
import 'package:nawel/core/helpers/spacing.dart';
import 'package:nawel/core/helpers/extension.dart';
import 'package:nawel/core/helpers/app_vaildtion.dart';
import 'package:nawel/core/widgets/custom_snakbar.dart';
import 'package:nawel/core/widgets/app_text_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/core/widgets/app_text_form_field.dart';
import 'package:nawel/features/auth/sign_up/logic/sign_up_bloc.dart';
import 'package:nawel/features/auth/sign_up/logic/sign_up_event.dart';
import 'package:nawel/features/auth/sign_up/logic/sign_up_state.dart';


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

  void _handleSignUp() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<SignUpBloc>().add(
            SignUpRequested(
              email: _emailController.text.trim(),
              password: _passwordController.text,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        switch (state) {
          case SignUpInitial():
            break;
          case SignUpLoading():
            break;
          case SignUpSuccess():
            CustomSnackBar.showSuccess(context, state.message);
            // Clear form
            _emailController.clear();
            _passwordController.clear();
            _confirmPasswordController.clear();
            // Navigate to login screen with slight delay for snackbar visibility
            Future.delayed(const Duration(milliseconds: 500), () {
              if (mounted) {
                context.pushNamed(Routes.loginScreen);
              }
            });
            break;
          case SignUpError():
            CustomSnackBar.showError(context, state.error);
            break;
        }
      },
      child: Form(
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
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
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
              validator: (value) =>
                  validateConfirmPassword(value, _passwordController.text),
              onChanged: (value) {
                _formKey.currentState?.validate();
              },
            ),
            verticalSpace(32),
            BlocBuilder<SignUpBloc, SignUpState>(
              builder: (context, state) {
                final isLoading = state is SignUpLoading;
                return AppTextButton(
                  buttonText: isLoading ? 'Signing up...' : 'Sign up',
                  textStyle: TextStyles.font18WhiteMedium,
                  onPressed: isLoading ? null : _handleSignUp,
                );
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
      ),
    );
  }
}