import 'package:shop/src/models/past_order.dart';
import 'package:stacked/stacked.dart';
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

  // List<Color> productColor = [];
  List<Response> attribute = [];

  PastOrderModel? getCartData;

  getPastOrder() async {
    isLoading = true;
    notifyListeners();

    var response = await CartService.getPastOrder();
    for (var item in response['response']) {
      if (item['module'] == '0') {
        attribute.add(Response.fromJson(item));
      }
      getCartData = PastOrderModel.fromJson(response);
    }

    notifyListeners();
    isLoading = false;
  }

  bool isLoading = false;
  bool noInternet = false;
  bool otherError = false;
}
