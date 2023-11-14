import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/src/views/checkout/checkout_viewmodel.dart';
import 'package:stacked/stacked.dart';
import '../../reusable_widgets/buttons/app_buttons.dart';
import '../../reusable_widgets/text/text.dart';
import '../../utils/style/color/app_colors.dart';
import '../../utils/style/images/images.dart';
import 'widgets/custom_drop_down.dart';

class CheckOutView extends StatelessWidget {
  final int flag;
  final double totalAmount;
  const CheckOutView({
    super.key,
    required this.totalAmount,
    required this.flag,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CheckOutViewModel(),
      onViewModelReady: (viewModel) {
        //  viewModel.getAddress();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            elevation: 0,
            bottom: Tab(
              child: Container(
                color: AppColors.whiteColor,
                width: double.infinity,
                child: Center(
                  child: CustomText.customSizedText(
                    text: 'Checkout',
                    size: 18,
                    minFontSize: 18,
                    maxFontSize: 18,
                    textAlign: TextAlign.center,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomText.customSizedText(
                        text: 'Shipping address',
                        size: 18,
                        color: AppColors.blackColor),
                    const SizedBox(height: 10),
                    Card(
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText.customSizedText(
                                text: 'Postal address',
                                size: 18,
                                maxFontSize: 18,
                                minFontSize: 18,
                                color: AppColors.blackColor),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.person,
                                          color: AppColors.seconderyColor2,
                                        ),
                                        const SizedBox(width: 10),
                                        Flexible(
                                          child: CustomText.customSizedText(
                                            text: viewModel.users.userData!
                                                .shopGo[0].nickname,
                                            size: 14,
                                            maxFontSize: 14,
                                            minFontSize: 14,
                                            color: AppColors.blackColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // viewModel.navigateToAddress();
                                    },
                                    child: Image.asset(
                                      AppImage.edit,
                                      height: 18,
                                      width: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on_rounded,
                                    color: AppColors.seconderyColor2,
                                  ),
                                  const SizedBox(width: 10),
                                  dropDown(viewModel: viewModel),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.phone,
                                    color: AppColors.seconderyColor2,
                                  ),
                                  const SizedBox(width: 10),
                                  CustomText.customSizedText(
                                    text:
                                        '${viewModel.users.userData!.shopGo[0].phone}',
                                    size: 14,
                                    maxFontSize: 14,
                                    minFontSize: 14,
                                    color: AppColors.blackColor,
                                  ),
                                ],
                              ),
                            ),

                            // DottedBorder(
                            //   color: AppColors.greyColor,
                            //   strokeWidth: 2,
                            //   dashPattern: [8, 8],
                            //   child: SizedBox(
                            //     height: 50,
                            //     width: double.infinity,
                            //     child: Center(
                            //       child: CustomText.customSizedText(
                            //           text: "Click & collect",
                            //           size: 15,
                            //           color: AppColors.greyColor),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 3.0),
                      child: CustomText.customSizedText(
                          text: "Payment type",
                          size: 18,
                          maxFontSize: 18,
                          minFontSize: 18,
                          color: AppColors.blackColor),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.15,
                      width: MediaQuery.sizeOf(context).width,
                      child: Card(
                        color: AppColors.whiteColor,
                        elevation: 8,
                        child: ListView.builder(
                          itemCount: viewModel.paymentMethod.length,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              child: InkWell(
                                onTap: () {
                                  viewModel.paymentSelection(index: index);
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  elevation: 20,
                                  shadowColor:
                                      viewModel.selectedPayment == index
                                          ? AppColors.primaryColor
                                          : AppColors.lightLightGreyColor,
                                  child: Container(
                                    height: 90,
                                    width: 110,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    decoration: BoxDecoration(
                                      color: viewModel.selectedPayment == index
                                          ? AppColors.primaryColor
                                              .withOpacity(0.1)
                                          : AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: SvgPicture.asset(
                                      viewModel.paymentMethod[index],
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 3.0),
                      child: CustomText.customSizedText(
                          text: "We Accept",
                          size: 15,
                          maxFontSize: 15,
                          minFontSize: 15,
                          color: AppColors.blackColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10),
                      child: Row(
                        children: [
                          Card(
                            elevation: 1,
                            child: Container(
                              height: 40,
                              width: 50,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: SvgPicture.asset(
                                viewModel.paymentMethod[0],
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Card(
                            elevation: 1,
                            child: Container(
                              height: 40,
                              width: 50,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: SvgPicture.asset(
                                viewModel.paymentMethod[1],
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Card(
                            elevation: 1,
                            child: Container(
                              height: 40,
                              width: 50,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: SvgPicture.asset(
                                viewModel.paymentMethod[2],
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Card(
                            elevation: 1,
                            child: Container(
                              height: 40,
                              width: 50,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: SvgPicture.asset(
                                viewModel.paymentMethod[3],
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Card(
                            elevation: 1,
                            child: Container(
                              height: 40,
                              width: 50,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: SvgPicture.asset(
                                viewModel.paymentMethod[4],
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5.0, left: 5),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText.customSizedText(
                                      text: 'Shipping',
                                      size: 14,
                                      maxFontSize: 14,
                                      minFontSize: 14,
                                      color: AppColors.greyColor),
                                  CustomText.customSizedText(
                                    text: '\$0',
                                    size: 16,
                                    maxFontSize: 16,
                                    minFontSize: 16,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText.customSizedText(
                                      text: 'Sale tax',
                                      size: 14,
                                      maxFontSize: 14,
                                      minFontSize: 14,
                                      color: AppColors.greyColor),
                                  CustomText.customSizedText(
                                    text: '\$0',
                                    size: 16,
                                    maxFontSize: 16,
                                    minFontSize: 16,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText.customSizedText(
                                      text: 'Consolidation & Quality Control',
                                      size: 14,
                                      maxFontSize: 14,
                                      minFontSize: 14,
                                      color: AppColors.greyColor),
                                  CustomText.customSizedText(
                                    text: '\$0',
                                    size: 16,
                                    maxFontSize: 16,
                                    minFontSize: 16,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText.customSizedText(
                                      text: 'Product Price',
                                      size: 14,
                                      maxFontSize: 14,
                                      minFontSize: 14,
                                      color: AppColors.greyColor),
                                  CustomText.customSizedText(
                                    text: totalAmount.toStringAsFixed(1),
                                    size: 16,
                                    maxFontSize: 16,
                                    minFontSize: 16,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Divider(color: AppColors.greyColor),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText.customSizedText(
                                        text: 'Sub - Total',
                                        size: 24,
                                        maxFontSize: 14,
                                        minFontSize: 14,
                                        color: AppColors.blackColor),
                                    CustomText.customSizedText(
                                        text: totalAmount.toStringAsFixed(1),
                                        size: 24,
                                        maxFontSize: 24,
                                        minFontSize: 24,
                                        color: AppColors.priceColor),
                                  ],
                                ),
                              ),
                              InkWell(
                                // onTap: () => viewModel.navigateToPlaceOrder(
                                //   yuGoWeGo: flag.toString(),
                                // ),
                                child: customButton(
                                    text: 'Place Oreder',
                                    buttonHeight: 46,
                                    buttonwidth: 190,
                                    buttonColor: AppColors.seconderyColor2,
                                    textSize: 16),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, top: 5),
                      child: Text.rich(
                        TextSpan(
                            text: 'By placing your order you agree to ',
                            style: GoogleFonts.poppins(
                                color: AppColors.greyColor, fontSize: 10),
                            children: [
                              TextSpan(
                                text: 'our terms and conditions, privacy ',
                                style: TextStyle(
                                  color: AppColors.redColor,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'and returns policies and consent to some of your data being stored by Shop GO which may be used to make future shopping experiences better for you.',
                                style: TextStyle(
                                  color: AppColors.greyColor,
                                ),
                              ),
                            ]),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
