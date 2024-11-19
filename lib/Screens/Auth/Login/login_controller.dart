import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_project/Utils/app_images.dart';
import 'package:responsive_project/Utils/route_names.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> loginKey = GlobalKey();
  Rx<TextEditingController> ctlEmail = TextEditingController().obs;
  Rx<TextEditingController> ctlPassword = TextEditingController().obs;

  var sliderList = [
    AppImages.sliderOne,
    AppImages.sliderTwo,
    AppImages.sliderThree
  ];

  RxBool showHidePass = true.obs;
  onChangeShowHidePass() => showHidePass.value = !showHidePass.value;

  login() {
    final isValid = loginKey.currentState!.validate();

    if (!isValid) {
      return;
    }

    Get.offAllNamed(RouteNames.homeScreen);
  }

  @override
  void dispose() {
    ctlEmail.value.dispose();
    ctlPassword.value.dispose();
    super.dispose();
  }
}
