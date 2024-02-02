import 'package:flutter/cupertino.dart';
import 'package:shop/src/network/api_client.dart';
import 'package:shop/src/services/storage/storage.dart';
import 'package:shop/src/utils/app_constraints/app_strings.dart';
import 'dart:developer' as dev;

class CartService {
  static getCart() async {
    try {
      String? id = LocalStorageServices.getUserId();

      var res = await ApiClient.getRes(endpoint: AppStrings.getCart + id!);

      return res;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static getPendingCart() async {
    try {
      String? id = LocalStorageServices.getUserId();

      var res =
          await ApiClient.getRes(endpoint: AppStrings.getPendingOrders + id!);

      return res;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static getPastOrder() async {
    try {
      String? id = LocalStorageServices.getUserId();

      var res = await ApiClient.getRes(endpoint: AppStrings.pastOrder + id!);

      //print('Res>>>>>>>>>>>>X>>>>>>>>>>>$res');
      return res;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
