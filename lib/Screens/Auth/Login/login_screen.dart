import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_project/Screens/Auth/Login/login_controller.dart';
import 'package:responsive_project/Utils/app_colors.dart';
import 'package:responsive_project/Utils/app_constants.dart';
import 'package:responsive_project/Utils/route_names.dart';
import 'package:responsive_project/Widgets/app_button.dart';
import 'package:responsive_project/Widgets/input_fields.dart';
import 'package:responsive_project/Widgets/responsive_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.put(LoginController());

  int _currentIndex = 0;
  void callbackFunction(int index, CarouselPageChangedReason reason) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void dispose() {
    Get.delete<LoginController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: const Color(0xFF2b263a),
              borderRadius: BorderRadius.circular(17)),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            ResponsiveWidget.isMobile(context) ? 15 : 25),
                    child: Form(
                      key: controller.loginKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Login",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.cinzel(
                                color: whiteColor,
                                fontSize: getResponsiveTextSize(context, 16),
                                fontWeight: FontWeight.w500),
                          ),
                          RichText(
                            text: TextSpan(
                              text: "Don't have an account?  ",
                              style: GoogleFonts.mukta(
                                color: grayColor,
                                fontSize: getResponsiveTextSize(context, 11),
                              ),
                              children: [
                                TextSpan(
                                  text: 'Register',
                                  style: GoogleFonts.mukta(
                                      decoration: TextDecoration.underline,
                                      decorationColor: primaryColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                          getResponsiveTextSize(context, 11),
                                      color: primaryColor),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Get.offAllNamed(
                                        RouteNames.registrationScreen),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          LoginTextField(
                            controllerValue: controller.ctlEmail.value,
                            hintText: 'Email',
                            inputType: TextInputType.emailAddress,
                            validate: (val) {
                              if (val!.isEmpty) {
                                return "Cant be Empty.";
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Obx(
                            () => LoginTextField(
                              obsText: controller.showHidePass.value,
                              controllerValue: controller.ctlPassword.value,
                              hintText: 'Enter your password here...',
                              inputType: TextInputType.visiblePassword,
                              suf: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: InkWell(
                                    onTap: () =>
                                        controller.onChangeShowHidePass(),
                                    child: Icon(
                                      controller.showHidePass.value
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      size: 20,
                                      color: grayColor,
                                    )),
                              ),
                              validate: (val) {
                                if (val!.isEmpty) {
                                  return "Cant be Empty.";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          AppButton(
                            onPressed: () => controller.login(),
                            borderRadius: 8,
                            verticalPadding: 18,
                            backColor: accentColor,
                            child: Text(
                              "Login",
                              style: GoogleFonts.mukta(
                                  color: whiteColor,
                                  letterSpacing: 1,
                                  fontSize: getResponsiveTextSize(context, 10)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
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
                          items: controller.sliderList
                              .map((i) => SingleOfferBanner(
                                    image: i,
                                  ))
                              .toList(),
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
                                      fontSize:
                                          getResponsiveTextSize(context, 10),
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
                                    color: whiteColor,
                                    fontSize:
                                        getResponsiveTextSize(context, 20)),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              DotsIndicator(
                                dotsCount: 3,
                                key: UniqueKey(),
                                decorator: DotsDecorator(
                                  activeColor: whiteColor,
                                  color: primaryColor,
                                  activeSize: const Size(25.0, 8.0),
                                  size: const Size(5.0, 5.0),
                                  activeShape: RoundedRectangleBorder(
                                      side:
                                          const BorderSide(color: primaryColor),
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
