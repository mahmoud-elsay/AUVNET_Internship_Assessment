import 'package:hive_flutter/hive_flutter.dart';


class StorageService {
  static const String _userBox = 'user_box';
  static const String _tokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userIdKey = 'user_id';
  static const String _userEmailKey = 'user_email';
  static const String _isLoggedInKey = 'is_logged_in';

  static Box? _box;

  // Initialize Hive
  static Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox(_userBox);
  }

  // Save user data after successful login
  static Future<void> saveUserData({
    required String accessToken,
    required String refreshToken,
    required String userId,
    required String email,
  }) async {
    await _box?.putAll({
      _tokenKey: accessToken,
      _refreshTokenKey: refreshToken,
      _userIdKey: userId,
      _userEmailKey: email,
      _isLoggedInKey: true,
    });
  }

  // Get access token
  static String? getAccessToken() {
    return _box?.get(_tokenKey);
  }

  // Get refresh token
  static String? getRefreshToken() {
    return _box?.get(_refreshTokenKey);
  }

  // Get user ID
  static String? getUserId() {
    return _box?.get(_userIdKey);
  }

  // Get user email
  static String? getUserEmail() {
    return _box?.get(_userEmailKey);
  }

  // Check if user is logged in
  static bool isLoggedIn() {
    return _box?.get(_isLoggedInKey, defaultValue: false) ?? false;
  }

  // Clear all user data (logout)
  static Future<void> clearUserData() async {
    await _box?.deleteAll([
      _tokenKey,
      _refreshTokenKey,
      _userIdKey,
      _userEmailKey,
      _isLoggedInKey,
    ]);
  }

  // Update access token (for token refresh)
  static Future<void> updateAccessToken(String newToken) async {
    await _box?.put(_tokenKey, newToken);
  }

  // Save user preferences
  static Future<void> saveUserPreference(String key, dynamic value) async {
    await _box?.put(key, value);
  }

  // Get user preference
  static T? getUserPreference<T>(String key, {T? defaultValue}) {
    return _box?.get(key, defaultValue: defaultValue);
  }
}