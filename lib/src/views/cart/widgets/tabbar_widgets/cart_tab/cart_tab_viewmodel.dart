import 'dart:convert';
import 'package:shop/src/models/cart.dart';
import 'package:shop/src/network/api_client.dart';
import 'package:shop/src/services/cart/cart_service.dart';
import 'package:shop/src/services/snackbar_service/snackbar_service.dart';
import 'package:shop/src/utils/app_constraints/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../../app/app.locator.dart';
import '../../../../../app/app.router.dart';

class CartTabViewModel extends BaseViewModel {
//Navigation
  navigateToCheckOutView({required double totalAmount, required int yuGoWeGo}) {
    locator<NavigationService>().navigateTo(Routes.checkOutView,
        arguments:
            CheckOutViewArguments(totalAmount: totalAmount, flag: yuGoWeGo));
  }

  List attribute = [];

  CartModel? getCartData;

  getCart() async {
    isLoading = true;
    notifyListeners();

    var response = await CartService.getCart();

    for (var item in response['response']) {
      var attributes = json.decode(json.encode(item['attributes']).toString());
      if (attributes['module'] == '0') {
        attribute.add(Response.fromJson(item));
      }
    }
    getCartData = CartModel.fromJson(response);
    notifyListeners();
    isLoading = false;
  }

  bool isCartRemove = true;
  removeCart({required String productId}) async {
    isCartRemove = false;
    notifyListeners();

    try {
      var response = await ApiClient.postRes(
          endPoint: AppStrings.removeCart + productId, body: {});

      if (response['success'] = true) {
        var res = json.decode(json.encode(response['response']).toString());

        getCartData!.data.serviceFee = res['service_fee'];
        getCartData!.data.shippingPrice = res['shipping_price'];
        getCartData!.data.yugoProductPrice = res['yugo_product_price'];
        getCartData!.data.totalPrice = res['total_price'];
        getCartData!.data.couponPrice = res['coupon_price'];

        attribute.removeWhere((element) => element.id == productId);
      }

      NavSnackbarService.showSnackbar('', 'Remove Cart SuccessFully');
    } catch (e) {
      NavSnackbarService.showSnackbar('', 'Try Again Later');
    }

    isCartRemove = true;
    notifyListeners();
  }

  increment() {
    var increment = 0;
    return increment++;
  }

  decrement() {
    var increment = 0;
    return increment--;
  }

  var curruntColor = 0;
  bool isUpdating = false;
  bool isTotalShowed = false;
  bool isLoading = false;
  bool noInternet = false;
  bool otherError = false;
}
