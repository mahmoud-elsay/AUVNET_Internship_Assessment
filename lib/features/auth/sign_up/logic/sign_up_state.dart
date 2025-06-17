import 'package:equatable/equatable.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object?> get props => [];
}

final class SignUpInitial extends SignUpState {
  const SignUpInitial();
}

final class SignUpLoading extends SignUpState {
  const SignUpLoading();
}

final class SignUpSuccess extends SignUpState {
  final String message;
  final String? userId;

  const SignUpSuccess({required this.message, this.userId});

  @override
  List<Object?> get props => [message, userId];

  SignUpSuccess copyWith({String? message, String? userId}) {
    return SignUpSuccess(
      message: message ?? this.message,
      userId: userId ?? this.userId,
    );
  }
}

final class SignUpError extends SignUpState {
  final String error;
  final String? errorCode;

  const SignUpError({required this.error, this.errorCode});

  @override
  List<Object?> get props => [error, errorCode];

  SignUpError copyWith({String? error, String? errorCode}) {
    return SignUpError(
      error: error ?? this.error,
      errorCode: errorCode ?? this.errorCode,
    );
  }
}
