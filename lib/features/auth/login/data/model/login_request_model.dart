import 'package:equatable/equatable.dart';

class LoginRequestModel extends Equatable {
  final String email;
  final String password;

  const LoginRequestModel({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];

  LoginRequestModel copyWith({String? email, String? password}) {
    return LoginRequestModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {'email': email, 'password': password};
  }
}
