// ignore_for_file: prefer__ructors, prefer__literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import '../../../../reusable_widgets/buttons/app_buttons.dart';
import '../../../../reusable_widgets/text/text.dart';
import '../../../../utils/style/color/app_colors.dart';
import '../../../../utils/style/images/images.dart';
import 'rate_us_viewmodel.dart';

class RateUsView extends StatelessWidget {
  const RateUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => RateUsViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.primaryColor,
            leading: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                viewModel.navigateToNavigationView();
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColors.whiteColor,
              ),
            ),
            bottom: Tab(
              child: Container(
                height: 50,
                width: double.infinity,
                color: AppColors.whiteColor,
                child: Center(
                  child: CustomText.customSizedText(
                      text: 'Rate Us',
                      size: 18,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              height: double.infinity,
              width: MediaQuery.sizeOf(context).width,
              child: Stack(
                fit: StackFit.passthrough,
                children: [
                  Positioned(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    top: MediaQuery.sizeOf(context).height * 0.2,
                    child: Column(
                      children: [
                        SvgPicture.asset(AppImage.signUpWithGAccountImg1),
                        SizedBox(
                          height: 40,
                        ),
                        CustomText.customSizedText(
                          text: 'How was your Shopping experience with Us',
                          size: 23,
                          fontWeight: FontWeight.w600,
                          maxLine: 2,
                          color: AppColors.blackColor,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        RatingBar.builder(
                          glowColor: AppColors.primaryColor,
                          unratedColor: AppColors.lightGreyColor,
                          itemSize: 35,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4),
                          minRating: 1,
                          itemBuilder: (context, index) {
                            return Icon(
                              Icons.star,
                              color: AppColors.seconderyColor,
                            );
                          },
                          updateOnDrag: true,
                          onRatingUpdate: (rating) {
                            viewModel.rebuildUi();
                            viewModel.rating = rating;
                          },
                        ),
                        // SizedBox(
                        //   height: MediaQuery.sizeOf(context).height * 0.25,
                        // ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      child: customAnimatedButton(
                        text: 'Submit',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        onPressed: () {
                          viewModel.btnController.reset();
                        },
                        height: 46.0,
                        width: 350.0,
                        controller: viewModel.btnController,
                      ),
                    ),
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
