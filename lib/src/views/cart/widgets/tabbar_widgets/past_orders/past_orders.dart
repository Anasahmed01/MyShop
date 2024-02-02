import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:stacked/stacked.dart';
import '../../waiting/waiting.dart';
import 'past_order_viewmodel.dart';
import 'widget/card.dart';

class PastOrderTab extends StatelessWidget {
  const PastOrderTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => PastOrderViewModel(),
      onViewModelReady: (viewModel) async {
        await viewModel.getCart();
      },
      builder: (context, viewModel, child) {
        if (viewModel.isLoading == true) {
          return Waiting.waitingPastOrder();
        }
        return Container(
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: AnimationLimiter(
            child: Column(children: [
              Expanded(
                child: pastOrderCard(viewModel: viewModel),
              ),
            ]),
          ),
        );
      },
    );
  }
}
