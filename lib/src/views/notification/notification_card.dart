import 'package:flutter/material.dart';
import 'package:shop/src/utils/date_time/date_time.dart';
import 'package:shop/src/views/notification/notification_viewmodel.dart';

import '../../reusable_widgets/image/url_image.dart';
import '../../reusable_widgets/text/text.dart';
import '../../utils/style/color/app_colors.dart';

Widget notificationCard({
  required BuildContext context,
  required int index,
  required NotificationViewModel viewModel,
}) {
  return Card(
    margin: const EdgeInsets.only(top: 5),
    elevation: 0,
    child: Stack(
      children: [
        Positioned(
          right: 0,
          top: 0,
          child: CustomText.customSizedText(
            text: DateTimerAgo.timeAgo(
                viewModel.notificationList[index].createdAt),
            size: 8,
            maxFontSize: 8,
            minFontSize: 8,
            color: AppColors.blackColor,
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                Visibility(
                  visible: index == 0 ? true : false,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: AppColors.seconderyColor2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 2),
                UrlImage.image(
                  elevation: 5,
                  height: 80,
                  width: 80,
                  fit: BoxFit.fill,
                  imageUrl: viewModel.notificationList[index].image,
                  context: context,
                ),
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(10),
                //   child: Container(
                //     height: MediaQuery.sizeOf(context).width * 0.25,
                //     width: MediaQuery.sizeOf(context).width * 0.25,
                //     color: AppColors.lightLightGreyColor,
                //     child: Padding(
                //       padding: const EdgeInsets.all(10),
                //       child: Image.network(
                //         notificationModel.image,
                //         fit: BoxFit.contain,
                //       ),
                //     ),
                //   ),
                // ),
                Flexible(
                  child: ListTile(
                    title: CustomText.customSizedText(
                      text:
                          viewModel.notificationList[index].subject.toString(),
                      size: 15,
                      maxFontSize: 15,
                      minFontSize: 15,
                      maxLine: 2,
                      color: AppColors.blackColor,
                    ),
                    subtitle: CustomText.customSizedText(
                      text: viewModel.notificationList[index].description
                          .toString(),
                      size: 12,
                      minFontSize: 12,
                      maxFontSize: 12,
                      maxLine: 4,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            ),
            Divider(color: AppColors.greyColor),
          ],
        ),
      ],
    ),
  );
}
