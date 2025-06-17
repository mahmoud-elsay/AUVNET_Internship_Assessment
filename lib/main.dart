import 'package:nawel/nawel.dart';
import 'package:flutter/material.dart';
import 'package:nawel/core/routing/routes.dart';
import 'package:nawel/core/routing/app_router.dart';
import 'package:nawel/core/helpers/supabase_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseHelper.init();
  runApp(Nawel(appRoutes: AppRouter(), initialRoute: Routes.onBoardingScreen));
}
