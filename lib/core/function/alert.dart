import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

final AlertDialog alert = AlertDialog(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
  content: SizedBox(
      width: 100,
      height: 100,
      child: Lottie.asset(
        height: 100,
        width: 100,
        'assets/lotti/animation_lmt8n3s1.json',
      )),
);
