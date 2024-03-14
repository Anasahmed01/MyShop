// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:shop/src/models/product_detail.dart';
import 'package:shop/src/views/web_to_cart/web_to_cart_viewmodel.dart';
import 'package:shop/src/views/web_to_cart/widget/widget.dart';
import '../../../reusable_widgets/buttons/app_buttons.dart';
import '../../../utils/style/color/app_colors.dart';

Widget productData({
  required BuildContext context,
  required WebToCartViewModel viewModel,
  required ProductDetailModel productDetail,
}) {
  return Container(
    color: AppColors.greyColor,
    height: double.infinity,
    width: double.infinity,
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              WebToCartWidgets.productImage(
                  imageUrl: productDetail.response.productImagesArray,
                  context: context),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    WebToCartWidgets.namePrice(
                      name: productDetail.response.heading,
                      price:
                          '${productDetail.response.sizePriceListArray.isNotEmpty ? productDetail.response.sizePriceListArray[viewModel.currentSize] : productDetail.response.price} ${productDetail.response.currencySymbol}',
                    ),
                    WebToCartWidgets.sizeList(
                      sizeList: productDetail.response.sizesArray,
                      context: context,
                      viewModel: viewModel,
                    ),
                    WebToCartWidgets.colorList(
                      productUrl: productDetail.response.url,
                      colorUrlList: productDetail.response.colorUrl,
                      colorImageList: productDetail.response.colorImages,
                      context: context,
                      viewModel: viewModel,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: customAnimatedButton(
                          text: 'Add to cart',
                          controller: viewModel.addToCartController,
                          height: 40,
                          width: MediaQuery.sizeOf(context).width,
                          onPressed: () {
                            String productSize = '';
                            if (productDetail.response.sizesArray.isNotEmpty) {
                              productSize = productDetail
                                  .response.sizesArray[viewModel.currentSize];
                            }
                            viewModel.addToCart(
                                url: productDetail.response.url,
                                size: productSize,
                                module: '${viewModel.isSelected.toString()}');
                          }),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              )
            ],
          )),
    ),
  );
}
