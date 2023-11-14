import 'package:flutter/material.dart';
import '../text/text.dart';
import '../../utils/style/color/app_colors.dart';

Widget sizeColorWidget({
  required String heading,
  required  content,
  required BuildContext context,
}) {
  return Visibility(
    visible: content != '0' && content != '',
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomText.customSizedText(
          text: heading,
          size: 12,
          color: AppColors.blackColor,
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80),
          ),
          elevation: 2,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomText.customSizedText(
              text: content,
              color: AppColors.greyColor,
              size: 12,
              minFontSize: 12,
              maxFontSize: 12,
              maxLine: 1,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    ),
  );
}
