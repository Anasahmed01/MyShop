// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../reusable_widgets/buttons/app_buttons.dart';
import '../../reusable_widgets/text/text.dart';
import '../../utils/style/color/app_colors.dart';
import '../../utils/style/images/images.dart';
import 'checkout_viewmodel.dart';

class PlacedOrder extends StatelessWidget {
  const PlacedOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => CheckOutViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: AppColors.primaryColor,
            title: Image.asset(
              AppImage.shopGoForShop,
              height: 27,
              width: 150,
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: SizedBox(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 40.0),
                        child: Image.asset(AppImage.placedOrder),
                      ),
                      CustomText.customSizedText(
                          text: 'Your order placed',
                          size: 20,
                          color: AppColors.blackColor),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: AutoSizeText(
                          'Your order has been placed successfully. You can visit',
                          style: TextStyle(
                              fontSize: 12, color: AppColors.blackColor),
                          maxLines: 3,
                          minFontSize: 12,
                          maxFontSize: 24,
                        ),
                      ),
                      AutoSizeText(
                        'my order to check the delivery process.',
                        style: TextStyle(
                            fontSize: 12, color: AppColors.blackColor),
                        maxLines: 3,
                        minFontSize: 12,
                        maxFontSize: 24,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  viewModel.navigateToHome();
                },
                child: customButton(
                    text: 'Continue Shopping',
                    buttonHeight: 46,
                    buttonwidth: 190,
                    buttonColor: AppColors.seconderyColor2,
                    textSize: 16),
              ),
            ],
          ),
        );
      },
    );
  }
}
