import 'package:flutter/material.dart';
import '../../../../utils/style/color/app_colors.dart';
import '../../../../utils/style/images/images.dart';
import '../../cart_viewmodel.dart';
import 'cart_widgets.dart';

Widget rowButton({required CartViewModel viewModel}) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5, bottom: 10),
          child: CartWidgets.customYuGoWeGoButton(
            onPressed: () {},
            buttonHeight: 50,
            buttonWidth: 170,
            buttonColor: Colors.transparent,
            image: Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: Image.asset(
                AppImage.weGo,
                height: 35,
                width: 110,
              ),
            ),
            borderColor: AppColors.seconderyColor2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5, bottom: 10),
          child: CartWidgets.customYuGoWeGoButton(
            onPressed: () {},
            buttonHeight: 50,
            buttonWidth: 170,
            buttonColor: Colors.transparent,
            image: Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: Image.asset(
                AppImage.yuGo,
                height: 35,
                width: 110,
              ),
            ),
            borderColor: AppColors.greyColor,
          ),
        ),
      ],
    ),
  );
}
