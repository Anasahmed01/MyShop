import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../waiting/waiting.dart';
import 'widgets/cart_card.dart';
import 'cart_tab_viewmodel.dart';

class CartTab extends StatelessWidget {
  const CartTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CartTabViewModel(),
      onViewModelReady: (viewModel) async {
        await viewModel.getCart();
      },
      builder: (context, viewModel, child) {
        if (viewModel.isLoading == true) {
          return Waiting.waitingCart();
        }
        return Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.sizeOf(context).height * 0.05, top: 0),
              child: Container(
                color: Colors.white,
                height: double.infinity,
                width: double.infinity,
                child: cartCard(
                  viewModel: viewModel,
                ),
              ),
            ),
            Positioned(
              bottom: 5,
              child: Container(),
            ),
          ],
        );
      },
    );
  }
}
