import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:movie_app_ui/components/masked_image.dart';
import 'package:movie_app_ui/models/movie.dart';

import '../components/search_field_component.dart';
import '../constants.dart';
import 'movie_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      extendBody: true,
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: [
            Positioned(
              left: -100,
              top: -100,
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
            Positioned(
              right: -88,
              top: screenHeight * .4,
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
              left: -100,
              bottom: -100,
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
                bottom: false,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  primary: true,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      'What would you\n like to watch?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                          color: Constants.kWhiteColor.withOpacity(.8)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SearchFieldComponent(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 37, top: 37),
                      child: Text(
                        'Popular Movies',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Constants.kWhiteColor),
                      ),
                    ),
                    SizedBox(
                      height: 167,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          String mask;
                          index == 0
                              ? mask = Constants.kMaskFirstIndex
                              : index == newMovies.length - 1
                                  ? mask = Constants.kMaskLastIndex
                                  : mask = Constants.kMaskCenter;
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MovieDetailScreen()));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 20),
                              height: 167,
                              width: 142,
                              child: MaskedImage(
                                  asset: newMovies[index].moviePoster,
                                  mask: mask),
                            ),
                          );
                        },
                        itemCount: newMovies.length,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 37, top: 37),
                      child: Text(
                        'Upcoming Movies',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Constants.kWhiteColor),
                      ),
                    ),
                    SizedBox(
                      height: 167,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          String mask;
                          index == 0
                              ? mask = Constants.kMaskFirstIndex
                              : index == upcomingMovies.length - 1
                                  ? mask = Constants.kMaskLastIndex
                                  : mask = Constants.kMaskCenter;
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MovieDetailScreen()));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 20),
                              height: 167,
                              width: 142,
                              child: MaskedImage(
                                  asset: upcomingMovies[index].moviePoster,
                                  mask: mask),
                            ),
                          );
                        },
                        itemCount: upcomingMovies.length,
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 64,
        width: 64,
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Constants.kPinkColor.withOpacity(0.2),
              Constants.kGreenColor.withOpacity(0.2)
            ],
          ),
        ),
        child: Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Constants.kPinkColor,
                Constants.kGreenColor,
              ],
            ),
          ),
          child: RawMaterialButton(
            onPressed: () {},
            shape: const CircleBorder(),
            fillColor: const Color(0xff404c57),
            child: SvgPicture.asset(Constants.kIconPlus),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: GlassmorphicContainer(
          width: screenWidth,
          height: 70,
          borderRadius: 0,
          linearGradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Constants.kWhiteColor.withOpacity(0.1),
              Constants.kWhiteColor.withOpacity(0.1),
            ],
          ),
          border: 0,
          blur: 30,
          borderGradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Constants.kPinkColor,
              Constants.kGreenColor,
            ],
          ),
          child: BottomAppBar(
            color: Colors.transparent,
            notchMargin: 4,
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      Constants.kIconHome,
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      Constants.kIconPlayOnTv,
                    ),
                  ),
                ),
                const Expanded(
                  child: Text(''),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      Constants.kIconCategories,
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      Constants.kIconDownload,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
