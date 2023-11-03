import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shop/src/app/app.locator.dart';
import 'package:shop/src/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends BaseViewModel {
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();
  TextEditingController usernameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController confirmPasswordController =
      TextEditingController(text: '');
  bool obscureConfirmText = true;
  bool isChecked = false;
  bool visible = true;
  final formKey = GlobalKey<FormState>();
  String nameError = '';
  String emailError = '';
  String phoneError = '';
  String passwordError = '';

  navigateToNavView() {
    // locator<NavigationService>().navigateTo(Routes.navigationView);
  }

  navigateToLogInView() {
    locator<NavigationService>().navigateTo(Routes.logIn);
  }

  void animateButton() async {
    Timer(const Duration(milliseconds: 300), () async {
      btnController.reset();
      // signUp(
      //   name: usernameController.text.trim(),
      //   email: emailController.text.trim(),
      //   password: passwordController.text.trim(),
      //   confirmPassword: confirmPasswordController.text.trim(),
      //   phone: phoneController.text.trim(),
      // );
    });
  }
}