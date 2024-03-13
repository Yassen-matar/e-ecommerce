import 'package:flutter/material.dart';
import 'package:untitled/features/auth/sign_in/view/sign_in/widget/app_bar.dart';

class ViewCategorais extends StatelessWidget { 
  const ViewCategorais({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSignUp("View Categorais"),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return;
              },
            ),
          ),
        ],
      ),
    );
  }
}


