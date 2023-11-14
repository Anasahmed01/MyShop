import 'package:flutter/material.dart';
import '../../../../../../reusable_widgets/buttons/app_buttons.dart';
import '../../../../../../reusable_widgets/text/text.dart';
import '../../../../../../utils/style/color/app_colors.dart';
import '../../../../../../utils/style/container/dec_container.dart';
import '../cart_tab_viewmodel.dart';

Widget checkOut({
  //required CartModel model,
  required int yuGoWeGo,
  required CartTabViewModel viewModel,
  required BuildContext context,
}) {
  // double yuGoShipping = double.parse(model.data.yugoShippingPrice);
  // double weGoShipping = double.parse(model.data.wegoShippingPrice);
  // double yuGoTotal = double.parse(model.data.yugoTotalPrice);
  // double weGoTotal = double.parse(model.data.wegoTotalPrice);

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        checkOutDetail(
          context: context,
          totalPrice: 12,
          shippingTotal: 12,
        ),
        shadowedBox(
          borderRadius: BorderRadius.circular(30),
          backgroundColor: viewModel.isTotalShowed
              ? AppColors.primaryColor
              : AppColors.whiteColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: customButton(
                    text: 'Check out',
                    buttonHeight: 46,
                    buttonwidth: MediaQuery.sizeOf(context).width * 0.45,
                    buttonColor: AppColors.seconderyColor2,
                    textSize: 16),
              ),
              const SizedBox(width: 5),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomText.customSizedText(
                        text: 'Total Price : ',
                        size: 12,
                        color: viewModel.isTotalShowed
                            ? AppColors.whiteColor
                            : AppColors.blackColor),
                    Flexible(
                      child: CustomText.customSizedText(
                        text: '120\$',
                        minFontSize: 12,
                        maxFontSize: 25,
                        size: 18,
                        color: viewModel.isTotalShowed
                            ? AppColors.seconderyColor2
                            : AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 4),
                        child: InkWell(
                          onTap: () {
                            viewModel.rebuildUi();
                            viewModel.isTotalShowed = !viewModel.isTotalShowed;
                          },
                          child: Icon(
                            viewModel.isTotalShowed
                                ? Icons.keyboard_arrow_up_outlined
                                : Icons.keyboard_arrow_down_outlined,
                            color: viewModel.isTotalShowed
                                ? AppColors.seconderyColor2
                                : AppColors.primaryColor,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget checkOutDetail(
    {required BuildContext context,
    required double totalPrice,
    required double shippingTotal}) {
  double finalPrice = totalPrice + shippingTotal;
  return Card(
    elevation: 10,
    child: SizedBox(
      height: 100, //set this to 160 if uncomment the lines below
      width: MediaQuery.of(context).size.width * 0.9,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText.customSizedText(
                    text: 'Total Price',
                    size: 14,
                    color: AppColors.primaryColor),
                CustomText.customSizedText(
                    text: '${finalPrice.toStringAsFixed(1)} TL',
                    size: 14,
                    color: AppColors.blackColor),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     CustomText.customSizedText(
            //         text: 'Service Fee', size: 14, color: AppColors.greyColor),
            //     CustomText.customSizedText(
            //         text: '0.0 TL', size: 14, color: AppColors.blackColor),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     CustomText.customSizedText(
            //         text: 'Consolidation & Quality Control',
            //         size: 14,
            //         color: AppColors.greyColor),
            //     CustomText.customSizedText(
            //         text: '0.0 TL', size: 14, color: AppColors.blackColor),
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText.customSizedText(
                    text: 'Shipping Fee', size: 14, color: AppColors.greyColor),
                CustomText.customSizedText(
                    text: '${shippingTotal.toStringAsFixed(1)} TL',
                    size: 14,
                    color: AppColors.blackColor),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     CustomText.customSizedText(
            //       text: 'YUGO Products Price',
            //       size: 14,
            //       color: AppColors.primaryColor,
            //     ),
            //     CustomText.customSizedText(
            //         text: '0.0 TL', size: 14, color: AppColors.blackColor),
            //   ],
            // ),
          ],
        ),
      ),
    ),
  );
}
