import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../reusable_widgets/text/text.dart';
import '../../../../utils/style/color/app_colors.dart';
import '../../../../utils/style/images/images.dart';
import 'cart_widgets.dart';

Widget productCard() {
  return AnimationLimiter(
    child: ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        // double price = double.parse(model.response[index].price);
        return Stack(
          children: [
            Card(
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
                          child: Image.asset(
                            AppImage.brandPuma,
                            scale: 1.0,
                            height: 50,
                            width: MediaQuery.sizeOf(context).width,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Card(
                            elevation: 10,
                            color: Colors.transparent,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                AppImage.womenHoodie2,
                                scale: 1.0,
                                fit: BoxFit.fill,
                                height: 120,
                                width: MediaQuery.sizeOf(context).width,
                              ),
                            ),
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
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 5.0),
                          child: CustomText.customSizedText(
                            text: "Women's Hoodie",
                            maxLine: 1,
                            size: 14,
                            maxFontSize: 14,
                            minFontSize: 14,
                            color: AppColors.blackColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            children: [
                              CustomText.customSizedText(
                                text: 'Size:',
                                size: 12,
                                color: AppColors.blackColor,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 80.0),
                                child: CustomText.customSizedText(
                                  text: 'Available in size',
                                  size: 12,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedWidgetForShop(),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8.0, right: 15),
                                child: CustomText.customSizedText(
                                  text: 'Quantity:',
                                  size: 12,
                                  color: AppColors.blackColor,
                                ),
                              ),
                              // CounterPickerWidget(productId: ''),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0, bottom: 20),
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
                                      text: '\$123',
                                      size: 18,
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
                  const Column(
                    children: [
                      ColorPickerWidget(),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 5,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.close_sharp,
                  color: AppColors.redColor,
                ),
              ),
            ),
          ],
        );
      },
    ),
  );
}
