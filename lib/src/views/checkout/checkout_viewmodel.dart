import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../app/app.router.dart';
import '../../services/user_services/user_service.dart';
import '../../utils/style/svg/svg.dart';

class CheckOutViewModel extends BaseViewModel {
  final users = locator<UserService>();

//Payment
  int selectedPayment = 0;
  paymentSelection({required int index}) {
    selectedPayment = index;
    notifyListeners();
  }

  List<String> paymentMethod = [
    AppSVG.visa,
    AppSVG.paypal,
    AppSVG.mastercard,
    AppSVG.shopGo,
    AppSVG.klarna,
  ];

  // navigateToAddress() {
  //   locator<NavigationService>().navigateTo(Routes.myAddressView);
  // }

  navigateToHome() {
    locator<NavigationService>().navigateTo(Routes.navigationView,
        arguments: const NavigationViewArguments(index: 0));
  }

//Address
  String selecteditem = '';
  int selectedIndex = 0;
  List<String> address = [];
  List<int> addressId = [];
}
