import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_project/Utils/app_images.dart';

class RegistrationController extends GetxController {
  GlobalKey<FormState> registerKey = GlobalKey();
  Rx<TextEditingController> ctlFirstName = TextEditingController().obs;
  Rx<TextEditingController> ctlLastName = TextEditingController().obs;
  Rx<TextEditingController> ctlEmail = TextEditingController().obs;
  Rx<TextEditingController> ctlPassword = TextEditingController().obs;

  var sliderList = [
    AppImages.sliderOne,
    AppImages.sliderTwo,
    AppImages.sliderThree
    // AppImages.sliderFour,
    // AppImages.sliderFive,
    // AppImages.sliderSix
  ];

  RxBool showHidePass = true.obs;
  onChangeShowHidePass() => showHidePass.value = !showHidePass.value;

  RxBool agreeTerms = false.obs;
  onChangeCheckBox() => agreeTerms.value = !agreeTerms.value;

  register() {
    final isValid = registerKey.currentState!.validate();

    if (!isValid) {
      return;
    }
  }

  @override
  void dispose() {
    ctlFirstName.value.dispose();
    ctlLastName.value.dispose();
    ctlEmail.value.dispose();
    ctlPassword.value.dispose();
    super.dispose();
  }
}
