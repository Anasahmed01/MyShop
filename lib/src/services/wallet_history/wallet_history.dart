// ignore_for_file: avoid_print

import 'package:shop/src/models/wallet_transaction.dart';
import 'package:shop/src/network/api_client.dart';
import 'package:shop/src/services/storage/storage.dart';
import 'package:shop/src/utils/app_constraints/app_strings.dart';

import '../../models/order_history.dart';

class WalletService {
  double totalPrice = 0.0;
  OrderHistoryModel? orderHistory;

  getOrderHIstory() async {
    List<double> prices = [];

    String? id = LocalStorageServices.getUserId();

    var res = await ApiClient.getRes(
        endpoint: AppStrings.orderHistory + id.toString());

    if (res['success'] == true) {
      for (var item in res['total_bill']) {
        double price = double.parse(item['total_bill']);
        prices.add(price);
      }
      totalPrice = prices.fold(0, (previous, current) => previous + current);
      orderHistory = OrderHistoryModel.fromJson(res);
      return true;
    }
  }

  WalletTransactionModel? wallet;

  getWallet() async {
    try {
      String? userId = LocalStorageServices.getUserId();

      var response = await ApiClient.getRes(
          endpoint: AppStrings.walletTransactions + userId!);

      if (response['response'] == true) {
        wallet = WalletTransactionModel.fromJson(response);
      }

      return response;
    } catch (e) {
      print('Response<<X>>$e');
    }
  }
}
