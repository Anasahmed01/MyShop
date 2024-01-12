import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../reusable_widgets/text/text.dart';
import '../../../utils/style/color/app_colors.dart';
import '../notification_card.dart';
import '../notification_viewmodel.dart';

class NotificationWidgets {
  static Widget heading() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: CustomText.customSizedText(
        text: 'Notifications',
        size: 18,
        maxFontSize: 18,
        minFontSize: 18,
        color: AppColors.blackColor,
        fontWeight: FontWeight.w600,
        textAlign: TextAlign.center,
      ),
    );
  }

  static Widget headerRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText.customSizedText(
          text: 'See all',
          size: 14,
          maxFontSize: 14,
          minFontSize: 14,
          color: AppColors.greyColor,
        ),
        CustomText.customSizedText(
          text: 'Mark all as read',
          size: 14,
          maxFontSize: 14,
          minFontSize: 14,
          color: AppColors.greyColor,
        ),
      ],
    );
  }

  static Widget notifitationList({required NotificationViewModel viewModel}) {
    return ListView.builder(
      itemCount: viewModel.notificationList.length,
      shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
      itemExtent: 130,
      itemBuilder: (context, index) {
        return AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 200),
          child: SlideAnimation(
            child: notificationCard(
              viewModel: viewModel,
              context: context,
              index: index,
            ),
          ),
        );
      },
    );
  }
}
