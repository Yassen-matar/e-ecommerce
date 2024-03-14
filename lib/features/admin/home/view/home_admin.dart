import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/core/constant/app_color.dart';
import 'package:untitled/core/constant/style.dart';
import 'package:untitled/features/auth/sign_in/view/sign_in/widget/app_bar.dart';

class HomeAdmin extends StatelessWidget {
  const HomeAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarSignUp("Home Admin"),
        body: GridView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(10.h),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              mainAxisExtent: 160),
          children: [
            titleSection("Add Categorais"),
            titleSection("View Categorais"),
            titleSection("Add Special for user"),
            titleSection("View Speical")
          ],
        ));
  }

  Container titleSection(String titlt) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColor.kGreyColor,
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          titlt,
          style: TextStyles.fontDarkGrey16Normal,
        ));
  }
}
