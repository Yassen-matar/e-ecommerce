// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/core/routing/extensions.dart';
import 'package:untitled/core/routing/routes.dart';

class CustomButtonWelcome extends StatelessWidget {
  final String? buttonText;
  late int index;
  final PageController controller;
  CustomButtonWelcome(
      {super.key,
      required this.buttonText,
      required this.index,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: MaterialButton(
        height: 50.h,
        minWidth: 250.w,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        onPressed: () {
          if (index < 2) {
            index++;
            controller.animateToPage(index,
                duration: const Duration(milliseconds: 800),
                curve: Curves.decelerate);
          } else {
            context.pushReplacementNamed(AppRoute.signIn);
          }
        },
        color: Colors.deepPurple,
        child: Text(
          buttonText!,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
