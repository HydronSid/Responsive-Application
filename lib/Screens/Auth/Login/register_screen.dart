import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_project/Screens/Auth/Login/register_controller.dart';
import 'package:responsive_project/Utils/app_colors.dart';
import 'package:responsive_project/Utils/app_constants.dart';
import 'package:responsive_project/Widgets/input_fields.dart';
import 'package:responsive_project/Widgets/responsive_widget.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final controller = Get.put(RegistrationController());

  int _currentIndex = 0;
  void callbackFunction(int index, CarouselPageChangedReason reason) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void dispose() {
    Get.delete<RegistrationController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                          items: controller.sliderList
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
                                fontSize: getResponsiveTextSize(context, 20)),
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
                              fontSize: getResponsiveTextSize(context, 16),
                              fontWeight: FontWeight.w500),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Already have an account?  ',
                            style: GoogleFonts.mukta(color: grayColor),
                            children: [
                              TextSpan(
                                text: 'Log in',
                                style: GoogleFonts.mukta(
                                    decoration: TextDecoration.underline,
                                    decorationColor: primaryColor,
                                    fontWeight: FontWeight.w500,
                                    color: primaryColor),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Handle the redirection logic here
                                  },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: LoginTextField(
                                controllerValue: controller.ctlFirstName.value,
                                hintText: 'First Name',
                                inputType: TextInputType.name,
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
                              width: 20,
                            ),
                            Expanded(
                              child: LoginTextField(
                                controllerValue: controller.ctlLastName.value,
                                hintText: 'Last Name',
                                inputType: TextInputType.name,
                                validate: (val) {
                                  if (val!.isEmpty) {
                                    return "Cant be Empty.";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
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
                          height: 15,
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
                          height: 15,
                        ),
                        InkWell(
                          onTap: () => controller.onChangeCheckBox(),
                          child: Row(
                            children: [
                              Obx(
                                () => Checkbox(
                                    value: controller.agreeTerms.value,
                                    onChanged: (val) =>
                                        controller.onChangeCheckBox()),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'I agree to the ',
                                  style: GoogleFonts.mukta(color: whiteColor),
                                  children: [
                                    TextSpan(
                                      text: 'Terms and Conditions',
                                      style: GoogleFonts.mukta(
                                          decoration: TextDecoration.underline,
                                          decorationColor: primaryColor,
                                          fontWeight: FontWeight.w500,
                                          color: primaryColor),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // Handle the redirection logic here
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
