import 'package:nawel/nawel.dart';
import 'package:flutter/material.dart';
import 'package:nawel/core/routing/routes.dart';
import 'package:nawel/core/routing/app_router.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Nawel(appRoutes: AppRouter(), initialRoute: Routes.onBoardingScreen));
}