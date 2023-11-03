import 'package:flutter/material.dart';
import 'package:shop/src/services/storage/storage.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../app/app.router.dart';
import '../../models/address.dart';
import '../../models/user.dart';
import '../../network/api_client.dart';
import '../../utils/app_constraints/app_strings.dart';

class UserService {
  String? userId = LocalStorageServices.getUserId();
  UserModel? userData;

  bool otherError = false;
  bool noInternet = false;

  getUserData() async {
    try {
      var response = await ApiClient.getRes(
        endpoint: AppStrings.user + userId!.toString(),
      );

      if (response == 'No Internet') {
        otherError = false;
        noInternet = true;
        return;
      }

      if (response == 'Somthing went wrong!') {
        noInternet = false;
        otherError = true;
        return;
      }

      noInternet = false;
      otherError = false;
      userData = UserModel.fromJson(response);
      return UserModel.fromJson(response);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  getUserDataById({required String id, required String token}) async {
    try {
      var response = await ApiClient.getRes(
        endpoint: AppStrings.user + id,
        header: {'Authorization': "Bearer $token"},
      );

      if (response == 'No Internet') {
        otherError = false;
        noInternet = true;
        return;
      }

      if (response == 'Somthing went wrong!') {
        noInternet = false;
        otherError = true;
        return;
      }

      noInternet = false;
      otherError = false;

      userData = UserModel.fromJson(response);
      return UserModel.fromJson(response);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> logout() async {
    LocalStorageServices.deleteUser();
    locator<NavigationService>().pushNamedAndRemoveUntil(Routes.logIn);
  }

  //User Address
  GetAddressModel? addressModel;
  getAddress() async {
    try {
      String? userId = LocalStorageServices.getUserId();
      var res =
          await ApiClient.getRes(endpoint: AppStrings.getAddress + userId!);

      if (res == 'No Internet') {
        noInternet = true;
        otherError = false;
        return;
      }
      if (res == 'Somthing went wrong!') {
        otherError = true;
        noInternet = false;
        return;
      }

      if (res['response'].isNotEmpty) {
        addressModel = GetAddressModel.fromJson(res);
        otherError = false;
        noInternet = false;
        return;
      }

      if (res['response'].isEmpty) {
        addressModel = null;
        otherError = false;
        noInternet = false;
        return;
      }
    } catch (e) {
      debugPrint(e.toString());
      addressModel = null;
      otherError = false;
      noInternet = false;
      return;
    }
  }
}
