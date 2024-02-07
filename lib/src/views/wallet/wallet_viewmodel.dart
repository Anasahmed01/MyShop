// ignore_for_file: avoid_print

import 'package:shop/src/services/wallet_history/wallet_history.dart';
import 'package:stacked/stacked.dart';
import '../../app/app.locator.dart';
import '../../models/user.dart';
import '../../models/wallet_transaction.dart';
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
    return await users.getUserData();
  }

  WalletTransactionModel? walletTransaction;
  double totalPrice = 0;

  final walletService = locator<WalletService>();

  getTransactions() async {
    isLoading = true;
    notifyListeners();

    if (walletService.wallet != null) {
      walletTransaction = walletService.wallet;
    }

    if (walletService.getWallet() != null) {
      walletTransaction = walletService.wallet;
    }
  }
}
