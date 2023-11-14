// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/src/views/home/home_viewmodel.dart';
import 'package:shop/src/views/home/slider/slider.dart';
import 'package:stacked/stacked.dart';
import '../../reusable_widgets/brands_widget/brands.dart';
import '../../reusable_widgets/text/text.dart';
import '../../utils/style/color/app_colors.dart';
import '../../utils/style/images/images.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: AnimationLimiter(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 300),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          child: Image.asset(AppImage.home1,
                              height: 191,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover),
                        ),
                        Positioned(
                          top: 45,
                          left: 20,
                          child: CustomText.customSizedText(
                              text: 'Welcome To',
                              size: 14,
                              color: AppColors.whiteColor),
                        ),
                        Positioned(
                          top: 70,
                          left: 45,
                          child: SvgPicture.asset(
                            AppImage.shopGo,
                            height: 88.56,
                            width: 74.09,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const HomeSlider(),
                    Center(
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
            ),
          ),
        );
      },
    );
  }
}
