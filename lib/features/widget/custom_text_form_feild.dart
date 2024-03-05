import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final bool enableSelection;
  final String? value;
  final bool obscureText;
  final Widget? iconData;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController mycontroller;
  final Function()? onTap;
  final TextInputType? keyboardType;
  final bool password;
  //  final int? minLines;
  // final int? maxines;

  const CustomTextFormField({
    super.key,
    this.keyboardType,
    this.onTap,
    this.enableSelection = false,
    this.obscureText = false,
    required this.hintText,
    this.validator,
    required this.mycontroller,
    this.iconData,
    this.password = false,
    this.value,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 15.h, right: 10.w, left: 10.w),
        child: TextFormField(
            initialValue: value,
            controller: mycontroller,
            keyboardType: keyboardType,
            enableInteractiveSelection: false,
            //hide password
            obscureText: obscureText,
            //validate
            validator: validator,
            decoration: InputDecoration(
              prefixIcon: password == true
                  ? InkWell(
                      onTap: onTap,
                      child: iconData,
                    )
                  : iconData,

              ///error border
              focusedErrorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: Colors.red, width: 1.5)),
              errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: Colors.red, width: 1.5)),
              errorStyle: const TextStyle(fontFamily: 'Lemon'),
              //label
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.grey),
              ///////enable border
              focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: Colors.grey, width: 1.5.w)),
              ////////
              enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: Colors.grey, width: 1.5.w)),
            )));
  }
}
