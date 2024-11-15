import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_project/Utils/app_colors.dart';
import 'package:responsive_project/Utils/app_images.dart';
import 'package:responsive_project/Widgets/responsive_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int _currentIndex = 0;
  void callbackFunction(int index, CarouselPageChangedReason reason) {
    setState(() {
      _currentIndex = index;
    });
  }

  var sliderList = [
    AppImages.sliderOne,
    AppImages.sliderTwo,
    AppImages.sliderThree
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF645f75),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: const Color(0xFF2b263a),
              borderRadius: BorderRadius.circular(17)),
          child: Row(
            children: [
              if (!ResponsiveWidget.isMobile(context))
                Expanded(
                    flex: 2,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            height: double.infinity,
                            viewportFraction: 1,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 5),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 1500),
                            autoPlayCurve: Curves.ease,
                            enlargeCenterPage: false,
                            onPageChanged: callbackFunction,
                            scrollDirection: Axis.horizontal,
                          ),
                          items: sliderList
                              .map((i) => SingleOfferBanner(
                                    image: i,
                                  ))
                              .toList(),
                        ),
                        Positioned(
                          top: 20,
                          left: 30,
                          child: Text(
                            "Mountain",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.cinzel(
                                letterSpacing: 4,
                                color: whiteColor,
                                fontSize: 25),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          right: 30,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: whiteColor),
                            child: Row(
                              children: [
                                Text(
                                  "Back to website",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.cinzel(
                                      color: blackColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                const Icon(
                                  Icons.chevron_right_rounded,
                                  color: blackColor,
                                )
                              ],
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Positioned(
                          bottom: 15,
                          child: Column(
                            children: [
                              Text(
                                _currentIndex == 0
                                    ? "The Sky Meets\nthe Earth"
                                    : _currentIndex == 1
                                        ? "At the Foot of\nthe Mountain"
                                        : "Into the Wilderness",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.aDLaMDisplay(
                                    color: whiteColor, fontSize: 25),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              DotsIndicator(
                                dotsCount: 3,
                                key: UniqueKey(),
                                decorator: DotsDecorator(
                                  activeColor: whiteColor,
                                  color: Colors.white,
                                  activeSize: const Size(25.0, 8.0),
                                  size: const Size(5.0, 5.0),
                                  activeShape: RoundedRectangleBorder(
                                      side: const BorderSide(color: whiteColor),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: Colors.black54),
                                      borderRadius: BorderRadius.circular(5.0)),
                                ),
                                position: _currentIndex,
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Create an account",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.cinzel(
                              color: whiteColor,
                              fontSize: size.width * 0.02,
                              fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            Text(
                              "Already have an account?",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.cinzel(
                                  color: whiteColor,
                                  fontSize: size.width * 0.3,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Log in",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.cinzel(
                                  color: whiteColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class SingleOfferBanner extends StatelessWidget {
  final String image;
  const SingleOfferBanner({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
