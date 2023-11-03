// ignore_for_file: empty_catches

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shop/src/app/app.locator.dart';
import 'package:shop/src/app/app.router.dart';
import 'package:shop/src/auth/signup/signup.dart';
import 'package:shop/src/network/api_client.dart';
import 'package:shop/src/utils/app_constraints/app_strings.dart';
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
      signUp(
        name: usernameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        confirmPassword: confirmPasswordController.text.trim(),
        phone: phoneController.text.trim(),
      );
    });
  }

  signUp({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String confirmPassword,
  }) async {
    try {
      final data = await ApiClient.postRes(endPoint: AppStrings.signUp, body: {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": confirmPassword,
        "phone": phone
      });
      print("Data>>>>>>>>>>>$data");
      final res = await jsonDecode(
        jsonEncode(
          data["ShopGo_APP"][0].toString(),
        ),
      );

      if (res) {}
    } catch (e) {}
  }
}
