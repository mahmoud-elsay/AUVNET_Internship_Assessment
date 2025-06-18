import 'package:equatable/equatable.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

final class LoginRequested extends LoginEvent {
  final String email;
  final String password;

  const LoginRequested({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];

  LoginRequested copyWith({String? email, String? password}) {
    return LoginRequested(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}

final class LoginReset extends LoginEvent {
  const LoginReset();
}
