import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/style/color/app_colors.dart';
import '../text/text.dart';

class CustomError {
  static Widget noInternet({
    double? iconSize,
    double? size,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          CupertinoIcons.wifi_exclamationmark,
          color: AppColors.primaryColor,
          size: iconSize ?? 50,
        ),
        CustomText.customSizedText(
          text: 'Please connect to a stable network!',
          color: Colors.red,
          size: size ?? 18,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  static Widget otherError({
    double? iconSize,
    double? size,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          CupertinoIcons.exclamationmark_square_fill,
          color: AppColors.primaryColor,
          size: iconSize ?? 50,
        ),
        CustomText.customSizedText(
          text: 'Somthing went wrong!',
          color: Colors.red,
          size: size ?? 18,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
