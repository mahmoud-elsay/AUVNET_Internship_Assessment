import 'package:flutter/material.dart';
import 'package:nawel/core/routing/app_router.dart';
import 'package:nawel/core/theming/colors_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Nawel extends StatelessWidget {
  final AppRouter appRoutes;
  final String initialRoute;

  const Nawel({super.key, required this.appRoutes, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Nawel',
        theme: ThemeData(
          scaffoldBackgroundColor: ColorsManager.white,
          primaryColor: ColorsManager.primaryPurple,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            iconTheme: IconThemeData(color: ColorsManager.primaryPurple),
            scrolledUnderElevation: 0,
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: initialRoute,
        onGenerateRoute: appRoutes.generateRoute,
      ),
    );
  }
}
