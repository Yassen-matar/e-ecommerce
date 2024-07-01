import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/core/routing/app_routes.dart';
import 'package:untitled/core/routing/multi_bloc_provider.dart';
import 'package:untitled/features/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: providers(context),
        child: ScreenUtilInit(
            builder: (context, child) => MaterialApp(
                  theme: ThemeData(
                      scaffoldBackgroundColor: Colors.white,
                      appBarTheme: const AppBarTheme(
                          elevation: 0, backgroundColor: Colors.white)),
                  onGenerateRoute: AppRouter.generateRoute,
                  debugShowCheckedModeBanner: false,
                  home: const HomeScreen(),
                )));
  }
}
