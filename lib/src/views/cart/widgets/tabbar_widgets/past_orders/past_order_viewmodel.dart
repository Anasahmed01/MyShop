import 'dart:convert';
import 'package:stacked/stacked.dart';
import '../../../../../models/cart.dart';
import '../../../../../services/cart/cart_service.dart';

class PastOrderViewModel extends BaseViewModel {
  //Navigations
//   navigateToProduct({required String productUrl}) {
//     locator<NavigationService>().navigateTo(Routes.productInfoView,
//         arguments: ProductInfoViewArguments(productUrl: productUrl));
//   }

// //Past Orders
//   addToCart({required String currentUrl}) async {
//     locator<NavigationService>().clearStackAndShow(Routes.webToCart,
//         arguments: WebToCartArguments(lastUrl: currentUrl));
//   }

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

  bool isLoading = false;
  bool noInternet = false;
  bool otherError = false;
}
