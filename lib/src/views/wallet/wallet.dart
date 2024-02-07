import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../reusable_widgets/text/text.dart';
import 'wallet_viewmodel.dart';
import 'widgets/top_widget.dart';
import 'widgets/transactions.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => WalletViewModel(),
      onViewModelReady: (viewModel) => viewModel.getTransactions(),
      builder: (context, viewModel, child) {
        return SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.04,
                    child: CustomText.customSizedText(
                      text: 'My Wallet',
                      textAlign: TextAlign.center,
                      maxFontSize: 14,
                      size: 14,
                    ),
                  ),
                  topWidget(context: context),
                  WalletTransactions.previousTransactions(model: viewModel.walletTransaction!),
                ],
              ),
            ));
      },
    );
  }
}
