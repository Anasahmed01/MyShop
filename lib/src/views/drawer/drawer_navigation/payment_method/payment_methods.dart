import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../../reusable_widgets/avatar/avatar.dart';
import '../../../../reusable_widgets/buttons/app_buttons.dart';
import '../../../../reusable_widgets/text/text.dart';
import '../../../../utils/style/color/app_colors.dart';
import '../../../../utils/style/images/images.dart';
import 'payment_viewmodel.dart';

class PaymentMethodView extends StatelessWidget {
  const PaymentMethodView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => PaymentViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.primaryColor,
            leading: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                viewModel.navigateToback();
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColors.whiteColor,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: customCircleAvatar(imgUrl: AppImage.avatar, radius: 15),
              ),
            ],
            bottom: Tab(
              child: Container(
                height: 50,
                width: double.infinity,
                color: AppColors.whiteColor,
                child: Center(
                  child: CustomText.customSizedText(
                      text: 'Payments Methods',
                      size: 18,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Column(
                  children: [
                    ListTile(
                      leading: Image.asset(AppImage.masterCard),
                      title: const Text('**************456'),
                      subtitle: CustomText.customSizedText(
                          text: 'Expires at 15-05-23',
                          size: 8,
                          color: AppColors.greyColor),
                    ),
                    ListTile(
                      leading: Image.asset(AppImage.paypal),
                      title: const Text('**************456'),
                      subtitle: CustomText.customSizedText(
                          text: 'Expires at 15-05-23',
                          size: 8,
                          color: AppColors.greyColor),
                    ),
                    ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Image.asset(AppImage.visa),
                      ),
                      title: const Text('**************456'),
                      subtitle: CustomText.customSizedText(
                          text: 'Expires at 15-05-23',
                          size: 8,
                          color: AppColors.greyColor),
                    ),
                    ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 20),
                        child: Image.asset(AppImage.paymentShopGo),
                      ),
                      title: CustomText.customSizedText(
                        text: 'Shop Go Wallet',
                        size: 24,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: customButton(
                  text: 'Add Payment Methods',
                  buttonHeight: 46,
                  buttonwidth: 218,
                  buttonColor: AppColors.seconderyColor2,
                  fontWeight: FontWeight.w600,
                  textSize: 16,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
