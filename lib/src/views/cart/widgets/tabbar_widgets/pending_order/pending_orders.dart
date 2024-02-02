import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shop/src/views/cart/widgets/tabbar_widgets/pending_order/pending_order_viewmodel.dart';
import 'package:stacked/stacked.dart';
import '../../waiting/waiting.dart';
import 'widget/card.dart';

class PendingOrderTab extends StatelessWidget {
  const PendingOrderTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => PendingOrderViewModel(),
      onViewModelReady: (viewModel) async {
        await viewModel.getPendingOrders();
      },
      builder: (context, viewModel, child) {
        if (viewModel.isLoading == true) {
          return Waiting.waitingCart();
        }
        return Container(
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: AnimationLimiter(
            child: pendingOrderCard(viewModel: viewModel),
          ),
        );
      },
    );
  }
}
//TODO: past order api
