import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nawel/features/auth/login/logic/login_bloc.dart';
import 'package:nawel/features/auth/sign_up/logic/sign_up_bloc.dart';
import 'package:nawel/features/auth/login/data/repo/login_repo.dart';
import 'package:nawel/features/auth/sign_up/data/repo/sign_up_repo.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Supabase Client - Register as singleton
  getIt.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

  // SignUp Repository - Register as singleton
  getIt.registerLazySingleton<SignUpRepo>(
    () => SignUpRepo(getIt<SupabaseClient>()),
  );

  // SignUp Bloc - Register as factory (new instance each time)
  getIt.registerFactory<SignUpBloc>(() => SignUpBloc(getIt<SignUpRepo>()));

  // Login Repository - Register as singleton
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepo(getIt<SupabaseClient>()),
  );

  // Login Bloc - Register as factory (new instance each time)
  getIt.registerFactory<LoginBloc>(() => LoginBloc(getIt<LoginRepo>()));

  
}