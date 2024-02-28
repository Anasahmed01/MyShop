
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../reusable_widgets/buttons/app_buttons.dart';
import '../../../reusable_widgets/text/text.dart';
import '../../../utils/style/color/app_colors.dart';

class WebToCartError {
  static Widget failedToLoadData({
    required BuildContext context,
    void Function()? onBackTap,
    void Function()? onTryAgain,
  }) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColors.whiteColor,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          elevation: 0.0,
          leading: InkWell(
            onTap: onBackTap,
            child: const Icon(Icons.arrow_back_ios_rounded),
          ),
          // actions: [],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: AppColors.whiteColor,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.exclamationmark_square_fill,
                  color: AppColors.primaryColor,
                  size: 50,
                ),
                Flexible(
                  child: CustomText.customSizedText(
                    text: 'Failed to load this product!',
                    color: Colors.red,
                    size: 18,
                    maxFontSize: 18,
                    minFontSize: 12,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: onTryAgain,
                  child: customButton(
                      text: 'Try Again!',
                      buttonColor: AppColors.primaryColor,
                      buttonHeight: 40,
                      buttonwidth: MediaQuery.sizeOf(context).width),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
