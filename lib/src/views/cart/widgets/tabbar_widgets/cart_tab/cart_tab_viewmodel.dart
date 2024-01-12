import 'package:shop/src/models/cart.dart';
import 'package:shop/src/network/api_client.dart';
import 'package:shop/src/utils/app_constraints/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../../app/app.locator.dart';
import '../../../../../app/app.router.dart';
import 'dart:developer' as dev;

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

  List<CartModel>? getCartData;

  getCart() async {
    isLoading = true;
    notifyListeners();
    var response = await ApiClient.getRes(endpoint: AppStrings.getCart);
    print('Res>>>>>>>>>>>>>>>>>>>>$response');
    dev.log('Res>>>>>>>>>>>>>>>>>>>>$response');
    for (var item in response) {
      productData.add(CartModel.fromJson(item));
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
