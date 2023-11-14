import 'package:stacked/stacked.dart';

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

  bool isLoading = false;
  bool noInternet = false;
  bool otherError = false;
}
