import 'package:flutter/material.dart';
import 'package:untitled/core/routing/routes.dart';
import 'package:untitled/features/auth/sign_in/view/sign_in.dart';
import 'package:untitled/features/auth/sign_up/view/sign_up.dart';
import 'package:untitled/features/home/home.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    /*  final arguments = settings.arguments;*/

    switch (settings.name) {
      case AppRoute.home:
        return MaterialPageRoute(
          builder: (_) => const Home(),
        );
      case AppRoute.signIn:
        return MaterialPageRoute(
          builder: (_) => const SignIn(),
        ); 
         case AppRoute.signUp:
        return MaterialPageRoute(
          builder: (_) => const SignUp(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
