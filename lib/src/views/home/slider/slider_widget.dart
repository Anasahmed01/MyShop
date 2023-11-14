import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/src/views/home/slider/slider_viewmodel.dart';
import '../../../utils/app_constraints/app_strings.dart';
import '../../../utils/style/color/app_colors.dart';

Widget buildImage(
    {required String urlImage,
    required int index,
    required BuildContext context}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: Container(
      height: MediaQuery.sizeOf(context).height * 0.2,
      color: AppColors.greyColor,
      child: Image.network(
        AppStrings.sliderImage + urlImage,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Center(
            child: CupertinoActivityIndicator(
              color: AppColors.primaryColor,
              radius: 14,
            ),
          );
        },
      ),
    ),
  );
}

Widget waitingSlider(
    {required BuildContext context, required SliderViewModel viewModel}) {
  return Column(
    children: [
      SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.2,
        width: double.infinity,
        child: Swiper(
          itemHeight: MediaQuery.sizeOf(context).height * 0.2,
          itemWidth: MediaQuery.sizeOf(context).width * 0.75,
          layout: SwiperLayout.STACK,
          itemCount: viewModel.sliderImg.length,
          autoplayDisableOnInteraction: true,
          controller: viewModel.controller,
          autoplay: true,
          scrollDirection: Axis.horizontal,
          axisDirection: AxisDirection.right,
          itemBuilder: (context, index) {
            return Container(
              height: MediaQuery.sizeOf(context).height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.6),
              ),
            );
          },
        ),
      ),
      Row(
        children: [
          IconButton(
            color: viewModel.button1Color,
            onPressed: () {
              viewModel.selectButton1();
              viewModel.previous();
            },
            icon: const Icon(
              Icons.arrow_circle_left_sharp,
            ),
          ),
          IconButton(
            onPressed: () {
              viewModel.next();
              viewModel.selectButton2();
            },
            color: viewModel.button2Color,
            icon: const Icon(
              Icons.arrow_circle_right_sharp,
            ),
          ),
        ],
      ),
    ],
  );
}
