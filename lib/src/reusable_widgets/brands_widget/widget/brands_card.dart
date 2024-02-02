import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/style/color/app_colors.dart';

Widget brands({
  required double height,
  required double width,
  required image,
  required onTap,
}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            color: const Color.fromARGB(255, 236, 234, 234),
            height: height,
            width: width,
            child: IconButton(
              onPressed: onTap,
              icon: image,
            ),
          ),
        ),
      ),
    );

Widget brandsSkeleton({
  required double height,
  required double width,
}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
            color: const Color.fromARGB(255, 236, 234, 234),
            height: height,
            width: width,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Shimmer.fromColors(
                baseColor: AppColors.blackColor,
                highlightColor: AppColors.whiteColor,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.greyColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            )),
      ),
    );
