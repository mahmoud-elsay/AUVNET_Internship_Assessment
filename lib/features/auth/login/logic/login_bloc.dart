import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel/core/storage/storage_service.dart';
import 'package:nawel/features/auth/login/logic/login_event.dart';
import 'package:nawel/features/auth/login/logic/login_state.dart';
import 'package:nawel/features/auth/login/data/repo/login_repo.dart';
import 'package:nawel/features/auth/login/data/model/login_request_model.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepo _loginRepo;

  LoginBloc(this._loginRepo) : super(const LoginInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<LoginReset>(_onLoginReset);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginLoading());

    try {
      final request = LoginRequestModel(
        email: event.email,
        password: event.password,
      );

      final response = await _loginRepo.login(request);

      if (response.isSuccess) {
        // Save user data to local storage
        if (response.accessToken != null &&
            response.refreshToken != null &&
            response.id != null) {
          await StorageService.saveUserData(
            accessToken: response.accessToken!,
            refreshToken: response.refreshToken!,
            userId: response.id!,
            email: response.email ?? event.email,
          );
        }

        emit(
          LoginSuccess(
            message: response.message ?? 'Login successful!',
            userId: response.id,
            accessToken: response.accessToken,
          ),
        );
      } else {
        emit(
          LoginError(
            error: response.errorMessage ?? 'Login failed',
            errorCode: response.errorCode,
          ),
        );
      }
    } catch (e) {
      emit(
        LoginError(
          error: 'An unexpected error occurred: ${e.toString()}',
          errorCode: 'UNKNOWN_ERROR',
        ),
      );
    }
  }

  void _onLoginReset(LoginReset event, Emitter<LoginState> emit) {
    emit(const LoginInitial());
  }
}
