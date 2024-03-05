import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled/core/routing/extensions.dart';
import 'package:untitled/core/routing/routes.dart';
import 'package:untitled/features/auth/sign_in/view/manegr/bloc/sign_in_bloc.dart';
import 'package:untitled/features/auth/sign_in/view/widget/app_bar.dart';
import 'package:untitled/features/auth/sign_in/view/widget/sign_in_body.dart';
import '../../../../core/function/snack_bar.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    return Scaffold(
        appBar: appBarSignUp("LogIn"),
        body: BlocConsumer<SignInBloc, SignInState>(listener: (context, state) {
          if (state is SignInSucsses) {
            firebaseAuth.currentUser!.emailVerified
                ? context.pushReplacementNamed(AppRoute.home)
                : ScaffoldMessenger.of(context)
                    .showSnackBar(snackBarWidget("email not verify"));
          } else if (state is SignInFaliure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(snackBarWidget(state.errorMessage));
          } else if (state is SignInSuccessWithGoogle) {
            context.pushNamed(AppRoute.home);
            ScaffoldMessenger.of(context)
                .showSnackBar(snackBarWidget("Success"));
          }
        }, builder: (context, state) {
          if (state is SignInLoding) {
            return Center(
                child: Lottie.asset('assets/lotti/infinity-loop.json'));
          }
          return SignInBody(email: email, password: password, formKey: formKey);
        }));
  }
}
