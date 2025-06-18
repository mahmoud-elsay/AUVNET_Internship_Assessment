import 'package:nawel/nawel.dart';
import 'package:nawel/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel/core/routing/routes.dart';
import 'package:nawel/core/routing/app_router.dart';
import 'package:nawel/core/helpers/supabase_helper.dart';
import 'package:nawel/core/helpers/simple_bloc_observer.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize Supabase first
    await SupabaseHelper.init();

    await setupGetIt();

    runApp(
      Nawel(appRoutes: AppRouter(), initialRoute: Routes.onBoardingScreen),
    );
  } catch (e) {
    runApp(
      MaterialApp(
        home: Scaffold(body: Center(child: Text('Initialization Error: $e'))),
      ),
    );
  }
}
