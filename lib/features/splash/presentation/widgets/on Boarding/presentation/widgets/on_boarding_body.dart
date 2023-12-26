import 'package:flutter/material.dart';
import 'package:fruitproject/core/utils/size_config.dart';
import 'package:fruitproject/core/widgets/custom_buttons.dart';
import 'package:fruitproject/features/Auth/login/widgets/login_view.dart';
import 'package:fruitproject/features/splash/presentation/widgets/on%20Boarding/presentation/widgets/custom_indicator.dart';
import 'package:fruitproject/features/splash/presentation/widgets/on%20Boarding/presentation/widgets/custom_page_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({Key? key}) : super(key: key);

  @override
  _OnBoardingViewBodyState createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  PageController? pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPageView(
          pageController: pageController,
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: SizeConfig.defaultSize! * 18,
          child: CustomIndicator(
            dotIndex: pageController!.hasClients ? pageController?.page : 0,
          ),
        ),
        Visibility(
          visible: pageController!.hasClients
              ? (pageController?.page == 2 ? false : true)
              : true,
          child: Positioned(
            top: SizeConfig.defaultSize! * 10,
            right: 32,
            child: Text(
              'Skip',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                color: const Color(0xff898989),
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Positioned(
          left: SizeConfig.defaultSize! * 10,
          right: SizeConfig.defaultSize! * 10,
          bottom: SizeConfig.defaultSize! * 10,
          child: InkWell(
            onTap: () {
              if (pageController!.page! < 2) {
                pageController?.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              } else {
                Get.to(() => LoginView(),
                    transition: Transition.rightToLeft,
                    duration: Duration(milliseconds: 500));
              }
            },
            child: CustomGeneralButton(
              text: pageController!.hasClients
                  ? (pageController?.page == 2 ? 'Get Started' : 'Next')
                  : 'Next',
            ),
          ),
        ),
      ],
    );
  }
}
