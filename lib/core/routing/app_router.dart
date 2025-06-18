import 'package:flutter/material.dart';
import 'package:nawel/core/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel/core/routing/routes.dart';
import 'package:nawel/features/layout/layout.dart';
import 'package:nawel/features/home/ui/home_screen.dart';
import 'package:nawel/features/auth/login/ui/login_screen.dart';
import 'package:nawel/features/auth/login/logic/login_bloc.dart';
import 'package:nawel/features/onboarding/onboarding_screen.dart';
import 'package:nawel/features/auth/sign_up/ui/sign_up_screen.dart';
import 'package:nawel/features/auth/sign_up/logic/sign_up_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // Arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider<LoginBloc>(
                create: (context) => getIt<LoginBloc>(),
                child: const LoginScreen(),
              ),
        );

      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider<SignUpBloc>(
                create: (context) => getIt<SignUpBloc>(),
                child: const SignUpScreen(),
              ),
        );
         case Routes.layoutScreen:
        return MaterialPageRoute(
          builder: (context) => const Layout(),
        );
            case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
