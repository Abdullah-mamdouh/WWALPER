import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wwalper_app/core/di/injection.dart';
import 'package:wwalper_app/core/routing/routes.dart';
import 'package:wwalper_app/features/splash/splash_screen.dart';

import '../../features/auth/logic/sign-up_cubit/sign_up_cubit.dart';
import '../../features/auth/logic/sign_in_cubit/sign_in_cubit.dart';
import '../../features/auth/ui/login/login_screen.dart';
import '../../features/auth/ui/register/register_screen.dart';


class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be bassed in any screen like this >> (arguments as ClassName)
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

        case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignInCubit>(),
            child:const LoginScreen(),
          ),
        );

      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: RegisterScreen(),
          ),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: RegisterScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  appBar: AppBar(),
                  body: Center(
                    child: Text('No route define for ${settings.name}'),
                  ),
                ));
    }
  }
}
