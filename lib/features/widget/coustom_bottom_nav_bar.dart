// ignore_for_file: avoid_returning_null_for_void, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/core/routing/extensions.dart';
import 'package:untitled/core/routing/routes.dart';

import '../../core/constant/app_color.dart';
import '../../core/constant/enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/Shop Icon.svg",
                    color: MenuState.home == selectedMenu
                        ? AppColor.kPrimaryColor
                        : inActiveIconColor,
                  ),
                  onPressed: () => null
                  //   Navigator.pushNamed(context, HomeScreen.routeName),
                  ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/Heart Icon.svg"),
                onPressed: () {},
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/Chat bubble Icon.svg"),
                onPressed: () {},
              ),
              IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/User Icon.svg",
                    color: MenuState.profile == selectedMenu
                        ? AppColor.kPrimaryColor
                        : inActiveIconColor,
                  ),
                  onPressed: () => null
                  //  Navigator.pushNamed(context, ProfileScreen.routeName),
                  ),
              IconButton(
                  icon: const Icon(
                    Icons.add_business_rounded,
                  ),
                  color: MenuState.categorias == selectedMenu
                      ? AppColor.kPrimaryColor
                      : inActiveIconColor,
                  onPressed: () {
                    MenuState.categorias;
                    context.pushNamed(AppRoute.categorias);
                  }),
            ],
          )),
    );
  }
}
