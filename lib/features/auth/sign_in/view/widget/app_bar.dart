import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar appBarSignUp(String title) {
  return AppBar(
    bottom: const PreferredSize(
        preferredSize: Size.fromHeight(1.0), child: Divider()),
    title: Text(
      title,
      style: TextStyle(
        fontSize: 16.sp,
      ),
    ),
    centerTitle: true,
  );
}
