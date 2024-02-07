import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../models/order_history.dart';
import '../../../../../reusable_widgets/text/text.dart';
import '../../../../../utils/date_time/date_time.dart';
import '../../../../../utils/style/color/app_colors.dart';
import '../order_history_viewmodel.dart';

Widget previousTransactions({
  required OrderHistoryModel model,
}) {
  if (model.response.isEmpty) {
    return Container(
      child: CustomText.customSizedText(
        text: 'No Record Found',
        color: AppColors.primaryColor,
      ),
    );
  } else {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (context, index) {
        DateTime date = model.response[index].date;
        String formatedDate = getFormattedDate(date);

        double price = double.parse(model.response[index].totalBill);
        return GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText.customSizedText(
                  text: '#${model.response[index].orderId}',
                  maxFontSize: 12,
                  size: 12,
                  maxLine: 1,
                  color: AppColors.primaryColor,
                ),
                CustomText.customSizedText(
                  text:
                      "${price.toStringAsFixed(2)} ${model.response[index].totalBill}",
                  maxFontSize: 12,
                  size: 12,
                  maxLine: 1,
                  color: AppColors.redColor,
                ),
                CustomText.customSizedText(
                  text: '${model.response[index].items}',
                  maxFontSize: 12,
                  size: 12,
                  maxLine: 1,
                  color: AppColors.blackColor,
                ),
                CustomText.customSizedText(
                  text: formatedDate,
                  maxFontSize: 12,
                  size: 12,
                  maxLine: 1,
                  color: AppColors.blackColor,
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Divider(),
        );
      },
    );
  }
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
      const Divider(),
    ],
  );
}

Widget previousOrders() {
  return ViewModelBuilder.reactive(
    viewModelBuilder: () => OrderHistoryViewModel(),
    onViewModelReady: (viewModel) async {
      await viewModel.getTransactions();
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
              // const SizedBox(height: 20),
              viewModel.orderHistory == null
                  ? Container(
                      child: CustomText.customSizedText(
                        text: 'No Record Found',
                        color: AppColors.primaryColor,
                      ),
                    )
                  : Flexible(
                      child: previousTransactions(
                        model: viewModel.orderHistory!,
                      ),
                    ),
              // const SizedBox(height: 20),
            ],
          ),
        ),
      );
    },
  );
}
