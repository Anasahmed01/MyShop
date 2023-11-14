// ignore_for_file: empty_catches

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shop/src/app/app.locator.dart';
import 'package:shop/src/app/app.router.dart';
import 'package:shop/src/network/api_client.dart';
import 'package:shop/src/services/snackbar_service/snackbar_service.dart';
import 'package:shop/src/services/storage/storage.dart';
import 'package:shop/src/services/user_services/user_service.dart';
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

  navigateToPattrenView() {
    locator<NavigationService>().navigateTo(Routes.home);
  }

  navigateToLogInView() {
    locator<NavigationService>().navigateTo(Routes.logIn);
  }

  void animateButton() async {
    Timer(const Duration(milliseconds: 300), () async {
      signUp(
        name: usernameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        confirmPassword: confirmPasswordController.text.trim(),
        phone: phoneController.text.trim(),
      );
    });
  }

  final userServ = locator<UserService>();

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
      //print("Data>>>>>>>>>>>$data");
      //object have another object in it which have user's data
      if (data["status_code"] == 200) {
        final userData = await jsonDecode(
          jsonEncode(data["ShopGo_APP"][0]).toString(),
        );
        // saving user id and token in local storage
        final user = await jsonDecode(
          jsonEncode(userData["user"]).toString(),
        );

        LocalStorageServices.saveUser(
          userId: user["id"].toString(),
          token: userData["token"].toString(),
          userEmail: user["email"].toString(),
        );
        await userServ.getUserDataById(
            id: user["id"].toString(), token: userData["token"].toString());

        NavSnackbarService.showSnackbar('', 'Account created successful!');
        navigateToPattrenView();
      } else {
        if (data["name"] != null) {
          nameError = data["name"][0];
        } else {
          nameError = '';
        }
        if (data["email"] != null) {
          emailError = data["email"][0];
        } else {
          emailError = '';
        }
        if (data["phone"] != null) {
          phoneError = data["phone"][0];
        } else {
          phoneError = '';
        }
        if (data["password"] != null) {
          passwordError = "password does't match";
        } else {
          passwordError = '';
        }
        notifyListeners();
      }
    } on SocketException {
      NavSnackbarService.showSnackbar(
          'Alert!', 'Please check your internet connection.');
    } catch (e) {
      NavSnackbarService.showSnackbar('Alert!', 'Something went wrong!');
    }
    btnController.reset();
  }
}
