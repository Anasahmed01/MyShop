import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/style/color/app_colors.dart';
import '../../utils/style/svg/svg.dart';

class AppLoadingIndicator {
  static Widget appLoader({required bool isLoading}) {
    return Visibility(
      visible: isLoading,
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
}
