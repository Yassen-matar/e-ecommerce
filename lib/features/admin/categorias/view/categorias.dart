import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/core/constant/app_color.dart';
import 'package:untitled/features/admin/categorias/view/varibel/varible.dart';
import 'package:untitled/features/admin/categorias/view/widget/categorias_column_text_form_field.dart';
import 'package:untitled/features/auth/sign_in/view/sign_in/widget/app_bar.dart';
import 'package:untitled/features/widget/custom_button.dart';

class Categorias extends StatelessWidget {
  const Categorias({super.key});

  @override
  Widget build(BuildContext context) {
    final varibel = CategoriasVaribale();
    return Scaffold(
      appBar: appBarSignUp("Categorias"),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.h,
              ),
              const Text("Pleas add categorias"),
              SizedBox(
                height: 50.h,
              ),
              ColumTextFormFeildCategorias(
                formKey: varibel.formKey,
                name: varibel.name,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  isStyle: true,
                  textStyle: const TextStyle(
                      color: AppColor.kPrimaryLightColor, fontSize: 20),
                  color: AppColor.kPrimaryColor,
                  title: "Enter",
                  onPressed: () { 
                    
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
