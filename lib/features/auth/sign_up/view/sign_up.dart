import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled/core/routing/extensions.dart';
import 'package:untitled/core/routing/routes.dart';
import 'package:untitled/features/auth/sign_in/view/sign_in/widget/app_bar.dart';
import 'package:untitled/features/auth/sign_up/view/manger/bloc/sign_up_bloc.dart';
import 'package:untitled/features/auth/sign_up/view/state/varibel_sign_up.dart';
import 'package:untitled/features/auth/sign_up/view/widget/sign_up_body.dart';
import '../../../../core/function/snack_bar.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final varibel = SignUpVaribel();
    return Scaffold(
        appBar: appBarSignUp("SignUp"),

        /// condition Bloc
        body: BlocConsumer<SignUpBloc, SignUpState>(listener: (context, state) {
          if (state is SignUpSuccess) {
            context.pushNamed(AppRoute.signIn);
            ScaffoldMessenger.of(context)
                .showSnackBar(snackBarWidget("verify email in gmail"));
          }
          //////////////////////////////////////
          else if (state is SignUpSuccessWithGoogle) {
            context.pushNamed(AppRoute.home);
            ScaffoldMessenger.of(context)
                .showSnackBar(snackBarWidget("Success"));
          }
          //////////////////////////////////////
          else if (state is SignUpFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(snackBarWidget(state.errMessage));
          }
        }, builder: (context, state) {
          if (state is SignUpLoding) {
            return Center(
                child: Lottie.asset('assets/lotti/infinity-loop.json'));
          }
          return SignUpBody(
              formKey: varibel.formKey,
              email: varibel.email,
              password: varibel.password);
        }));
  }
}
