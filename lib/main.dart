import 'package:nawel/nawel.dart';
import 'package:nawel/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:nawel/core/routing/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel/core/routing/app_router.dart';
import 'package:nawel/core/storage/auth_service.dart';
import 'package:nawel/core/storage/storage_service.dart';
import 'package:nawel/core/helpers/supabase_helper.dart';
import 'package:nawel/core/helpers/simple_bloc_observer.dart';

void main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Set up Bloc observer
  Bloc.observer = SimpleBlocObserver();

  // Initialize services with minimum delay
  await Future.wait([
    SupabaseHelper.init(),
    StorageService.init(),
    setupGetIt(),
    Future.delayed(const Duration(milliseconds: 500)),
  ]);

  runApp(Nawel(appRoutes: AppRouter(), initialRoute: Routes.splashScreen));
}
