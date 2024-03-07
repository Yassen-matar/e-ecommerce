import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInVaribale {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
}
