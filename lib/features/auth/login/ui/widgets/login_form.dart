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
import 'package:nawel/features/auth/login/logic/login_bloc.dart';
import 'package:nawel/features/auth/login/logic/login_event.dart';
import 'package:nawel/features/auth/login/logic/login_state.dart';

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

  void _handleLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<LoginBloc>().add(
        LoginRequested(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        switch (state) {
          case LoginInitial():
            break;
          case LoginLoading():
            break;
          case LoginSuccess():
            CustomSnackBar.showSuccess(context, state.message);
            // Clear fields before navigation
            _emailController.clear();
            _passwordController.clear();
            // Navigate immediately with a slight delay for snackbar visibility
            Future.delayed(const Duration(milliseconds: 500), () {
              if (mounted) {
                context.pushNamed(Routes.layoutScreen);
              }
            });
            break;
          case LoginError():
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
            ),
            verticalSpace(32),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                final isLoading = state is LoginLoading;
                return AppTextButton(
                  buttonText: isLoading ? 'Logging in...' : 'Log in',
                  textStyle: TextStyles.font18WhiteMedium,
                  onPressed: isLoading ? null : _handleLogin,
                );
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
      ),
    );
  }
}
