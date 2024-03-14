import 'package:flutter/cupertino.dart';
import 'package:shop/src/network/api_client.dart';
import 'package:shop/src/services/snackbar_service/snackbar_service.dart';
import 'package:shop/src/services/storage/storage.dart';
import 'package:shop/src/utils/app_constraints/app_strings.dart';

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

      return res;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static addToCart({
    required String url,
    required String size,
    required String module,
  }) async {
    try {
      String? id = LocalStorageServices.getUserId();
      var res = await ApiClient.postRes(
          endPoint: AppStrings.addToCart + id!.toString(),
          body: {
            'product_url': url,
            'selected_size': size,
            'module': module,
          });

      if (res == 'Somthing went wrong!') {
        await ApiClient.postRes(
            endPoint: AppStrings.addToCart + id.toString(),
            body: {
              'product_url': url,
              'selected_size': size,
              'module': module,
            });
      }
      if (res['success'] == true) {
        NavSnackbarService.showSnackbar('', res['message'].toString());
      } else {
        NavSnackbarService.showSnackbar('', 'Try again later');
      }
    } catch (e) {
      NavSnackbarService.showSnackbar('', 'Try again, later!');
      debugPrint('>>>>>>XxX>>>>>>>>>>$e');
    }
  }
}
