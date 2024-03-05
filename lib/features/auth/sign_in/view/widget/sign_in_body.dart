import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/core/routing/extensions.dart';
import 'package:untitled/features/auth/sign_in/view/manegr/bloc/sign_in_bloc.dart';
import 'package:untitled/features/auth/sign_in/view/sign_in.dart';
import 'package:untitled/features/auth/sign_in/view/widget/row_icon_sign_in.dart';
import 'package:untitled/features/auth/sign_in/view/widget/text_form_feild_sign_in.dart';

import '../../../../../core/constant/style.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../widget/custom_button.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({
    super.key,
    required this.email,
    required this.password,
    required this.formKey,
  });

  final TextEditingController email;
  final TextEditingController password;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: RowIconSignIn(
            onTapGoogle: () {
              BlocProvider.of<SignInBloc>(context)
                        .add(SignInWithGoogle());
            },
            onTapGithub: () { 
              
               BlocProvider.of<SignInBloc>(context)
                        .add(SignInWithGithub());},
          ),
        ),
        Text(
          "or use email account login",
          style: TextStyles.fontGrey16Normal,
        ),
        ColumTextFormFeildSignIn(
            email: email, password: password, formKey: formKey),
        CustomButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              BlocProvider.of<SignInBloc>(context).add(SignInWithEmailPassowrd(
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
        Padding(
          padding: EdgeInsets.only(top: 20.0.h),
          child: CustomButton(
            borderSide: true,
            title: "Rigester",
            onPressed: () => context.pushNamed(AppRoute.signUp),
          ),
        )
      ]),
    );
  }
}
