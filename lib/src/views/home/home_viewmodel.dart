import 'package:shop/src/services/user_services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:shop/src/app/app.locator.dart';

class HomeViewModel extends BaseViewModel {
  final user = locator<UserService>();
  deleteUser() {
    UserService.logout();
  }
}
