import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wwalper_app/core/di/injection.dart';
import 'package:wwalper_app/core/routing/routes.dart';
import 'package:wwalper_app/core/widgets/no_internet_connection_widget.dart';
import 'package:wwalper_app/features/favorite/data/models/argument_model.dart';
import 'package:wwalper_app/features/favorite/logic/favorite_provider.dart';
import 'package:wwalper_app/features/home/logic/home_provider.dart';
import 'package:wwalper_app/features/home/ui/home_screen.dart';
import 'package:wwalper_app/features/home/ui/manager_screen.dart';
import 'package:wwalper_app/features/splash/splash_screen.dart';

import '../../features/auth/logic/sign-up_provider/sign_up_provider.dart';
import '../../features/auth/logic/sign_in_provider/sign_in_provider.dart';
import '../../features/auth/ui/login/login_screen.dart';
import '../../features/auth/ui/register/register_screen.dart';
import '../../features/photo_details/image_detail_screen.dart';


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
          builder: (_) => const LoginScreen(),
        );

      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => RegisterScreen(),
        );
      case Routes.managerScreen:
        return MaterialPageRoute(
          builder: (_) => ManagerScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );

        case Routes.imageDetailsScreen:
        return MaterialPageRoute(
          builder: (_) =>  ImageDetailScreen(argumentModel: args as ArgumentModel,),
        );

      case Routes.noInternetScreen:
        return MaterialPageRoute(
          builder: (_) => NoInternetConnectionWidget(),
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
