import 'package:flutter/material.dart';
import 'package:shop/src/models/product_detail.dart';
import 'package:shop/src/views/web_to_cart/widget/widget.dart';

Widget productData({
  required BuildContext context,
  required ProductDetailModel model,
}) {
  return Container(
    height: double.infinity,
    width: double.infinity,
    child: Scaffold(
      appBar: AppBar(),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              WebToCartWidgets.productImage(
                  imageUrl: model.response.productImagesArray, context: context)
            ],
          )),
    ),
  );
}
