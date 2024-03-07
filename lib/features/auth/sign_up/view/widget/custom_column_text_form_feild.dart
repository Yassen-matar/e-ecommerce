import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/core/validation/validation.dart';
import 'package:untitled/features/auth/sign_in/view/sign_in/widget/title_form.dart';

import '../../../../widget/custom_text_form_feild.dart';

class ColumTextFormFeildSignUp extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController email;
  final TextEditingController password;
  const ColumTextFormFeildSignUp({
    super.key,
    required this.formKey, required this.email, required this.password,
  });

 
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.h),
      padding: EdgeInsets.all(20.h),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleForm(
              title: " Email ",
            ),
            CustomTextFormField(
              keyboardType: TextInputType.emailAddress,
              iconData: const Icon(Icons.person),
              hintText: "Enter email pleas",
              mycontroller: email,
              validator: (val) => vailedate(val!, 8, 50, 'email'),
            ),
            const TitleForm(
              title: " Password ",
            ),
            CustomTextFormField(
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              iconData: const Icon(Icons.lock_outlined),
              hintText: "Enter password pleas",
              mycontroller: password,
              validator: (val) => vailedate(val!, 8, 15, 'password'),
            ),
          ],
        ),
      ),
    );
  }
}
