import 'package:stacked/stacked.dart';

import '../../../../app/app.locator.dart';
import '../../../../models/order_history.dart';
import '../../../../models/user.dart';
import '../../../../services/wallet_history/wallet_history.dart';
import '../../../../services/user_services/user_service.dart';

class OrderHistoryViewModel extends BaseViewModel {
  final users = locator<UserService>();

  UserModel? currentUser;
  bool isLoading = false;

  Future getUser() async {
    isLoading = true;
    notifyListeners();
    currentUser = users.userData;
    isLoading = false;
    notifyListeners();
    return await users.getUserData();
  }

  //TODO: GET TOTAL PRICE NOT COMPLET

  OrderHistoryModel? orderHistory;
  double totalPrice = 0;

  final walletService = locator<WalletService>();
  getTransactions() async {
    if (walletService.orderHistory != null) {
      orderHistory = walletService.orderHistory;
      totalPrice = walletService.totalPrice;
      notifyListeners();
    }

    var transaction = await walletService.getOrderHIstory();

    if (transaction == true) {
      orderHistory = walletService.orderHistory;
      totalPrice = walletService.totalPrice;
      notifyListeners();
    }
  }
}
