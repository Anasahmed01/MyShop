import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../../../../reusable_widgets/card_widget/size_color.dart';
import '../../../../../../reusable_widgets/text/text.dart';
import '../../../../../../utils/style/color/app_colors.dart';
import '../../../../../../utils/style/images/images.dart';
import '../cart_tab_viewmodel.dart';

Widget cartCard({
  required CartTabViewModel viewModel,
}) {
  return AnimationLimiter(
    child: ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return AnimationConfiguration.staggeredList(
          position: index,
          delay: const Duration(milliseconds: 200),
          child: SlideAnimation(
            child: Stack(
              children: [
                InkWell(
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Image.asset(
                                  AppImage.brandPuma,
                                  height: 40,
                                ),
                                //  UrlImage.image(
                                //   filterQuality: FilterQuality.low,
                                //   elevation: 0,
                                //   height: 40,
                                //   fit: BoxFit.contain,
                                //   imageUrl: cart[index].attributes.logo,
                                //   context: context,
                                // ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Image.asset(
                                  AppImage.hoodie,
                                ),
                                //  UrlImage.image(
                                //   filterQuality: FilterQuality.low,
                                //   imageUrl: cart[index].attributes.productImage,
                                //   context: context,
                                // ),
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
                                padding: const EdgeInsets.only(
                                    top: 20, bottom: 5.0, right: 30),
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
                                      content: 'black',
                                      context: context,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, right: 15),
                                    child: CustomText.customSizedText(
                                      text: 'Quantity:',
                                      size: 12,
                                      color: AppColors.blackColor,
                                    ),
                                  ),
                                  // productQuantity(
                                  //     viewModel: viewModel,
                                  //     quantity: quantity,
                                  //     productId: productId)
                                  // CounterPickerWidget(
                                  //     productId:
                                  //         model.response[index].id.toString()),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 15.0, bottom: 20),
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
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Center(
                                          child: CustomText.customSizedText(
                                            text: '120 TL',
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
                        // Visibility(
                        //   visible:
                        //       model.response[index].attributes.color.isNotEmpty,
                        //   child: Column(
                        //     children: [
                        //       colorsList(
                        //           colorList:
                        //               model.response[index].attributes.color,
                        //           context: context,
                        //           viewModel: viewModel),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 5,
                  child: IconButton(
                    onPressed: () {
                      // viewModel.removeCart(
                      //   productId: cart[index].id,
                      // );
                    },
                    icon: Icon(
                      Icons.close_sharp,
                      color: AppColors.redColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
