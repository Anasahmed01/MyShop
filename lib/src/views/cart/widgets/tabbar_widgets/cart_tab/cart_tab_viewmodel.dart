import 'package:flutter/material.dart';
import 'package:shop/src/utils/style/color/app_colors.dart';
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

  List<String> productSize = ['S', 'M', 'L', 'XL', 'XXL'];
  List<Color> productColor = [
    AppColors.greenColor,
    AppColors.greyColor,
    AppColors.blackColor,
    AppColors.redColor,
    AppColors.yellowAccentColor,
  ];

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
