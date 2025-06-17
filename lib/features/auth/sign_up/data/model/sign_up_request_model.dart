import 'package:equatable/equatable.dart';

class SignUpRequestModel extends Equatable {
  final String email;
  final String password;
  final Map<String, dynamic>? userData;

  const SignUpRequestModel({
    required this.email,
    required this.password,
    this.userData,
  });

  @override
  List<Object?> get props => [email, password, userData];

  SignUpRequestModel copyWith({
    String? email,
    String? password,
    Map<String, dynamic>? userData,
  }) {
    return SignUpRequestModel(
      email: email ?? this.email,
      password: password ?? this.password,
      userData: userData ?? this.userData,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      if (userData != null) 'data': userData,
    };
  }
}
