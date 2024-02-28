import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../app/app.router.dart';
import '../../models/user.dart';
import '../../services/user_services/user_service.dart';
import '../brands/brands.dart';
import '../cart/cart.dart';
import '../home/home.dart';
import '../notification/notification.dart';
import '../wallet/wallet.dart';

class NavViewModel extends BaseViewModel {
  PageController controller = PageController();
  // int slectedIndex = 0;
  final navigationKey = GlobalKey();

  //DrawerFunctions

  logout() {
    UserService.logout();
  }

  final users = locator<UserService>();
  UserModel? currentUser;
  bool isLoading = false;

  getUser() async {
    isLoading = true;
    notifyListeners();
    currentUser = users.userData;
    isLoading = false;
    notifyListeners();
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        // slectedIndex = 0;
        return const Home();
      case 1:
        // slectedIndex = 1;
        return const BrandsView(
          navIndex: 1,
        );
      case 2:
        // slectedIndex = 2;
        return const CartView();
      case 3:
        // slectedIndex = 3;
        return const WalletView();
      case 4:
        // slectedIndex = 4;
        return const NotificationView();
      default:
        // slectedIndex = 0;
        return const Home();
    }
  }

  navigateToEditMyAccountView() {
    locator<NavigationService>().navigateTo(Routes.editMyAccountView);
  }

  // navigateToBrandedProductView() {
  //   locator<NavigationService>().navigateTo(Routes.yugoBannedProductsView);
  // }

  // navigateToLogInView() {
  //   UserService.logout();
  // }

  // navigateToTrackOrder() {
  //   locator<NavigationService>().navigateTo(Routes.trackOrderView);
  // }

  // navigateToPaymentMethodView() {
  //   locator<NavigationService>().navigateTo(Routes.paymentMethodView);
  // }

  // navigateToHomefavouriteView() {
  //   locator<NavigationService>().navigateTo(Routes.favouriteView);
  // }

  // navigateToMyAddressView() {
  //   locator<NavigationService>().navigateTo(Routes.myAddressView);
  // }

  // navigateToshippingCalculator() {
  //   locator<NavigationService>().navigateTo(Routes.shippingCalculatorView);
  // }

  navigateToCart() {
    locator<NavigationService>().pushNamedAndRemoveUntil(Routes.navigationView,
        arguments: const NavigationViewArguments(index: 2));
  }

  navigateToRateUsView() {
    locator<NavigationService>().navigateTo(Routes.rateUsView);
  }

  navigateToCustomerServiceView() {
    locator<NavigationService>().navigateTo(Routes.customerServiceView);
  }

  navigateToHowItsWorkView() {
    locator<NavigationService>().navigateTo(Routes.howItsWorkView);
  }

  // final screens = const [
  //   HomeView(),
  //   Categories(),
  //   CartView(),
  //   WalletView(),
  //   NotificationView(),
  // ];
}
