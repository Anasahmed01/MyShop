import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../color/app_colors.dart';

class WaitingReusable {
  static Widget textSkeleton({
    double? height,
    double? width,
    Color? color,
    BorderRadius? borderRadius,
  }) {
    return Shimmer.fromColors(
      baseColor: AppColors.blackColor,
      highlightColor: AppColors.whiteColor,
      child: Container(
        height: height ?? 10,
        width: width ?? 50,
        decoration: BoxDecoration(
            color: color ?? Colors.black.withOpacity(0.08),
            borderRadius:
                borderRadius ?? const BorderRadius.all(Radius.circular(16))),
      ),
    );
  }

  static Widget imageSkeleton({
    double? height,
    double? width,
    BorderRadius? borderRadius,
  }) {
    return Shimmer.fromColors(
      baseColor: AppColors.blackColor,
      highlightColor: AppColors.whiteColor,
      child: Container(
        height: height ?? 50,
        width: width ?? 50,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.08),
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(1)),
        ),
      ),
    );
  }

  static Widget iconSkeleton({
    double? height,
    double? width,
    Color? color,
    Border? border,
  }) {
    return Shimmer.fromColors(
      baseColor: AppColors.blackColor,
      highlightColor: AppColors.whiteColor,
      child: Container(
        height: height ?? 15,
        width: width ?? 15,
        decoration: BoxDecoration(
          border: border ?? Border.all(width: 0, color: Colors.transparent),
          color: color ?? Colors.black.withOpacity(0.08),
          borderRadius: const BorderRadius.all(Radius.circular(100)),
        ),
      ),
    );
  }

  static Widget fieldSkeleton({
    double? width,
    Color? color,
  }) {
    return Shimmer.fromColors(
      baseColor: AppColors.blackColor,
      highlightColor: AppColors.whiteColor,
      child: Container(
        height: 60,
        width: width ?? 50,
        decoration: BoxDecoration(
          color: color ?? Colors.black.withOpacity(0.04),
          border: Border.all(color: Colors.black.withOpacity(0.2), width: 0),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 230, 230, 230),
              blurRadius: 20.0,
              spreadRadius: 2.0,
              offset: Offset(
                0.5,
                0.5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
