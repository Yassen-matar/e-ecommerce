import 'package:flutter/material.dart';
import 'package:untitled/core/routing/routes.dart';
import 'package:untitled/features/admin/categorias/view/categorias.dart';
import 'package:untitled/features/admin/home/view/home_admin.dart';
import 'package:untitled/features/admin/view_categorais/view/view_categorais.dart';
import 'package:untitled/features/auth/sign_in/view/sign_in/sign_in.dart';
import 'package:untitled/features/auth/sign_up/view/sign_up.dart';

import '../../features/home/home_screen.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    /*  final arguments = settings.arguments;*/

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      ////////////////
      case AppRoute.signIn:
        return MaterialPageRoute(
          builder: (_) => const SignIn(),
        );
      ////////////////
      case AppRoute.signUp:
        return MaterialPageRoute(
          builder: (_) => const SignUp(),
        );
      ////////////////categorias
      case AppRoute.categorias:
        return MaterialPageRoute(
          builder: (_) => const Categorias(),
        );
      /////////////////home
      case AppRoute.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      /////////////////
      case AppRoute.viewCategorias:
        return MaterialPageRoute(
          builder: (_) => const ViewCategorais(),
        );
      /////////////////
      case AppRoute.homeAdmin:
        return MaterialPageRoute(
          builder: (_) => const HomeAdmin(),
        );
      /////////////////
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
