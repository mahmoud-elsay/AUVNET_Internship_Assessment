import 'package:nawel/nawel.dart';
import 'package:nawel/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel/core/routing/routes.dart';
import 'package:nawel/core/routing/app_router.dart';
import 'package:nawel/core/storage/storage_service.dart';
import 'package:nawel/core/helpers/supabase_helper.dart';
import 'package:nawel/core/helpers/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();

  await SupabaseHelper.init();
  await StorageService.init();
  await setupGetIt();

  runApp(Nawel(appRoutes: AppRouter(), initialRoute: Routes.splashScreen));
}
