// import 'dart:convert';

// import 'package:card_swiper/card_swiper.dart';
// import 'package:flutter/material.dart';
// import 'package:stacked/stacked.dart';
// import 'package:stacked_services/stacked_services.dart';
// import '../../app/app.locator.dart';
// import '../../app/app.router.dart';
// import '../../network/api_client.dart';
// import '../../utils/app_constraints/app_strings.dart';

// class AllBrandsViewModel extends BaseViewModel {
//   SwiperController controller = SwiperController();

//   bool noInternet = false;
//   bool otherError = false;

//   navigateToWebView({required int index}) {
//     locator<NavigationService>().navigateTo(Routes.webViewer,
//         arguments: WebViewerArguments(
//             url: brandsUrls[index], name: brandsname[index]));
//   }

//   List<String> allBrandsImages = [];
//   List<String> brandsUrls = [];
//   List<String> brandsname = [];
//   bool isLoading = false;

//   getBrands() async {
//     try {
//       isLoading = true;
//       notifyListeners();
//       final res = await ApiClient.getRes(endpoint: AppStrings.brands);
//       if (res == 'No Internet') {
//         noInternet = true;
//         otherError = false;
//         isLoading = false;
//         notifyListeners();
//         return;
//       }

//       if (res == 'Somthing went wrong!') {
//         otherError = true;
//         noInternet = false;
//         isLoading = false;
//         notifyListeners();
//         return;
//       }
//       var total = res['Response'];
//       if (total.isEmpty) {
//         brandsUrls = [];
//         otherError = false;
//         noInternet = false;
//         isLoading = false;
//         notifyListeners();
//         return;
//       }

//       if (total.isNotEmpty) {
//         for (var item in total) {
//           var img = jsonDecode(jsonEncode(item['site_image']).toString());
//           var url = jsonDecode(jsonEncode(item['url']).toString());
//           var name = jsonDecode(jsonEncode(item['slug']).toString());
//           allBrandsImages.add(img.toString());
//           brandsUrls.add(url.toString());
//           brandsname.add(name.toString());
//         }
//         otherError = false;
//         noInternet = false;
//         isLoading = false;
//         notifyListeners();
//         return;
//       }
//       isLoading = false;
//       notifyListeners();
//       return;
//     } catch (e) {
//       debugPrint(e.toString());
//       otherError = true;
//       noInternet = false;
//       isLoading = false;
//       notifyListeners();
//       return;
//     }
//   }
// }
