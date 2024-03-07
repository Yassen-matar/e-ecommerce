import 'package:flutter/material.dart';


import '../../core/constant/enums.dart';
import '../widget/coustom_bottom_nav_bar.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
      bottomNavigationBar:  CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
