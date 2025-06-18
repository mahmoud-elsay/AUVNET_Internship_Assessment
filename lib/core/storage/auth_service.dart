import 'package:nawel/core/routing/routes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nawel/core/storage/storage_service.dart';

class AuthService {
  static final SupabaseClient _supabaseClient = Supabase.instance.client;

  // Check if user has valid session
  static Future<bool> hasValidSession() async {
    try {
      // Check if we have stored tokens
      final accessToken = StorageService.getAccessToken();
      if (accessToken == null || !StorageService.isLoggedIn()) {
        return false;
      }

      // Check if current Supabase session is valid
      final session = _supabaseClient.auth.currentSession;
      if (session != null && session.accessToken == accessToken) {
        return true;
      }

      // Try to restore session from stored tokens
      final refreshToken = StorageService.getRefreshToken();
      if (refreshToken != null) {
        try {
          final response = await _supabaseClient.auth.setSession(refreshToken);
          if (response.session != null) {
            // Update stored tokens with refreshed ones
            await StorageService.saveUserData(
              accessToken: response.session!.accessToken,
              refreshToken: response.session!.refreshToken!,
              userId: response.session!.user.id,
              email: response.session!.user.email!,
            );
            return true;
          }
        } catch (e) {
          // Session refresh failed, clear stored data
          await StorageService.clearUserData();
          return false;
        }
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  // Auto-login user if valid session exists
  static Future<String> getInitialRoute() async {
    final hasSession = await hasValidSession();
    return hasSession ? Routes.layoutScreen : Routes.onBoardingScreen;
  }

  // Logout user
  static Future<void> logout() async {
    try {
      await _supabaseClient.auth.signOut();
    } finally {
      await StorageService.clearUserData();
    }
  }
}