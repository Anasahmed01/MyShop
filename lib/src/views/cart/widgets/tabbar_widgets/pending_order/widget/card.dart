import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shop/src/views/cart/widgets/tabbar_widgets/pending_order/pending_order_viewmodel.dart';
import '../../../../../../reusable_widgets/card_widget/size_color.dart';
import '../../../../../../reusable_widgets/image/url_image.dart';
import '../../../../../../reusable_widgets/text/text.dart';
import '../../../../../../utils/style/color/app_colors.dart';

Widget pendingOrderCard({required PendingOrderViewModel viewModel}) {
  return AnimationLimiter(
    child: ListView.builder(
      itemCount: viewModel.attribute.length,
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
                              imageUrl:
                                  viewModel.attribute[index].attributes.logo,
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
                              imageUrl: viewModel
                                  .attribute[index].attributes.productImage,
                              context: context,
                              height: 120,
                              elevation: 10,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
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
                              text: viewModel.attribute[index].name,
                              maxLine: 2,
                              overflow: TextOverflow.ellipsis,
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
                                  content: viewModel
                                      .attribute[index].attributes.size,
                                  context: context,
                                ),
                              ),
                              Flexible(
                                child: sizeColorWidget(
                                  heading: 'Color',
                                  content: viewModel
                                      .attribute[index].attributes.color,
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
                                        text: viewModel.attribute[index].price +
                                            viewModel.getCartData!.currency,
                                        size: 18,
                                        maxFontSize: 16,
                                        minFontSize: 16,
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
