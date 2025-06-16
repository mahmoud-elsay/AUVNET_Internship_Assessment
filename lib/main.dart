import 'package:nawel/nawel.dart';
import 'package:flutter/material.dart';
import 'package:nawel/core/routing/routes.dart';
import 'package:nawel/core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 2));
  runApp(Nawel(appRoutes: AppRouter(), initialRoute: Routes.onBoardingScreen));
}
