// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/features/welcome/widget/custom_button.dart';

class ColumnPageViwe extends StatelessWidget {
  final String? buttonText;
  final String? pathImage;
  final String? textTitle;
  final String? subTitle;
  late int index;
  final PageController controller;
  ColumnPageViwe({
    super.key,
    this.buttonText,
    this.pathImage,
    this.textTitle,
    this.subTitle,
    required this.index,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          width: 250.w,
          height: 345.h,
          child: Image.asset(pathImage!),
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            textTitle!,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 80.w),
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            subTitle!,
            style: const TextStyle(color: Colors.grey),
          ),
        ),
        CustomButtonWelcome(
            buttonText: buttonText, index: index, controller: controller)
      ],
    );
  }
}
