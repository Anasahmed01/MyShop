import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';

class PaymentViewModel extends BaseViewModel {
  navigateToback() {
    locator<NavigationService>().clearStackAndShow(Routes.navigationView,
        arguments: const NavigationViewArguments(index: 0));
  }
}
