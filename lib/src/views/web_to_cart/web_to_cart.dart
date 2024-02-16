// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:shop/src/views/web_to_cart/web_to_cart_viewmodel.dart';
import 'package:shop/src/views/web_to_cart/widget/product_info.dart';

class WebToCartView extends StatelessWidget {
  final String productUrl;
  const WebToCartView({
    Key? key,
    required this.productUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => WebToCartViewModel(),
      onViewModelReady: (viewModel) {
        viewModel.getProductData(productUrl: productUrl.toString());
      },
      builder: (context, viewModel, child) {
        return productData(context: context, model: viewModel.productDetail!);
      },
    );
  }
}
