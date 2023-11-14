// ignore_for_file: avoid_print

import 'package:stacked/stacked.dart';
import '../../app/app.locator.dart';
import '../../models/user.dart';
import '../../services/user_services/user_service.dart';

class WalletViewModel extends BaseViewModel {
  final users = locator<UserService>();
  UserModel? currentUser;
  bool isLoading = false;

  Future getUser() async {
    isLoading = true;
    notifyListeners();
    currentUser = users.userData;
    isLoading = false;
    notifyListeners();
    // return await users.getUserData();
  }
}
