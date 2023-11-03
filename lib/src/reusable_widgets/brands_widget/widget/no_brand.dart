import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/style/color/app_colors.dart';
import '../../../utils/style/images/images.dart';
import '../../text/text.dart';

Widget noBrands({
  required BuildContext context,
}) {
  return Container(
    height: MediaQuery.sizeOf(context).height * 0.5,
    width: MediaQuery.sizeOf(context).width,
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppImage.shopGo2),
        Flexible(
          child: CustomText.customSizedText(
            text: 'No Brands Found!',
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w500,
            maxLine: 1,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}
