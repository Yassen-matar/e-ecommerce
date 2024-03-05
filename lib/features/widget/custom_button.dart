import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final bool? borderSide;
  final Color? color;
  final bool? isStyle;
  final TextStyle? textStyle; 
  final Function()? onPressed;
  const CustomButton(
      {super.key,
      this.title,
      this.borderSide = false,
      this.color,
      this.isStyle = false,
       this.textStyle, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      onPressed:onPressed ,
      minWidth: 290.w,
      height: 50.h,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: borderSide == true ? const BorderSide() : BorderSide.none),
      child: Text(
        title!,
        style: isStyle == false ? TextStyle(fontSize: 18.sp) : textStyle,
      ),
    );
  }
}
