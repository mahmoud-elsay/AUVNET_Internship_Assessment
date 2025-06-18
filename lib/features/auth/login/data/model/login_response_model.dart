import 'package:equatable/equatable.dart';

class LoginResponseModel extends Equatable {
  final String? id;
  final String? email;
  final String? accessToken;
  final String? refreshToken;
  final String? message;
  final bool isSuccess;
  final String? errorMessage;
  final String? errorCode;

  const LoginResponseModel({
    this.id,
    this.email,
    this.accessToken,
    this.refreshToken,
    this.message,
    required this.isSuccess,
    this.errorMessage,
    this.errorCode,
  });

  factory LoginResponseModel.success({
    String? id,
    String? email,
    String? accessToken,
    String? refreshToken,
    String? message,
  }) {
    return LoginResponseModel(
      id: id,
      email: email,
      accessToken: accessToken,
      refreshToken: refreshToken,
      message: message ?? 'Login successful!',
      isSuccess: true,
    );
  }

  factory LoginResponseModel.failure({
    required String errorMessage,
    String? errorCode,
  }) {
    return LoginResponseModel(
      isSuccess: false,
      errorMessage: errorMessage,
      errorCode: errorCode,
    );
  }

  @override
  List<Object?> get props => [
    id,
    email,
    accessToken,
    refreshToken,
    message,
    isSuccess,
    errorMessage,
    errorCode,
  ];

  LoginResponseModel copyWith({
    String? id,
    String? email,
    String? accessToken,
    String? refreshToken,
    String? message,
    bool? isSuccess,
    String? errorMessage,
    String? errorCode,
  }) {
    return LoginResponseModel(
      id: id ?? this.id,
      email: email ?? this.email,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      message: message ?? this.message,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
      errorCode: errorCode ?? this.errorCode,
    );
  }
}
