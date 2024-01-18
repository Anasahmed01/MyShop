import 'package:flutter/cupertino.dart';
import 'package:shop/src/network/api_client.dart';
import 'package:shop/src/services/storage/storage.dart';
import 'package:shop/src/utils/app_constraints/app_strings.dart';

class CartService {
  static getCart() async {
    try {
      String? id = LocalStorageServices.getUserId();
      print('Id>>>>>>>>>>>$id');
      var res =
          await ApiClient.getRes(endpoint: AppStrings.getCart + id!.toString());

      return res;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
