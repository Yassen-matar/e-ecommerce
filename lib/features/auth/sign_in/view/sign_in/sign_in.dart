import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled/core/routing/extensions.dart';
import 'package:untitled/core/routing/routes.dart';
import 'package:untitled/features/auth/sign_in/view/sign_in/manegr/bloc/sign_in_bloc.dart';
import 'package:untitled/features/auth/sign_in/view/sign_in/state/state.dart';
import 'package:untitled/features/auth/sign_in/view/sign_in/widget/app_bar.dart';
import 'package:untitled/features/auth/sign_in/view/sign_in/widget/sign_in_body.dart';
import '../../../../../core/function/snack_bar.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});
  @override
  Widget build(BuildContext context) {
    final varibel = SignInVaribale();
    return Scaffold(
        appBar: appBarSignUp("LogIn"),
        body: BlocConsumer<SignInBloc, SignInState>(listener: (context, state) {
          if (state is SignInSucsses) {
            varibel.firebaseAuth.currentUser!.emailVerified
                ? context.pushReplacementNamed(AppRoute.home)
                : ScaffoldMessenger.of(context)
                    .showSnackBar(snackBarWidget("email not verify"));
          }  
          /////////////////////////////////////
          else if (state is SignInFaliure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(snackBarWidget(state.errorMessage));
          } 
          /////////////////////////////////////
          else if (state is SignInSuccessWithGoogle) {
            context.pushNamed(AppRoute.home);
            ScaffoldMessenger.of(context)
                .showSnackBar(snackBarWidget("Success"));
          }
          /////////////////////////////////////
           else if (state is SignInWithForgetPasswordState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(snackBarWidget("Success go to gmail"));
          }
        }, builder: (context, state) {
          if (state is SignInLoding) {
            return Center(
                child: Lottie.asset('assets/lotti/infinity-loop.json'));
          }
          return SignInBody(
              email: varibel.email,
              password: varibel.password,
              formKey: varibel.formKey);
        }));
  }
}
