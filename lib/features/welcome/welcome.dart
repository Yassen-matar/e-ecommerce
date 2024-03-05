import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/features/welcome/bloc/welcome_bloc.dart';
import 'package:untitled/features/welcome/bloc/welcome_event.dart';
import 'package:untitled/features/welcome/bloc/welcome_state.dart';
import 'package:untitled/features/welcome/model/local_info/list_custom_page.dart';
import 'package:untitled/features/welcome/widget/column_page_viwe.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(initialPage: 0);
    return Scaffold(
      body: SafeArea(
          child: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) => Stack(
          alignment: Alignment.topCenter,
          children: [
            PageView.builder(
              itemCount: infoPageBuilder.length,
              itemBuilder: (context, index) {
                return ColumnPageViwe(
                  index: index,
                  controller: pageController,
                  textTitle: infoPageBuilder[index].textTitle,
                  subTitle: infoPageBuilder[index].subTitle,
                  buttonText: infoPageBuilder[index].buttonText,
                  pathImage: infoPageBuilder[index].pathImage,
                );
              },
              controller: pageController,
              onPageChanged: (value) {
                state.page = value;
                BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
              },
            ),
            Positioned(
                bottom: 100.h,
                child: DotsIndicator(
                  position: state.page,
                  mainAxisAlignment: MainAxisAlignment.center,
                  dotsCount: 3,
                  decorator: const DotsDecorator(
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      activeSize: Size(20, 8)),
                ))
          ],
        ),
      )),
    );
  }
}
