import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_project/Utils/app_images.dart';

class HomeController extends GetxController {
  Rx<TextEditingController> ctlSearchController = TextEditingController().obs;

  var sliderList = [
    AppImages.homeSliderOne,
    AppImages.homeSliderTwo,
    AppImages.homeSliderThree
  ];

  @override
  void dispose() {
    ctlSearchController.value.dispose();
    super.dispose();
  }
}
