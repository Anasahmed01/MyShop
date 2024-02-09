import 'package:flutter/material.dart';
import 'package:shop/src/models/cart.dart';
import '../../../../../../reusable_widgets/buttons/app_buttons.dart';
import '../../../../../../reusable_widgets/text/text.dart';
import '../../../../../../utils/style/color/app_colors.dart';
import '../../../../../../utils/style/container/dec_container.dart';
import '../cart_tab_viewmodel.dart';

Widget checkOut({
  required CartModel model,
  required CartTabViewModel viewModel,
  required BuildContext context,
}) {
  double totalPrice = double.parse(model.data.totalPrice);
  double serviceFee = double.parse(model.data.serviceFee);
  double couponPrice = double.parse(model.data.couponPrice);
  double shippingFee = double.parse(model.data.shippingPrice);
  String currencySymbol = model.data.currencySymbol;
  double yugoProductPrice = double.parse(model.data.yugoProductPrice);
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Visibility(
          visible: viewModel.isTotalShowed,
          child: checkOutDetail(
            currencySymbol: currencySymbol,
            yuGoPrice: yugoProductPrice,
            serviceFee: serviceFee,
            context: context,
            totalPrice: totalPrice,
            shippingFee: shippingFee,
          ),
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
                    Flexible(
                      flex: 2,
                      child: CustomText.customSizedText(
                          text: 'Total Price : ',
                          size: 12,
                          minFontSize: 12,
                          maxFontSize: 12,
                          color: viewModel.isTotalShowed
                              ? AppColors.whiteColor
                              : AppColors.blackColor),
                    ),
                    Flexible(
                      flex: 3,
                      child: CustomText.customSizedText(
                        text:
                            '${(totalPrice + shippingFee + serviceFee - couponPrice).toStringAsFixed(2)} ${model.data.currencySymbol}',
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

Widget checkOutDetail({
  required BuildContext context,
  required double totalPrice,
  required double shippingFee,
  required double serviceFee,
  required double yuGoPrice,
  required String currencySymbol,
}) {
  return Card(
    elevation: 10,
    child: SizedBox(
      height: 140, //set this to 160 if uncomment the lines below
      width: MediaQuery.of(context).size.width * 0.9,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            detailRow(
                heading: 'Produt Total',
                price:
                    '${(yuGoPrice + totalPrice).toStringAsFixed(2)} $currencySymbol'),
            detailRow(
                heading: 'Shipping Free',
                price: '${shippingFee.toStringAsFixed(2)} $currencySymbol'),
            detailRow(
                heading: 'Consolidation & Quality Control',
                price: '${0.0.toStringAsFixed(1)} $currencySymbol'),
            detailRow(
                heading: 'Service Fee',
                price: '${serviceFee.toStringAsFixed(2)} $currencySymbol'),
            detailRow(
                heading: 'YUGO Products Price',
                price: '${yuGoPrice.toStringAsFixed(2)} $currencySymbol'),
          ],
        ),
      ),
    ),
  );
}

Widget detailRow({
  required String heading,
  required String price,
  Color? priceColor,
  Color? headingColor,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Flexible(
        flex: 2,
        child: CustomText.customSizedText(
          text: heading,
          size: 14,
          minFontSize: 12,
          maxFontSize: 14,
          color: headingColor ?? AppColors.greyColor,
        ),
      ),
      Flexible(
        flex: 1,
        child: CustomText.customSizedText(
          text: price,
          size: 14,
          minFontSize: 12,
          maxFontSize: 14,
          color: priceColor ?? AppColors.blackColor,
        ),
      ),
    ],
  );
}
