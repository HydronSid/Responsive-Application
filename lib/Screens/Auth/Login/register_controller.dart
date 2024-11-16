import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_project/Utils/app_images.dart';

class RegistrationController extends GetxController {
  Rx<TextEditingController> ctlFirstName = TextEditingController().obs;
  Rx<TextEditingController> ctlLastName = TextEditingController().obs;
  Rx<TextEditingController> ctlEmail = TextEditingController().obs;
  Rx<TextEditingController> ctlPassword = TextEditingController().obs;

  var sliderList = [
    AppImages.sliderOne,
    AppImages.sliderTwo,
    AppImages.sliderThree
  ];

  RxBool showHidePass = true.obs;
  onChangeShowHidePass() => showHidePass.value = !showHidePass.value;

  RxBool agreeTerms = false.obs;
  onChangeCheckBox() => agreeTerms.value = !agreeTerms.value;

  @override
  void dispose() {
    ctlFirstName.value.dispose();
    ctlLastName.value.dispose();
    ctlEmail.value.dispose();
    ctlPassword.value.dispose();
    super.dispose();
  }
}
