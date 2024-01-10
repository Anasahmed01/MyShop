import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shop/src/reusable_widgets/brands_widget/widget/category.dart';
import 'package:shop/src/utils/app_constraints/app_strings.dart';
import '../../../models/brands.dart';
import '../../../utils/style/color/app_colors.dart';
import '../../text/text.dart';
import 'brands_card.dart';
import '../brands_viewmodel.dart';

Widget activeBrands({
  required AllBrandsViewModel viewModel,
  required List<Response> brandsList,
  required int navIndex,
}) {
  return Column(
    children: [
      Align(
        alignment: navIndex == 0 ? Alignment.center : Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 12),
          child: CustomText.customSizedText(
            text: 'Categories',
            color: AppColors.blackColor,
            fontWeight: FontWeight.w600,
            size: 25,
          ),
        ),
      ),
      categorys(viewModel: viewModel),
      Align(
        alignment: navIndex == 0 ? Alignment.center : Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 12),
          child: CustomText.customSizedText(
            text: 'Brands',
            color: AppColors.blackColor,
            fontWeight: FontWeight.w600,
            size: 25,
          ),
        ),
      ),
      AnimationLimiter(
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: brandsList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredGrid(
              position: index,
              columnCount: 4,
              child: ScaleAnimation(
                delay: const Duration(milliseconds: 200),
                child: brands(
                  onTap: () {
                    viewModel.navigateToWebView(index: index);
                  },
                  height: 72,
                  width: 79,
                  image: Image.network(AppStrings.brandsUrl + brandsList[index].siteImage),
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}
