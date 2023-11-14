// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import '../../../../../../utils/converter/color_converter.dart';
import '../../../../../../utils/style/color/app_colors.dart';
import '../../../inactive_widgets/cart_widgets.dart';
import '../cart_tab_viewmodel.dart';

Widget productQuantity({
  required CartTabViewModel viewModel,
  required int quantity,
  required String productId,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 10.0, top: 5),
    child: Container(
      height: 30,
      decoration: BoxDecoration(
        color: AppColors.lightGreyColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              viewModel.decrement();
            },
            iconSize: 15,
            icon: const Icon(Icons.remove),
          ),
          Text(
            '$quantity',
            style: const TextStyle(fontSize: 18),
          ),
          IconButton(
            onPressed: () {
              viewModel.increment();
            },
            iconSize: 15,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    ),
  );
}

Widget colorsList(
    {required List colorList,
    required BuildContext context,
    required CartTabViewModel viewModel}) {
  return Padding(
    padding: const EdgeInsets.only(
      top: 60.0,
    ),
    child: Material(
      borderRadius: BorderRadius.circular(30),
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(30),
        ),
        height: 130,
        width: 38,
        padding: const EdgeInsets.all(8),
        child: ListView.separated(
          itemCount: colorList.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            Color color = HexColor('#808080');
            return GestureDetector(
              onTap: () {},
              child: ColorPicker(viewModel.curruntColor == true, color),
            );
          },
          separatorBuilder: (_, index) => const SizedBox(height: 10),
        ),
      ),
    ),
  );
}
