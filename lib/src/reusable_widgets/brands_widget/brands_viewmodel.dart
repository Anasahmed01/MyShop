import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:shop/src/models/brands.dart';
import 'package:shop/src/services/brand/brand.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../app/app.router.dart';

class AllBrandsViewModel extends BaseViewModel {
  SwiperController controller = SwiperController();

  bool noInternet = false;
  bool otherError = false;

  int selectedCategory = 0;

  navigateToWebView({required int index}) {
    locator<NavigationService>().navigateTo(
      Routes.webViewr,
    );
  }

  final brandService = locator<BrandsService>();
  List<AllBrandsModel> category = [];

  List<Response> selection = [];
  getBrandsByCat() {
    selection = [];
    if (brandService.brands.isNotEmpty) {
      for (var items in brandService.brands) {
        if (items.siteExistCategories
            .contains(brandService.category!.categoryNames[selectedCategory])) {
          selection.add(Response.fromJson(items.toJson()));
          print('Your Error>>>>>>>>>>>>>>>>$selection');
          print('Your Error>>>>>>>>>>>>>>>>$category');
        }
      }
    }
  }

  getBrands() async {
    try {
      isLoading = true;
      notifyListeners();
      final res = await brandService.getBrandsByCategory();
      //print('Your Error>>>>>>>Res>>>>>>>>>$res');
      if (res == 'No Internet') {
        noInternet = true;
        otherError = false;
        isLoading = false;
        notifyListeners();
        return;
      }

      if (res == 'Somthing went wrong!') {
        otherError = true;
        noInternet = false;
        isLoading = false;
        notifyListeners();
        return;
      }

      if (res == false) {
        otherError = false;
        noInternet = false;
        isLoading = false;
        notifyListeners();
        return;
      }

      if (res == true) {
        otherError = false;
        noInternet = false;
        isLoading = false;
        notifyListeners();
        return;
      }
      isLoading = false;
      notifyListeners();
      return;
    } catch (e) {
      debugPrint('Debug>>>>>>>>>>>>>>>>>>>>>>>$e');
      otherError = true;
      noInternet = false;
      isLoading = false;
      notifyListeners();
      return;
    }
  }

  List<String> allBrandsImages = [];
  List<String> brandsUrls = [];
  List<String> brandsname = [];
  bool isLoading = false;

  // final getBrandImg = [
  //   AppImage.brandPuma,
  //   AppImage.brandAmazon,
  //   AppImage.brandCk,
  //   AppImage.brandGucci,
  //   AppImage.brandLacoste,
  //   AppImage.brandLevis,
  //   AppImage.brandPuma,
  //   AppImage.brandAmazon,
  //   AppImage.brandCk,
  //   AppImage.brandGucci,
  //   AppImage.brandLacoste,
  //   AppImage.brandLevis
  // ];
}
