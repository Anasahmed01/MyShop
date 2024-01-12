import 'package:shop/src/network/api_client.dart';
import 'package:shop/src/services/storage/storage.dart';
import 'package:shop/src/utils/app_constraints/app_strings.dart';

class CartService {
  static getCart() {
    String? id = LocalStorageServices.getUserId();

    var res = ApiClient.getRes(endpoint: AppStrings.getCart + id!.toString());
    //TODO:TO be continue,
  }
}
