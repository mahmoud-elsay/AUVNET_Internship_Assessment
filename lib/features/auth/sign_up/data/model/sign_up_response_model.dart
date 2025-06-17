import 'package:equatable/equatable.dart';

class SignUpResponseModel extends Equatable {
  final String? id;
  final String? email;
  final String? message;
  final bool isSuccess;
  final String? errorMessage;
  final String? errorCode;

  const SignUpResponseModel({
    this.id,
    this.email,
    this.message,
    required this.isSuccess,
    this.errorMessage,
    this.errorCode,
  });

  factory SignUpResponseModel.success({
    String? id,
    String? email,
    String? message,
  }) {
    return SignUpResponseModel(
      id: id,
      email: email,
      message: message ?? 'Account created successfully!',
      isSuccess: true,
    );
  }

  factory SignUpResponseModel.failure({
    required String errorMessage,
    String? errorCode,
  }) {
    return SignUpResponseModel(
      isSuccess: false,
      errorMessage: errorMessage,
      errorCode: errorCode,
    );
  }

  @override
  List<Object?> get props => [
    id,
    email,
    message,
    isSuccess,
    errorMessage,
    errorCode,
  ];

  SignUpResponseModel copyWith({
    String? id,
    String? email,
    String? message,
    bool? isSuccess,
    String? errorMessage,
    String? errorCode,
  }) {
    return SignUpResponseModel(
      id: id ?? this.id,
      email: email ?? this.email,
      message: message ?? this.message,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
      errorCode: errorCode ?? this.errorCode,
    );
  }
}
