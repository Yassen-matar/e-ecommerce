import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled/core/routing/extensions.dart';
import 'package:untitled/core/routing/routes.dart';
import 'package:untitled/features/auth/sign_in/view/widget/app_bar.dart';
import 'package:untitled/features/auth/sign_in/view/widget/row_icon_sign_in.dart';
import 'package:untitled/features/auth/sign_up/view/manger/bloc/sign_up_bloc.dart';
import 'package:untitled/features/auth/sign_up/view/widget/custom_column_text_form_feild.dart';
import 'package:untitled/features/widget/custom_button.dart';
import '../../../../core/constant/style.dart';
import '../../../../core/function/snack_bar.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    return Scaffold(
        appBar: appBarSignUp("SignUp"),

        /// condition Bloc
        body: BlocConsumer<SignUpBloc, SignUpState>(listener: (context, state) {
          if (state is SignUpSuccess) {
            context.pushNamed(AppRoute.signIn);
            ScaffoldMessenger.of(context)
                .showSnackBar(snackBarWidget("verify email in gmail"));
          } else if (state is SignUpSuccessWithGoogle) {
            context.pushNamed(AppRoute.home);
            ScaffoldMessenger.of(context)
                .showSnackBar(snackBarWidget("Success"));
          } else if (state is SignUpFailure) {
           
            ScaffoldMessenger.of(context)
                .showSnackBar(snackBarWidget(state.errMessage));
          }
        }, builder: (context, state) {
          if (state is SignUpLoding) {
            return Center(
                child: Lottie.asset('assets/lotti/infinity-loop.json'));
          }
          return SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 50.0.h, right: 30.w, left: 30.w, bottom: 30.h),
                child: RowIconSignIn(
                  onTapGoogle: () {
                    BlocProvider.of<SignUpBloc>(context)
                        .add(SignUpWithGoogle());
                  },
                ),
              ),
              Text(
                "or use email account sign up",
                style: TextStyles.fontGrey16Normal,
              ),
              ColumTextFormFeildSignUp(
                formKey: formKey,
                email: email,
                password: password,
              ),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<SignUpBloc>(context).add(
                        SignUpWithEmailPassowrd(
                            email: email.text, password: password.text));
                  }
                },
                color: Colors.deepPurple,
                isStyle: true,
                title: "Log In",
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                ),
              ),
            ]),
          );
        }));
  }
}
