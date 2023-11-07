import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';

class WelcomeViewModel extends BaseViewModel {
  navigateToNext() {
    locator<NavigationService>().clearStackAndShow(Routes.logIn);
  }
}
