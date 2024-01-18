import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../reusable_widgets/avatar/avatar.dart';
import '../../../reusable_widgets/buttons/app_buttons.dart';
import '../../../reusable_widgets/text/text.dart';
import '../../../utils/style/color/app_colors.dart';
import '../../../utils/style/images/images.dart';
import '../wallet_viewmodel.dart';

Widget topWidget({required BuildContext context}) {
  return ViewModelBuilder.reactive(
    viewModelBuilder: () => WalletViewModel(),
    onViewModelReady: (viewModel) async {
      await viewModel.getTransactions();
      await viewModel.getUser();
    },
    builder: (context, viewModel, child) {
      return SizedBox(
        height: 330,
        child: Stack(
          children: [
            Image.asset(
              AppImage.walletBackground,
              height: MediaQuery.sizeOf(context).height * 0.5,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: LayoutBuilder(
                builder: (context, constraints) => Stack(
                  children: [
                    Positioned(
                      top: 30,
                      left: -constraints.maxWidth * 0.19,
                      child: Image.asset(AppImage.walletBackground2),
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          viewModel.currentUser == null
                              ? customCircleAvatar(
                                  radius:
                                      MediaQuery.sizeOf(context).width * 0.2,
                                  borderColor: AppColors.greenColor,
                                  imgUrl: viewModel
                                      .users.userData!.shopGo[0].userImage,
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColors.greenColor,
                                    ),
                                  ),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage(AppImage.inactiveUser),
                                    radius:
                                        MediaQuery.sizeOf(context).width * 0.1,
                                  ),
                                ),
                          viewModel.currentUser == null
                              ? Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: CustomText.customSizedText(
                                        text: viewModel
                                            .users.userData!.shopGo[0].nickname,
                                        size: 14,
                                        maxFontSize: 14,
                                        color: AppColors.whiteColor),
                                  ),
                                )
                              : Flexible(
                                  child: CustomText.customSizedText(
                                      text: '',
                                      size: 14,
                                      maxFontSize: 14,
                                      color: AppColors.whiteColor),
                                ),
                          CustomText.customSizedText(
                              text: 'Total Amount',
                              size: 40,
                              color: AppColors.whiteColor),
                          CustomText.customSizedText(
                            text: viewModel.totalPrice.toStringAsFixed(2),
                            // viewModel.totalPrice.toStringAsFixed(2),
                            size: 40,
                            color: AppColors.seconderyColor2,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                customButton(
                                  text: 'Deposit',
                                  buttonHeight: 40,
                                  buttonwidth: 122,
                                  buttonColor: AppColors.seconderyColor2,
                                ),
                                const SizedBox(width: 5),
                                customButton(
                                  text: 'WithDraw',
                                  buttonHeight: 40,
                                  buttonwidth: 122,
                                  buttonColor: Colors.grey[400],
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
