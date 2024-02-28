// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shop/src/app/app.router.dart';
import 'package:shop/src/network/api_client.dart';
import 'package:shop/src/services/snackbar_service/snackbar_service.dart';
import 'package:shop/src/services/storage/storage.dart';
import 'package:shop/src/utils/app_constraints/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/app.locator.dart';
import '../../../../models/user.dart';
import '../../../../services/user_services/user_service.dart';

class EditMyAccountViewModel extends BaseViewModel {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();

  bool otherError = false;
  bool noInternet = false;
  bool isLoading = false;

  dynamic flag;
  String? phoneNumber;
  final users = locator<UserService>();
  UserModel? currentUser;

  bool obscureTextForOldPassword = true;
  bool obscureTextForNewPassword = true;
  bool obscureTextForConfirmPassword = true;

  uploadImageFromGallery() async {
    try {
      String? userId = LocalStorageServices.getUserId();
      String? token = LocalStorageServices.getToken();

      ImagePicker imagePicker = ImagePicker();
      XFile? galleryImage =
          await imagePicker.pickImage(source: ImageSource.gallery);
      File image = File(galleryImage!.path);

      if (galleryImage == null) {
        NavSnackbarService.showSnackbar('', 'Image is not selected!');
      }

      await ApiClient.postUserImg(
          endpoint: AppStrings.updateUserImage + userId!, profImage: image);
      currentUser =
          await users.getUserDataById(id: userId, token: token!.toString());
      NavSnackbarService.showSnackbar('', 'Image changed!');
      notifyListeners();
    } catch (e) {
      // devlog.log(e.toString(), name: 'Image selection');
      NavSnackbarService.showSnackbar('', 'Image is not selected!');
    }
  }

  getUserInfo() async {
    if (noInternet == true) {
      isLoading = false;
      noInternet = true;
      otherError = false;
      notifyListeners();
      return;
    }

    if (otherError == true) {
      isLoading = false;
      noInternet = false;
      otherError = true;
      notifyListeners();
      return;
    }
    if (users.userData == null) {
      await users.getUserData();
      currentUser = users.userData;
      isLoading = false;
      noInternet = false;
      otherError = false;
      notifyListeners();
      return;
    } else {
      currentUser = users.userData;
      isLoading = false;
      noInternet = false;
      otherError = false;
      notifyListeners();
      return;
    }
  }

  disposeContoller() {
    fullNameController.clear();
    dobController.clear();
    genderController.clear();
    countryController.clear();
  }

  void updateUserInfo() async {
    try {
      String? id = LocalStorageServices.getUserId();
      String? token = LocalStorageServices.getToken();

      await ApiClient.postRes(endPoint: AppStrings.updateProfile + id!, body: {
        'nickname': fullNameController.text.trim(),
        'country': countryController.text.trim(),
        'user_dob': dobController.text.trim(),
        'gender': genderController.text.trim(),
      });
      currentUser = await users.getUserDataById(id: id, token: token!);

      disposeContoller();
      notifyListeners();
    } catch (e) {
      print('EX>>>>>>>>>>X<<<<<<<<$e');
    }
    btnController.reset();
  }

  navigateToback() {
    locator<NavigationService>().navigateTo(Routes.navigationView,
        arguments: const NavigationViewArguments(
          index: 0,
        ));
  }

  String? selectedGender;
  dynamic selectedCountry;
  List<String> genderOptions = [
    "Male",
    "Female",
    "Other",
  ];
}
