// ignore_for_file: prefer_const_constructors

import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';

class RateUsViewModel extends BaseViewModel {
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();

  navigateToNavigationView() {
    locator<NavigationService>().clearStackAndShow(Routes.navigationView,
        arguments: NavigationViewArguments(index: 0));
  }

  double rating = 0;
}
