
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/features/auth/sign_up/view/manger/bloc/sign_up_bloc.dart';
import 'package:untitled/features/auth/sign_up/view/widget/custom_column_text_form_feild.dart';

import '../../../../../core/constant/style.dart';
import '../../../../widget/custom_button.dart';
import '../../../sign_in/view/sign_in/widget/row_icon_sign_in.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({
    super.key,
    required this.formKey,
    required this.email,
    required this.password,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController email;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.only(
              top: 50.0.h, right: 30.w, left: 30.w, bottom: 30.h),
          child: RowIconSignIn(
            onTapGithub: () {
              BlocProvider.of<SignUpBloc>(context)
                  .add(SignUpWithGithub());
            },
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
        /////in text form field
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
  }
}