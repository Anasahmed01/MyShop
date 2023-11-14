// ignore_for_file: prefer_const_constructors

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';

class HowItsWorkViewModel extends BaseViewModel {
  navigateToNavigationView() {
    locator<NavigationService>().clearStackAndShow(Routes.navigationView,
        arguments: NavigationViewArguments(index: 0));
  }
}
