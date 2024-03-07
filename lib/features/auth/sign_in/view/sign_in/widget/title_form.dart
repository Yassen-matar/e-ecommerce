import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constant/style.dart';

class TitleForm extends StatelessWidget {
  final String? title;
  const TitleForm({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 13.w, bottom: 5.h),
      child: Text(
        title!,
        style: TextStyles.fontGrey16Normal,
      ),
    );
  }
}
