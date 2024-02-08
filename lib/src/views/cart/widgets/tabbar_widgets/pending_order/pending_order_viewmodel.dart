import 'dart:convert';
import 'package:shop/src/models/pending_order.dart';
import 'package:stacked/stacked.dart';
import '../../../../../network/api_client.dart';
import '../../../../../services/cart/cart_service.dart';
import '../../../../../utils/app_constraints/app_strings.dart';

class PendingOrderViewModel extends BaseViewModel {
  List<PendingOrdersModel> productData = [];
  // List<Color> productColor = [];
  List attribute = [];

  PendingOrdersModel? getCartData;

  getPendingOrders() async {
    isLoading = true;
    notifyListeners();

    var response = await CartService.getPendingCart();

    for (var item in response['response']) {
      var attributes = json.decode(json.encode(item['attributes']).toString());
      if (attributes['module'] == '0') {
        attribute.add(Response.fromJson(item));
      }
      getCartData = PendingOrdersModel.fromJson(response);
    }

    notifyListeners();
    isLoading = false;
  }

  
  bool isCartRemove = true;
  removeCart({required String productId}) async {
    isCartRemove = false;
    notifyListeners();

    //String? id = LocalStorageServices.getUserId();
    var response = await ApiClient.postRes(
        endPoint: AppStrings.removeCart + productId, body: {});

    if (response['response'] = true) {
      attribute.removeWhere((element) => element.id == productId);
      notifyListeners();
    }
    isCartRemove = true;
    notifyListeners();
  }


  bool isLoading = false;
  bool noInternet = false;
  bool otherError = false;
}
