import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:stacked/stacked.dart';
import '../../cart_viewmodel.dart';
import 'product_card.dart';

class PendingOrderTab extends StatelessWidget {
  const PendingOrderTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CartViewModel(),
      builder: (context, viewModel, child) {
        return Container(
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: AnimationLimiter(
            child: Column(children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return productCard();
                  },
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
