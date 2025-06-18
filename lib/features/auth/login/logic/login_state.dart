import 'package:equatable/equatable.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

final class LoginInitial extends LoginState {
  const LoginInitial();
}

final class LoginLoading extends LoginState {
  const LoginLoading();
}

final class LoginSuccess extends LoginState {
  final String message;
  final String? userId;
  final String? accessToken;

  const LoginSuccess({required this.message, this.userId, this.accessToken});

  @override
  List<Object?> get props => [message, userId, accessToken];

  LoginSuccess copyWith({
    String? message,
    String? userId,
    String? accessToken,
  }) {
    return LoginSuccess(
      message: message ?? this.message,
      userId: userId ?? this.userId,
      accessToken: accessToken ?? this.accessToken,
    );
  }
}

final class LoginError extends LoginState {
  final String error;
  final String? errorCode;

  const LoginError({required this.error, this.errorCode});

  @override
  List<Object?> get props => [error, errorCode];

  LoginError copyWith({String? error, String? errorCode}) {
    return LoginError(
      error: error ?? this.error,
      errorCode: errorCode ?? this.errorCode,
    );
  }
}
