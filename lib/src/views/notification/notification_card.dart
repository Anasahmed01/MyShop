import 'package:flutter/material.dart';
import 'package:shop/src/utils/style/images/images.dart';

import '../../reusable_widgets/image/url_image.dart';
import '../../reusable_widgets/text/text.dart';
import '../../utils/style/color/app_colors.dart';

Widget notificationCard({
  required BuildContext context,
  required int index,
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
            text: '3/2/2020',
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
                  imageUrl: AppImage.womenHoodie2,
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
                      text: 'Women Hoodie',
                      size: 15,
                      maxFontSize: 15,
                      minFontSize: 15,
                      maxLine: 2,
                      color: AppColors.blackColor,
                    ),
                    subtitle: CustomText.customSizedText(
                      text:
                          "Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
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
