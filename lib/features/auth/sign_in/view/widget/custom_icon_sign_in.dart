import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconCustomSignIn extends StatelessWidget {
  final String? path; 
  final Function()? onTap;
  const IconCustomSignIn({
    super.key,
    this.path,  this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.w,
      height: 50.h,
      child: InkWell( 
        onTap: onTap,
        child: Image.asset(path!),
      ),
    );
  }
}
