import 'dart:convert';
import 'package:shop/src/models/cart.dart';
import 'package:shop/src/services/cart/cart_service.dart';
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
  // navigateToProduct({required String productUrl}) {
  //   locator<NavigationService>().navigateTo(Routes.productInfoView,
  //       arguments: ProductInfoViewArguments(productUrl: productUrl));
  // }

  List<CartModel> productData = [];
  // List<Color> productColor = [];
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
      getCartData = CartModel.fromJson(response);
    }

    notifyListeners();
    isLoading = false;
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
  bool isTotalShowed = false;
  bool isLoading = false;
  bool noInternet = false;
  bool otherError = false;
}
