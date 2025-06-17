import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel/features/auth/sign_up/logic/sign_up_event.dart';
import 'package:nawel/features/auth/sign_up/logic/sign_up_state.dart';
import 'package:nawel/features/auth/sign_up/data/repo/sign_up_repo.dart';
import 'package:nawel/features/auth/sign_up/data/model/sign_up_request_model.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpRepo _signUpRepo;

  SignUpBloc(this._signUpRepo) : super(const SignUpInitial()) {
    on<SignUpRequested>(_onSignUpRequested);
    on<SignUpReset>(_onSignUpReset);
  }

  Future<void> _onSignUpRequested(
    SignUpRequested event,
    Emitter<SignUpState> emit,
  ) async {
    emit(const SignUpLoading());

    try {
      final request = SignUpRequestModel(
        email: event.email,
        password: event.password,
      );

      final response = await _signUpRepo.signUp(request);

      if (response.isSuccess) {
        emit(
          SignUpSuccess(
            message: response.message ?? 'Account created successfully!',
            userId: response.id,
          ),
        );
      } else {
        emit(
          SignUpError(
            error: response.errorMessage ?? 'Sign up failed',
            errorCode: response.errorCode,
          ),
        );
      }
    } catch (e) {
      emit(
        SignUpError(
          error: 'An unexpected error occurred: ${e.toString()}',
          errorCode: 'UNKNOWN_ERROR',
        ),
      );
    }
  }

  void _onSignUpReset(SignUpReset event, Emitter<SignUpState> emit) {
    emit(const SignUpInitial());
  }
}
