import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app_ui/components/custom_outline.dart';
import 'package:movie_app_ui/constants.dart';

import 'home_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: [
            Positioned(
              left: -88,
              top: screenHeight * .1,
              child: Container(
                height: 166,
                width: 166,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Constants.kPinkColor),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                  child: const SizedBox(
                    height: 166,
                    width: 166,
                  ),
                ),
              ),
            ),
            Positioned(
              right: -100,
              top: screenHeight * .3,
              child: Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Constants.kCyanColor),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                  child: const SizedBox(
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenHeight * .07,
                    ),
                    CustomOutline(
                      strokeWidth: 4,
                      radius: screenWidth * .8,
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Constants.kPinkColor,
                            Constants.kPinkColor.withOpacity(0),
                            Constants.kCyanColor.withOpacity(.1),
                            Constants.kCyanColor,
                          ],
                          stops: const [
                            .2,
                            .4,
                            .6,
                            1
                          ]),
                      width: screenWidth * .8,
                      height: screenWidth * .8,
                      padding: const EdgeInsets.all(4),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/img-onboarding.png'),
                              fit: BoxFit.cover,
                              alignment: Alignment.bottomLeft),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * .09,
                    ),
                    Text(
                      'Watch movies in\n Virtual Reality',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                          color: Constants.kWhiteColor.withOpacity(.8)),
                    ),
                    Text(
                      'Download and watch offline\n wherever you are ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Constants.kWhiteColor.withOpacity(.75)),
                    ),
                    SizedBox(
                      height: screenHeight * .07,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      },
                      child: CustomOutline(
                        strokeWidth: 3,
                        radius: 20,
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Constants.kPinkColor,
                            Constants.kCyanColor,
                          ],
                        ),
                        width: 160,
                        height: 38,
                        padding: const EdgeInsets.all(3),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Constants.kPinkColor.withOpacity(.5),
                                Constants.kCyanColor.withOpacity(.5),
                              ],
                            ),
                          ),
                          child: const Center(
                              child: Text(
                            'Sign up',
                            style: TextStyle(
                                color: Constants.kWhiteColor,
                                fontWeight: FontWeight.w400),
                          )),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 3; i++)
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 3, vertical: 20),
                            height: 7,
                            width: 7,
                            decoration: BoxDecoration(
                                color: i == 0
                                    ? Constants.kCyanColor
                                    : Constants.kGreyColor,
                                shape: BoxShape.circle),
                          )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
