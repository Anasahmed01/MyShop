// // ignore_for_file: invalid_use_of_protected_member

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:stacked/stacked.dart';
// import 'package:stacked_services/stacked_services.dart';
// import '../../../../app/app.locator.dart';
// import '../../../../app/app.router.dart';
// import '../../../../services/user_services/user_service.dart';

// class MyAddressViewModel extends BaseViewModel {
//   final users = locator<UserService>();

//   TextEditingController findAddressController = TextEditingController();
//   TextEditingController titleController = TextEditingController();
//   TextEditingController provinceController = TextEditingController();
//   TextEditingController cityController = TextEditingController();
//   TextEditingController streetController = TextEditingController();

//   GlobalKey streetKey = GlobalKey();
//   GlobalKey titleKey = GlobalKey();
//   GlobalKey cityKey = GlobalKey();
//   GlobalKey provinceKey = GlobalKey();

//   navigateToAddAddressView() {
//     locator<NavigationService>().navigateTo(Routes.addAddressView);
//   }

//   navigateToback() {
//     locator<NavigationService>().back();
//   }

//   String titleError = '';
//   String provinceError = '';
//   String cityError = '';
//   String streetError = '';

//   clearFields() {
//     titleController.clear();
//     provinceController.clear();
//     cityController.clear();
//     streetController.clear();
//     titleError = '';
//     provinceError = '';
//     cityError = '';
//     streetError = '';
//   }

//   addAddress() async {
//     try {
//       String? userId = LocalStorageServices.getUserId();
//       var res = await ApiClient.postRes(
//         endpoint: AppStrings.addAddress + userId!,
//         body: {
//           'address_title': titleController.text.trim(),
//           'province': provinceController.text.trim(),
//           'city': cityController.text.trim(),
//           'street': streetController.text.trim(),
//         },
//       );
//       if (res['success'] == true) {
//         NavService.showSnackbar('', 'Address added successfully!');
//         clearFields();
//         await users.getAddress();
//         await getAddress();
//         locator<NavigationService>().popRepeated(1);
//       } else {
//         var response = json.decode(json.encode(res['errors']));

//         if (response['address_title'] != null) {
//           titleError = response['address_title'][0];
//         } else {
//           titleError = '';
//         }
//         if (response['province'] != null) {
//           provinceError = response['province'][0];
//         } else {
//           provinceError = '';
//         }
//         if (response['city'] != null) {
//           cityError = response['city'][0];
//         } else {
//           cityError = '';
//         }
//         if (response['street'] != null) {
//           streetError = response['street'][0];
//         } else {
//           streetError = '';
//         }
//       }
//       titleKey.currentState!.setState(() {});
//       provinceKey.currentState!.setState(() {});
//       cityKey.currentState!.setState(() {});
//       streetKey.currentState!.setState(() {});
//     } catch (e) {
//       NavService.showSnackbar('Alert', 'Try again later!');
//     }
//   }

//   bool isRemoving = true;
//   removeAddress({required String id}) async {
//     isRemoving = false;
//     notifyListeners();
//     try {
//       var res = await ApiClient.postRes(
//         endpoint: AppStrings.removeAddress + id,
//         body: {},
//       );
//       NavService.showSnackbar('', res['message'].toString());
//     } catch (e) {
//       NavService.showSnackbar('Alert', 'Try again later!');
//     }
//     await users.getAddress();
//     await getAddress();
//     isRemoving = true;
//     notifyListeners();
//   }

//   GetAddressModel? addressModel;
//   bool isLoading = false;
//   bool noInternet = false;
//   bool otherError = false;

//   getAddress() async {
//     isLoading = true;
//     notifyListeners();
//     if (users.noInternet == true) {
//       noInternet = true;
//       isLoading = false;
//       otherError = false;
//       notifyListeners();
//       return;
//     }
//     if (users.otherError == true) {
//       noInternet = false;
//       isLoading = false;
//       otherError = true;
//       notifyListeners();
//       return;
//     }
//     if (users.addressModel == null) {
//       await users.getAddress();
//       addressModel = users.addressModel;
//       noInternet = false;
//       isLoading = false;
//       otherError = false;
//       notifyListeners();
//       return;
//     }

//     if (users.addressModel != null) {
//       addressModel = users.addressModel;
//       noInternet = false;
//       isLoading = false;
//       otherError = false;
//       notifyListeners();
//       return;
//     }
//     isLoading = false;
//     notifyListeners();
//   }
// }
