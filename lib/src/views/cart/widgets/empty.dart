import 'package:flutter/material.dart';

import '../../../reusable_widgets/text/text.dart';
import '../../../utils/style/color/app_colors.dart';

Widget emptyCart({
  required String upperText,
  required String lowerText,
  Widget? icon,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.all(10),
        child: icon ??
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.seconderyColor2,
                  width: 3,
                ),
                color: AppColors.primaryColor.withOpacity(0.8),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add_shopping_cart_rounded,
                size: 40,
                color: AppColors.seconderyColor2,
              ),
            ),
      ),
      Flexible(
        child: CustomText.customSizedText(
          text: upperText,
          color: AppColors.primaryColor,
          size: 22,
        ),
      ),
      Flexible(
        child: CustomText.customSizedText(
          text: lowerText,
          color: AppColors.seconderyColor2,
          size: 18,
        ),
      ),
    ],
  );
}
