import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'order_history_viewmodel.dart';
import 'widget/transaction.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => OrderHistoryViewModel(),
      builder: (context, viewModel, child) {
        return previousTransactions(model: viewModel.orderHistory!);
      },
    );
  }
}
