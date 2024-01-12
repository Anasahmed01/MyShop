import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shop/src/utils/style/images/images.dart';
import 'package:shop/src/views/cart/widgets/tabbar_widgets/cart_tab/cart_tab_viewmodel.dart';
import '../../../../../../reusable_widgets/card_widget/size_color.dart';
import '../../../../../../reusable_widgets/image/url_image.dart';
import '../../../../../../reusable_widgets/text/text.dart';
import '../../../../../../utils/style/color/app_colors.dart';

Widget pastOrderCard({required CartTabViewModel cartTabViewModel}) {
  return AnimationLimiter(
    child: ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return AnimationConfiguration.staggeredList(
          position: index,
          delay: const Duration(milliseconds: 200),
          child: SlideAnimation(
            child: InkWell(
              onTap: () {},
              child: Card(
                elevation: 5,
                color: AppColors.whiteColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: UrlImage.image(
                              filterQuality: FilterQuality.low,
                              imageUrl: AppImage.brandPuma,
                              context: context,
                              height: 40,
                              elevation: 0,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: UrlImage.image(
                              filterQuality: FilterQuality.low,
                              imageUrl: AppImage.hoodie,
                              context: context,
                              height: 120,
                              elevation: 10,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20, bottom: 5.0),
                            child: CustomText.customSizedText(
                              text: 'Women Hoodie',
                              maxLine: 2,
                              size: 14,
                              maxFontSize: 14,
                              minFontSize: 14,
                              color: AppColors.blackColor,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: sizeColorWidget(
                                  heading: 'Size',
                                  content: 'M',
                                  context: context,
                                ),
                              ),
                              Flexible(
                                child: sizeColorWidget(
                                  heading: 'Color',
                                  content: 'kala',
                                  context: context,
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 15.0, bottom: 20),
                            child: Row(
                              children: [
                                CustomText.customSizedText(
                                  text: 'Total Price:',
                                  size: 12,
                                  color: AppColors.blackColor,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 15.0,
                                  ),
                                  child: Container(
                                    width: 105,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: CustomText.customSizedText(
                                        text: '120',
                                        size: 18,
                                        maxFontSize: 18,
                                        minFontSize: 18,
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                  ),
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
          ),
        );
      },
    ),
  );
}
