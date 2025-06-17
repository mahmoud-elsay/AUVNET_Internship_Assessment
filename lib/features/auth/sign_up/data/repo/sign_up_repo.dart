import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nawel/features/auth/sign_up/data/model/sign_up_request_model.dart';
import 'package:nawel/features/auth/sign_up/data/model/sign_up_response_model.dart';

class SignUpRepo {
  final SupabaseClient _supabaseClient;

  SignUpRepo(this._supabaseClient);

  Future<SignUpResponseModel> signUp(SignUpRequestModel request) async {
    try {
      final response = await _supabaseClient.auth.signUp(
        email: request.email,
        password: request.password,
        data: request.userData,
      );

      // Check if user was created successfully
      if (response.user != null) {
        return SignUpResponseModel.success(
          id: response.user!.id,
          email: response.user!.email,
          message:
              response.user!.emailConfirmedAt == null
                  ? 'Account created! Please check your email to verify your account.'
                  : 'Account created successfully!',
        );
      } else {
        return SignUpResponseModel.failure(
          errorMessage: 'Failed to create account. Please try again.',
          errorCode: 'SIGNUP_FAILED',
        );
      }
    } on AuthException catch (e) {
      return SignUpResponseModel.failure(
        errorMessage: _getErrorMessage(e.message),
        errorCode: e.statusCode,
      );
    } catch (e) {
      return SignUpResponseModel.failure(
        errorMessage: 'An unexpected error occurred. Please try again.',
        errorCode: 'UNKNOWN_ERROR',
      );
    }
  }

  String _getErrorMessage(String? message) {
    if (message == null) return 'An error occurred during sign up.';

    // Handle common Supabase auth error messages
    if (message.contains('already registered')) {
      return 'This email is already registered. Please try logging in.';
    } else if (message.contains('invalid email')) {
      return 'Please enter a valid email address.';
    } else if (message.contains('password')) {
      return 'Password must be at least 6 characters long.';
    } else if (message.contains('network')) {
      return 'Network error. Please check your connection and try again.';
    }

    return message;
  }
}
