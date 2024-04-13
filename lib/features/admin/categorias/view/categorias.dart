import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled/core/constant/app_color.dart';
import 'package:untitled/core/routing/extensions.dart';
import 'package:untitled/core/routing/routes.dart';
import 'package:untitled/features/admin/categorias/view/manger/bloc/categorias_bloc.dart';
import 'package:untitled/features/admin/categorias/view/varibel/varible.dart';
import 'package:untitled/features/admin/categorias/view/widget/categorias_column_text_form_field.dart';
import 'package:untitled/features/auth/sign_in/view/sign_in/widget/app_bar.dart';
import 'package:untitled/features/widget/custom_button.dart';
import 'package:untitled/globals.dart' as global;
import '../../../../core/constant/svg.dart';
import '../../../../core/function/snack_bar.dart';

class Categorias extends StatelessWidget {
  const Categorias({super.key});

  @override
  Widget build(BuildContext context) {
    global.url = "";
    final varibel = CategoriasVaribale();
    return Scaffold(
      appBar: appBarSignUp("Categorias"),
      body: BlocConsumer<CategoriasBloc, CategoriasState>(
        listener: (context, state) {
          if (state is CategoriasSuccess) {
            context.pushReplacementNamed(AppRoute.home);
            ScaffoldMessenger.of(context)
                .showSnackBar(snackBarCategorais("Added Successfully"));
          }
          if (state is CategoraisUploadImageSuccess) {
            ScaffoldMessenger.of(context)
                .showSnackBar(snackBarCategorais("Added Image Successfully"));
          }
          /////////////////////////////////////
          else if (state is CategoriasFaliure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(snackBarWidget(state.masseage!));
          }
        },
        builder: (context, state) {
          if (state is CategoriasLoding) {
            return Center(child: Lottie.asset(AppSvg.loding));
          }
          return SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  const Text(
                    "Pleas add categorias",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  ColumTextFormFeildCategorias(
                    formKey: varibel.formKey,
                    name: varibel.name,
                  ),
                  CustomButton(
                      isStyle: true,
                      textStyle: const TextStyle(
                          color: AppColor.kPrimaryLightColor, fontSize: 20),
                      color: global.url != ""
                          ? AppColor.kSuccussColor
                          : AppColor.kPrimaryColor,
                      title: "Add Image Pleas",
                      onPressed: () {
                        BlocProvider.of<CategoriasBloc>(context)
                            .add(UploadFileEvent());
                      }),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      isStyle: true,
                      textStyle: const TextStyle(
                          color: AppColor.kPrimaryLightColor, fontSize: 20),
                      color: AppColor.kPrimaryColor,
                      title: "Enter",
                      onPressed: () {
                        if (varibel.formKey.currentState!.validate()) {
                          BlocProvider.of<CategoriasBloc>(context)
                              .add(AddCategorias(name: varibel.name.text));
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
