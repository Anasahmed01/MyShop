import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import '../../reusable_widgets/brands_widget/brands.dart';
import '../../reusable_widgets/text/text.dart';
import '../../utils/style/color/app_colors.dart';
import '../../utils/style/images/images.dart';
import 'brands_viewmodel.dart';

class BrandsView extends StatelessWidget {
  const BrandsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => BrandsViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  child: SvgPicture.asset(
                    AppImage.cateGoryTop,
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height * 0.2,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 12),
                  child: CustomText.customSizedText(
                    text: 'Brands',
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w600,
                    size: 25,
                  ),
                ),
                const AllBrandsView(),
              ],
            ),
          ),
        );
      },
    );
  }
}
