import 'package:flutter/material.dart';
import 'package:untitled/core/constant/image.dart';
import 'package:untitled/features/auth/sign_in/view/sign_in/widget/custom_icon_sign_in.dart';

class RowIconSignIn extends StatelessWidget {
  final Function()? onTapGoogle;
  final Function()? onTapGithub;
  const RowIconSignIn({super.key, this.onTapGoogle, this.onTapGithub});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconCustomSignIn(
          onTap: onTapGoogle,
          path: AppImage.google,
        ),
        IconCustomSignIn(
          onTap: onTapGithub,
          path: AppImage.github,
        ),
        const IconCustomSignIn(
          path: AppImage.facebook,
        ),
      ],
    );
  }
}
