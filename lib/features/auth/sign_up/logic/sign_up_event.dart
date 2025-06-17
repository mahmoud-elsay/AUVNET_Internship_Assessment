import 'package:equatable/equatable.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object?> get props => [];
}

final class SignUpRequested extends SignUpEvent {
  final String email;
  final String password;

  const SignUpRequested({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];

  SignUpRequested copyWith({String? email, String? password}) {
    return SignUpRequested(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}

final class SignUpReset extends SignUpEvent {
  const SignUpReset();
}
