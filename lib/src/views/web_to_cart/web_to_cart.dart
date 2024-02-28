// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shop/src/views/web_to_cart/widget/error.dart';
import 'package:shop/src/views/web_to_cart/widget/waiting_product.dart';
import 'package:stacked/stacked.dart';

import 'package:shop/src/views/web_to_cart/web_to_cart_viewmodel.dart';
import 'package:shop/src/views/web_to_cart/widget/product_info.dart';

class WebToCartView extends StatelessWidget {
  final String productUrl;
  final String remover;
  final int index;
  const WebToCartView({
    Key? key,
    required this.productUrl,
    required this.remover,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => WebToCartViewModel(),
      onViewModelReady: (viewModel) {
        viewModel.getProductData(productUrl: productUrl.toString());
      },
      builder: (context, viewModel, child) {
        if (viewModel.isLoading == true) {
          return waitingProductData(context: context);
        }
        if (viewModel.foundEror == true) {
          return WebToCartError.failedToLoadData(context: context);
        }
        if (viewModel.productDetail == null) {}
        return productData(
          context: context,
          productDetail: viewModel.productDetail!,
          viewModel: viewModel,
        );
      },
    );
  }
}
