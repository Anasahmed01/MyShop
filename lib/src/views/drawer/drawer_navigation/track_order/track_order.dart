// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../../reusable_widgets/avatar/avatar.dart';
import '../../../../reusable_widgets/buttons/app_buttons.dart';
import '../../../../reusable_widgets/text/text.dart';
import '../../../../utils/style/color/app_colors.dart';
import '../../../../utils/style/images/images.dart';
import 'track_order_viewmodel.dart';

class TrackOrderView extends StatelessWidget {
  const TrackOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => TrackOrderViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: customButton(
              text: 'Track',
              buttonHeight: 46,
              buttonwidth: 200,
              buttonColor: AppColors.seconderyColor2,
              fontWeight: FontWeight.w600,
              textSize: 18,
            ),
          ),
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
                padding: EdgeInsets.only(right: 10.0),
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
                      text: 'Track Order',
                      size: 18,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: CustomText.customSizedText(
                              text:
                                  'To track your order pleas enter you Order ID in the box below and press he "Track" button. This was given to you on your receipt and in the confirmation email, you should have recived',
                              size: 13,
                              color: AppColors.greyColor),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 10),
                          child: CustomText.customSizedText(
                              text: 'Tracking Id',
                              size: 14,
                              color: AppColors.blackColor),
                        ),
                        TextField(
                          cursorColor: AppColors.blackColor,
                          decoration: InputDecoration(
                            hintText: 'Found in your confirmation email',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.greyColor, width: 1.0),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.greyColor, width: 1.0),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            hintStyle: TextStyle(color: AppColors.greyColor),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 10),
                          child: CustomText.customSizedText(
                              text: 'Billing Id',
                              size: 14,
                              color: AppColors.blackColor),
                        ),
                        TextField(
                          cursorColor: AppColors.blackColor,
                          decoration: InputDecoration(
                            hintText: 'Email you used in during checkout',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.greyColor, width: 1.0),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.greyColor, width: 1.0),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            hintStyle: TextStyle(color: AppColors.greyColor),
                          ),
                        ),
                        //  SizedBox(
                        //   height: 50,
                        // ),
                        // Center(child:)
                      ],
                    ),
                  ),
                  Image.asset(
                    AppImage.trackOrder1,
                    height: 300,
                    width: 200,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
