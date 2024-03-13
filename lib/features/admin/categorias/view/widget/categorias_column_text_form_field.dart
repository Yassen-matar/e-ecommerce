import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/validation/validation.dart';
import '../../../../auth/sign_in/view/sign_in/widget/title_form.dart';
import '../../../../widget/custom_text_form_feild.dart';

class ColumTextFormFeildCategorias extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController name;
  const ColumTextFormFeildCategorias({
    super.key,
    required this.formKey,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.h),
      padding: EdgeInsets.all(20.h),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleForm(
              title: "Name",
            ),
            CustomTextFormField(
              keyboardType: TextInputType.emailAddress,
              iconData: const Icon(Icons.create_new_folder_rounded),
              hintText: "Enter name pleas",
              mycontroller: name,
              validator: (val) => vailedate(val!, 3, 50, 'none'),
            ),
          ],
        ),
      ),
    );
  }
}
