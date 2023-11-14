import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../reusable_widgets/text/text.dart';
import '../../../utils/style/color/app_colors.dart';
import '../wallet_viewmodel.dart';

Widget previousTransactions() {
  return ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: 5,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText.customSizedText(
                  text: '#Id',
                  maxFontSize: 12,
                  size: 12,
                  maxLine: 1,
                  color: AppColors.primaryColor,
                ),
                CustomText.customSizedText(
                  text: "\$120TL",
                  maxFontSize: 12,
                  size: 12,
                  maxLine: 1,
                  color: AppColors.redColor,
                ),
                CustomText.customSizedText(
                  text: '2',
                  maxFontSize: 12,
                  size: 12,
                  maxLine: 1,
                  color: AppColors.blackColor,
                ),
                CustomText.customSizedText(
                  text: '02/11/2023',
                  maxFontSize: 12,
                  size: 12,
                  maxLine: 1,
                  color: AppColors.blackColor,
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

Widget transactionsHeading({required BuildContext context}) {
  return Column(
    children: [
      const Divider(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: CustomText.customSizedText(
              text: 'Order ID',
              maxFontSize: 12,
              minFontSize: 12,
              size: 12,
              maxLine: 1,
              color: AppColors.blackColor.withOpacity(0.7),
            ),
          ),
          Flexible(
            flex: 1,
            child: CustomText.customSizedText(
              text: "Total Bill",
              maxFontSize: 12,
              minFontSize: 12,
              size: 12,
              maxLine: 1,
              color: AppColors.blackColor.withOpacity(0.7),
            ),
          ),
          Flexible(
            flex: 1,
            child: CustomText.customSizedText(
              text: 'Items',
              maxFontSize: 12,
              size: 12,
              maxLine: 1,
              minFontSize: 12,
              color: AppColors.blackColor.withOpacity(0.7),
            ),
          ),
          Flexible(
            flex: 1,
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.18,
              child: CustomText.customSizedText(
                text: 'Date',
                maxFontSize: 12,
                minFontSize: 12,
                size: 12,
                maxLine: 1,
                color: AppColors.blackColor.withOpacity(0.7),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget previousTransaction() {
  return ViewModelBuilder.reactive(
    viewModelBuilder: () => WalletViewModel(),
    onViewModelReady: (viewModel) async {
      //  await viewModel.getTransactions();
    },
    builder: (context, viewModel, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Card(
          elevation: 10,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 30,
                  right: 30,
                  bottom: 5,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: CustomText.customSizedText(
                    text: 'Previous Transactions',
                    textAlign: TextAlign.center,
                    maxFontSize: 16,
                    size: 16,
                  ),
                ),
              ),
              transactionsHeading(context: context),
              const SizedBox(height: 20),
              previousTransactions(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      );
    },
  );
}
