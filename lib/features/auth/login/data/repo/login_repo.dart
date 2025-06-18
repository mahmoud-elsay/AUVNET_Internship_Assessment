import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nawel/features/auth/login/data/model/login_request_model.dart';
import 'package:nawel/features/auth/login/data/model/login_response_model.dart';

class LoginRepo {
  final SupabaseClient _supabaseClient;

  LoginRepo(this._supabaseClient);

  Future<LoginResponseModel> login(LoginRequestModel request) async {
    try {
      final response = await _supabaseClient.auth.signInWithPassword(
        email: request.email,
        password: request.password,
      );

      // Check if user was logged in successfully
      if (response.user != null && response.session != null) {
        return LoginResponseModel.success(
          id: response.user!.id,
          email: response.user!.email,
          accessToken: response.session!.accessToken,
          refreshToken: response.session!.refreshToken,
          message: 'Welcome back!',
        );
      } else {
        return LoginResponseModel.failure(
          errorMessage: 'Failed to login. Please try again.',
          errorCode: 'LOGIN_FAILED',
        );
      }
    } on AuthException catch (e) {
      return LoginResponseModel.failure(
        errorMessage: _getErrorMessage(e.message),
        errorCode: e.statusCode,
      );
    } catch (e) {
      return LoginResponseModel.failure(
        errorMessage: 'An unexpected error occurred. Please try again.',
        errorCode: 'UNKNOWN_ERROR',
      );
    }
  }

  String _getErrorMessage(String? message) {
    if (message == null) return 'An error occurred during login.';

    // Handle common Supabase auth error messages
    if (message.contains('Invalid login credentials') ||
        message.contains('invalid credentials')) {
      return 'Invalid email or password. Please try again.';
    } else if (message.contains('invalid email')) {
      return 'Please enter a valid email address.';
    } else if (message.contains('Email not confirmed')) {
      return 'Please verify your email address before logging in.';
    } else if (message.contains('network')) {
      return 'Network error. Please check your connection and try again.';
    } else if (message.contains('Too many requests')) {
      return 'Too many login attempts. Please try again later.';
    }

    return message;
  }
}
