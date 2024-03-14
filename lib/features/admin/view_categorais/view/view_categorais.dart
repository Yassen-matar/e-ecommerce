import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled/core/constant/svg.dart';

import 'package:untitled/features/admin/view_categorais/view/manger/bloc/view_categorais_bloc.dart';
import 'package:untitled/features/admin/view_categorais/view/widget/view_categorais_body.dart';
import 'package:untitled/features/auth/sign_in/view/sign_in/widget/app_bar.dart';

import '../../../../core/function/snack_bar.dart';

class ViewCategorais extends StatelessWidget {
  const ViewCategorais({super.key});

  @override
  Widget build(BuildContext context) {
    List? data = [];
    return Scaffold(
      appBar: appBarSignUp("View Categorais"),
      body: BlocConsumer<ViewCategoraisBloc, ViewCategoraisState>(
        listener: (context, state) {
          if (state is ViewCategoraisFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(snackBarWidget(state.message));
          }
          if (state is ViewCategoraisSuccuss) {
            data.addAll(state.categorais);
          }
        },
        builder: (context, state) {
          if (state is ViewCategoraisLoding) {
            return Center(child: Lottie.asset(AppSvg.loding));
          }
          return ViewCategoraisBody(data: data);
        },
      ),
    );
  }
}
