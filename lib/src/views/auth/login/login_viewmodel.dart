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
import 'package:shop/src/views/navigation/navigaiton.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LogInViewModel extends BaseViewModel {
  TextEditingController emailController =
      TextEditingController(text: 'harry@gmail.com');
  TextEditingController passwordController =
      TextEditingController(text: '11111111');
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();
  final formKey = GlobalKey<FormState>();
  bool isTileSelected = false;
  bool obscureText = true;
  bool isChecked = false;
  bool visible = true;

  navigateToSignUpView() {
    locator<NavigationService>().navigateTo(Routes.signUp);
  }

  navigateToHome() {
    locator<NavigationService>().replaceWithTransition(
      NavigationView(index: 0),
      opaque: true,
      duration: const Duration(milliseconds: 300),
      transitionStyle: Transition.rightToLeftWithFade,
    );
  }

  void animateButton() async {
    Timer(const Duration(milliseconds: 300), () async {
      login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    });
  }

  final user = locator<UserService>();
  login({
    required String email,
    required String password,
  }) async {
    try {
      final data = await ApiClient.postRes(
          endPoint: AppStrings.login,
          body: {"email": email, "password": password});

      if (data['success'] == true) {
        //object have another object in it which have user's data
        final userData = jsonDecode(jsonEncode(data["data"]).toString());

        // saving user id and token in local storage
        LocalStorageServices.saveUser(
          userId: userData["user_id"].toString(),
          token: data["token"].toString(),
          userEmail: userData["user_email"].toString(),
        );

        await user.getUserDataById(
          id: userData['user_id'].toString(),
          token: data['token'].toString(),
        );

        NavSnackbarService.showSnackbar('', 'Login successful');

        navigateToHome();
      } else {
        NavSnackbarService.showSnackbar('Error', 'Invalid credentials');
      }
    } on SocketException {
      NavSnackbarService.showSnackbar(
          'Alert!', 'Please check your internet connection.');
    } catch (e) {
      print('YouRError>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$e');

      NavSnackbarService.showSnackbar('Alert!', 'Something went Wrong!');
    }
    btnController.reset();
  }
}
