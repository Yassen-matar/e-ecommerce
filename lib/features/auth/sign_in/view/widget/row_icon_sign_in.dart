import 'package:flutter/material.dart';
import 'package:untitled/core/constant/image.dart';
import 'package:untitled/features/auth/sign_in/view/widget/custom_icon_sign_in.dart';

class RowIconSignIn extends StatelessWidget {
  final  Function()? onTapGoogle;
  const RowIconSignIn({super.key, this.onTapGoogle});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconCustomSignIn( 
          onTap: onTapGoogle,
          path: AppImage.google,
        ),
       const IconCustomSignIn(
          path: AppImage.apple,
        ),
       const IconCustomSignIn(
          path: AppImage.facebook,
        ),
      ],
    );
  }
}
