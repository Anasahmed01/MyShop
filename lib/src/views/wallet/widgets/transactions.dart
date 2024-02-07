// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:shop/src/models/wallet_transaction.dart';
import 'package:shop/src/utils/date_time/date_time.dart';
import 'package:stacked/stacked.dart';
import '../../../reusable_widgets/text/text.dart';
import '../../../utils/style/color/app_colors.dart';
import '../wallet_viewmodel.dart';

// Widget transactionsHeading({required BuildContext context}) {
//   return Column(
//     children: [
//       const Divider(),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Flexible(
//             flex: 1,
//             child: CustomText.customSizedText(
//               text: 'Order ID',
//               maxFontSize: 12,
//               minFontSize: 12,
//               size: 12,
//               maxLine: 1,
//               color: AppColors.blackColor.withOpacity(0.7),
//             ),
//           ),
//           Flexible(
//             flex: 1,
//             child: CustomText.customSizedText(
//               text: "Total Bill",
//               maxFontSize: 12,
//               minFontSize: 12,
//               size: 12,
//               maxLine: 1,
//               color: AppColors.blackColor.withOpacity(0.7),
//             ),
//           ),
//           Flexible(
//             flex: 1,
//             child: CustomText.customSizedText(
//               text: 'Items',
//               maxFontSize: 12,
//               size: 12,
//               maxLine: 1,
//               minFontSize: 12,
//               color: AppColors.blackColor.withOpacity(0.7),
//             ),
//           ),
//           Flexible(
//             flex: 1,
//             child: SizedBox(
//               width: MediaQuery.sizeOf(context).width * 0.18,
//               child: CustomText.customSizedText(
//                 text: 'Date',
//                 maxFontSize: 12,
//                 minFontSize: 12,
//                 size: 12,
//                 maxLine: 1,
//                 color: AppColors.blackColor.withOpacity(0.7),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ],
//   );
// }
class WalletTransactions {
  Widget previousTransaction() {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => WalletViewModel(),
      onViewModelReady: (viewModel) async {
        await viewModel.getTransactions();
      },
      builder: (context, viewModel, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Card(
            surfaceTintColor: AppColors.whiteColor,
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

                // transactionsHeading(context: context),
                const SizedBox(height: 20),
                WalletTransactions.previousTransactions(
                    model: viewModel.walletTransaction!),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget previousTransactions({
    required WalletTransactionModel model,
  }) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Divider(),
        );
      },
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: model.response.length,
      itemBuilder: (context, index) {
        String amount = model.response[index].amount;
        String type = model.response[index].type.toString();
        String currency = model.response[index].currency.toString();
        String time = model.response[index].createdAt.toString();
        String dateTime = formattedDate(time as DateTime);
        double balance = double.parse(model.balance);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListTile(
            title: CustomText.customSizedText(text: type),
            subtitle: CustomText.customSizedText(text: time),
          ),
        );
      },
    );
  }
}
