import 'package:nawel/nawel.dart';
import 'package:nawel/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:nawel/core/routing/routes.dart';
import 'package:nawel/core/routing/app_router.dart';
import 'package:nawel/core/helpers/supabase_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize Supabase first
    await SupabaseHelper.init();

    await setupGetIt();

    runApp(
      Nawel(appRoutes: AppRouter(), initialRoute: Routes.onBoardingScreen),
    );
  } catch (e) {
    // Handle initialization errors
    runApp(
      MaterialApp(
        home: Scaffold(body: Center(child: Text('Initialization Error: $e'))),
      ),
    );
  }
}
