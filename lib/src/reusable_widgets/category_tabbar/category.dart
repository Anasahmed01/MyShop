import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../utils/style/color/app_colors.dart';
import '../../utils/style/images/images.dart';
import '../text/text.dart';
import 'category_viewmodel.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => CategoryViewModel(),
        builder: (context, viewModel, child) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 15),
            child: DefaultTabController(
              length: viewModel.tabBarImages.length,
              child: TabBar(
                labelPadding: const EdgeInsets.all(5),
                unselectedLabelColor: Colors.black,
                indicator: const UnderlineTabIndicator(
                  insets: EdgeInsets.symmetric(horizontal: 10.0),
                  borderSide: BorderSide(color: Colors.transparent, width: 2.0),
                ),
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: AppColors.primaryColor,
                isScrollable: true,
                onTap: (value) {
                  viewModel.onTabbarChange(value: value);
                },
                tabs: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.whiteColor,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 1,
                            blurRadius: 5),
                      ],
                    ),
                    height: 75,
                    width: 95,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage(AppImage.tabbar1),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomText.customSizedText(
                            text: 'Women Fashion',
                            color: viewModel.tabSelection == 0
                                ? AppColors.primaryColor
                                : AppColors.greyColor,
                            maxLine: 2,
                            textAlign: TextAlign.center,
                            size: 9,
                            minFontSize: 8,
                            maxFontSize: 10),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.whiteColor,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 1,
                            blurRadius: 5),
                      ],
                    ),
                    height: 75,
                    width: 95,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage(AppImage.tabbar2),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomText.customSizedText(
                          text: 'Men Clothing',
                          color: viewModel.tabSelection == 1
                              ? AppColors.primaryColor
                              : AppColors.greyColor,
                          maxLine: 2,
                          textAlign: TextAlign.center,
                          size: 9,
                          maxFontSize: 10,
                          minFontSize: 8,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.whiteColor,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 1,
                            blurRadius: 5),
                      ],
                    ),
                    height: 75,
                    width: 95,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage(AppImage.tabbar3),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomText.customSizedText(
                          text: 'Kids',
                          color: viewModel.tabSelection == 2
                              ? AppColors.primaryColor
                              : AppColors.greyColor,
                          maxLine: 2,
                          size: 9,
                          textAlign: TextAlign.center,
                          minFontSize: 8,
                          maxFontSize: 10,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.whiteColor,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 1,
                            blurRadius: 5),
                      ],
                    ),
                    height: 75,
                    width: 95,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage(AppImage.tabbar4),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomText.customSizedText(
                          text: 'Home & Decoration',
                          color: viewModel.tabSelection == 3
                              ? AppColors.primaryColor
                              : AppColors.greyColor,
                          maxLine: 2,
                          textAlign: TextAlign.center,
                          minFontSize: 8,
                          size: 9,
                          maxFontSize: 10,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.whiteColor,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 1,
                            blurRadius: 5),
                      ],
                    ),
                    height: 75,
                    width: 95,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage(AppImage.tabbar5),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomText.customSizedText(
                          text: 'Cosmetics',
                          color: viewModel.tabSelection == 4
                              ? AppColors.primaryColor
                              : AppColors.greyColor,
                          maxLine: 2,
                          textAlign: TextAlign.center,
                          minFontSize: 8,
                          size: 9,
                          maxFontSize: 10,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.whiteColor,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 1,
                            blurRadius: 5),
                      ],
                    ),
                    height: 75,
                    width: 95,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage(AppImage.tabbar6),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomText.customSizedText(
                          text: 'Accessories',
                          color: viewModel.tabSelection == 5
                              ? AppColors.primaryColor
                              : AppColors.greyColor,
                          maxLine: 2,
                          textAlign: TextAlign.center,
                          minFontSize: 8,
                          size: 9,
                          maxFontSize: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
