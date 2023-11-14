import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';

class ShippingCalculatorViewModel extends BaseViewModel {
  String groupValue = 'Weight';

  navigateToback() {
    locator<NavigationService>().clearStackAndShow(Routes.navigationView,
        arguments: const NavigationViewArguments(index: 0));
  }

  num value = 0;
  int? totalPrice;

  increment() {
    rebuildUi();

    if (value < 20) {
      value++;
    }
    checkCondition();
  }

  decrement() {
    rebuildUi();
    if (value > 0) {
      value--;
      checkCondition();
    }
  }

  void checkCondition() {
    if (value == 0) {
      totalPrice = 0;
    }
    if (value == 1) {
      totalPrice = 18;
    } else if (value == 2) {
      totalPrice = 22;
    } else if (value == 3) {
      totalPrice = 30;
    } else if (value == 4) {
      totalPrice = 33;
    } else if (value == 5) {
      totalPrice = 39;
    } else if (value == 6) {
      totalPrice = 42;
    } else if (value == 7) {
      totalPrice = 47;
    } else if (value == 8) {
      totalPrice = 51;
    } else if (value == 9) {
      totalPrice = 56;
    } else if (value == 10) {
      totalPrice = 60;
    } else if (value == 11) {
      totalPrice = 64;
    } else if (value == 12) {
      totalPrice = 69;
    } else if (value == 13) {
      totalPrice = 73;
    } else if (value == 14) {
      totalPrice = 77;
    } else if (value == 15) {
      totalPrice = 83;
    } else if (value == 16) {
      totalPrice = 86;
    } else if (value == 17) {
      totalPrice = 91;
    } else if (value == 18) {
      totalPrice = 95;
    } else if (value == 19) {
      totalPrice = 100;
    } else if (value == 20) {
      totalPrice = 102;
    }
  }
}
