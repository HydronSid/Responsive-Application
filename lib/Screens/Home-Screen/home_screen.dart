import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_project/Screens/Home-Screen/home_controller.dart';
import 'package:responsive_project/Utils/app_colors.dart';
import 'package:responsive_project/Utils/app_constants.dart';
import 'package:responsive_project/Widgets/icon_text_widget.dart';
import 'package:responsive_project/Widgets/input_fields.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var controller = Get.put(HomeController());
  int _currentIndex = 0;
  void callbackFunction(int index, CarouselPageChangedReason reason) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void dispose() {
    Get.delete<HomeController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 15),
                    decoration: const BoxDecoration(color: accentColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              CupertinoIcons.phone,
                              color: whiteColor,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "+91 9929475920",
                              style: GoogleFonts.mukta(
                                  color: whiteColor,
                                  fontSize: getResponsiveTextSize(context, 11)),
                            )
                          ],
                        ),
                        const Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.facebook,
                              color: whiteColor,
                              size: 20,
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Icon(
                              FontAwesomeIcons.instagram,
                              color: whiteColor,
                              size: 20,
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Icon(
                              FontAwesomeIcons.twitter,
                              color: whiteColor,
                              size: 20,
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Icon(
                              FontAwesomeIcons.twitch,
                              color: whiteColor,
                              size: 20,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Book Store",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.cinzel(
                              letterSpacing: 4,
                              color: accentColor,
                              fontWeight: FontWeight.bold,
                              fontSize: getResponsiveTextSize(context, 18)),
                        ),
                        SizedBox(
                          width: Get.width * 0.5,
                          child: SearchTextField(
                            controller: controller.ctlSearchController.value,
                            hintText: 'Search book ...',
                            borderColor: Colors.grey,
                            focusedBorderColor: accentColor,
                            errorBorderColor: Colors.red,
                            fillColor: Colors.white,
                            onChanged: (value) {
                              // Handle change
                            },
                          ),
                        ),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              IconTextWidget(
                                icon: CupertinoIcons.person,
                                iconText: "Account",
                                onTap: () {},
                              ),
                              const VerticalDivider(
                                thickness: 1.5,
                              ),
                              IconTextWidget(
                                icon: CupertinoIcons.shopping_cart,
                                iconText: "Cart",
                                onTap: () {},
                              ),
                              const VerticalDivider(
                                thickness: 1.5,
                              ),
                              IconTextWidget(
                                icon: CupertinoIcons.heart,
                                iconText: "Wishlist",
                                onTap: () {},
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "HOME",
                          style: GoogleFonts.mukta(
                              color: accentColor,
                              fontWeight: FontWeight.bold,
                              fontSize: getResponsiveTextSize(context, 10),
                              letterSpacing: 2),
                        ),
                        const VerticalDivider(
                          thickness: 1.5,
                          width: 40,
                          color: accentColor,
                        ),
                        Text(
                          "ABOUT US",
                          style: GoogleFonts.mukta(
                              color: accentColor,
                              fontWeight: FontWeight.bold,
                              fontSize: getResponsiveTextSize(context, 10),
                              letterSpacing: 2),
                        ),
                        const VerticalDivider(
                          thickness: 1.5,
                          width: 40,
                          color: accentColor,
                        ),
                        Text(
                          "BOOKS",
                          style: GoogleFonts.mukta(
                              color: accentColor,
                              fontWeight: FontWeight.bold,
                              fontSize: getResponsiveTextSize(context, 10),
                              letterSpacing: 2),
                        ),
                        const VerticalDivider(
                          thickness: 1.5,
                          width: 40,
                          color: accentColor,
                        ),
                        Text(
                          "NEW RELEASE",
                          style: GoogleFonts.mukta(
                              color: accentColor,
                              fontWeight: FontWeight.bold,
                              fontSize: getResponsiveTextSize(context, 10),
                              letterSpacing: 2),
                        ),
                        const VerticalDivider(
                          thickness: 1.5,
                          width: 40,
                          color: accentColor,
                        ),
                        Text(
                          "CONTACT US",
                          style: GoogleFonts.mukta(
                              color: accentColor,
                              fontWeight: FontWeight.bold,
                              fontSize: getResponsiveTextSize(context, 10),
                              letterSpacing: 2),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // CarouselSlider(
                  //   options: CarouselOptions(
                  //     height: Get.height * 0.55,
                  //     viewportFraction: 1,
                  //     initialPage: 0,
                  //     enableInfiniteScroll: true,
                  //     reverse: false,
                  //     autoPlay: true,
                  //     autoPlayInterval: const Duration(seconds: 5),
                  //     autoPlayAnimationDuration:
                  //         const Duration(milliseconds: 1500),
                  //     autoPlayCurve: Curves.fastOutSlowIn,
                  //     enlargeCenterPage: false,
                  //     onPageChanged: callbackFunction,
                  //     scrollDirection: Axis.horizontal,
                  //   ),
                  //   items: controller.sliderList
                  //       .map((i) => HomeBanner(
                  //             image: i,
                  //           ))
                  //       .toList(),
                  // ),
                ],
              ))),
    );
  }
}

class HomeBanner extends StatelessWidget {
  final String image;
  const HomeBanner({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 3,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
