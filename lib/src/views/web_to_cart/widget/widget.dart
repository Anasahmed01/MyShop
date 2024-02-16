import 'package:flutter/material.dart';

import '../../../reusable_widgets/image/url_image.dart';
import '../../../reusable_widgets/text/text.dart';
import '../../../utils/style/color/app_colors.dart';
import '../web_to_cart_viewmodel.dart';

class WebToCartWidgets {
  static Widget shareFav({
    void Function()? shareOnTap,
    void Function()? favOnTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: shareOnTap,
            child: Icon(
              Icons.share,
              size: 30,
              color: AppColors.greyColor,
            ),
          ),
          InkWell(
            onTap: favOnTap,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Icon(
                Icons.favorite,
                size: 25,
                color: AppColors.redColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget namePrice({
    required String name,
    required String price,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 3,
          child: CustomText.customSizedText(
            text: name,
            maxLine: 3,
            maxFontSize: 15,
            minFontSize: 14,
            size: 14,
            textAlign: TextAlign.left,
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.primaryColor,
            ),
            child: CustomText.customSizedText(
              text: price,
              color: AppColors.whiteColor,
              maxLine: 1,
              maxFontSize: 15,
              fontWeight: FontWeight.w500,
              minFontSize: 12,
              size: 14,
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
    );
  }

  static Widget productImage({
    required String imageUrl,
    required BuildContext context,
    void Function()? favOnTap,
    void Function()? shareOnTap,
  }) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.4,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            height: MediaQuery.sizeOf(context).height * 0.4,
            child: shareFav(
              favOnTap: favOnTap,
              shareOnTap: shareOnTap,
            ),
          ),
          Center(
            child: UrlImage.image(
              imageUrl: imageUrl,
              context: context,
              elevation: 30,
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width * 0.7,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }

  static Widget sizeList({
    required List<String> sizeList,
    required BuildContext context,
    required WebToCartViewModel viewModel,
  }) {
    return Visibility(
      visible: sizeList.isNotEmpty,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * 0.1,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomText.customSizedText(
              text: 'Size:',
              maxFontSize: 14,
              minFontSize: 13,
              size: 13,
            ),
            Flexible(
              child: SizedBox(
                height: 40,
                width: MediaQuery.sizeOf(context).width,
                child: ListView.separated(
                  itemCount: sizeList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        viewModel.currentSize = index;
                        viewModel.notifyListeners();
                      },
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          height: 35,
                          constraints: const BoxConstraints(minWidth: 35),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: viewModel.currentSize == index
                                  ? AppColors.primaryColor
                                  : AppColors.greyColor,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.all(5),
                          child: CustomText.customSizedText(
                            text: sizeList[index],
                            minFontSize: 12,
                            maxFontSize: 14,
                            size: 13,
                            textAlign: TextAlign.center,
                            color: viewModel.currentSize == index
                                ? AppColors.primaryColor
                                : AppColors.greyColor,
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, index) {
                    return const SizedBox(width: 10);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget colorList({
    required List<String> colorUrlList,
    required List<String> colorImageList,
    required BuildContext context,
    required WebToCartViewModel viewModel,
    required String productUrl,
  }) {
    return Visibility(
      visible: colorImageList.isNotEmpty,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * 0.15,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomText.customSizedText(
              text: 'Colors:',
              maxFontSize: 14,
              minFontSize: 13,
              size: 13,
            ),
            Flexible(
              child: Row(
                children: [
                  Container(
                    width: 2,
                    color: Colors.grey,
                  ),
                  Flexible(
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: ListView.separated(
                        itemCount: colorImageList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {},
                            child: UrlImage.image(
                              imageUrl: colorImageList[index],
                              context: context,
                              width: MediaQuery.sizeOf(context).width * 0.2,
                              fit: BoxFit.fill,
                            ),
                          );
                        },
                        separatorBuilder: (_, index) {
                          return const SizedBox(width: 10);
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: 2,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
