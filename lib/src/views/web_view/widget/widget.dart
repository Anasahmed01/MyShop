import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/style/color/app_colors.dart';
import '../../../utils/style/svg/svg.dart';
import '../web_viewmodel.dart';

Widget addToCart({
  required WebViewModel viewModel,
  required BuildContext context,
  required int index,
  required String removers,
}) {
  return Visibility(
    visible: viewModel.show,
    child: Positioned(
      bottom: 10,
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: InkWell(
          onTap: () async {
            // viewModel.navigateToWebToCart(index: index, removers: removers);
          },
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF5A4496),
              borderRadius: BorderRadius.circular(10),
            ),
            width: MediaQuery.sizeOf(context).width * 0.6,
            height: 50,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_bag_rounded,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Text('Add to cart',

                  //TODO: web view argument
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget webViewLoader({required WebViewModel viewModel}) {
  return Visibility(
    visible: viewModel.isLoading,
    child: Center(
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            SvgPicture.asset(
              AppSVG.shopGo,
              height: 150,
              width: 150,
              fit: BoxFit.scaleDown,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget waitingApi({required bool isWaiting}) {
  return Positioned(
    bottom: 10,
    right: 10,
    child: Visibility(
      visible: isWaiting,
      child: CircularProgressIndicator(
        color: AppColors.primaryColor,
        backgroundColor: AppColors.whiteColor,
      ),
    ),
  );
}
