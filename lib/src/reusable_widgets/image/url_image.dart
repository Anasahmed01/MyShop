import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/style/color/app_colors.dart';

class UrlImage {
  static Widget image({
    required String imageUrl,
    required BuildContext context,
    double? height,
    double? width,
    BoxFit? fit,
    double? elevation,
  }) {
    return Card(
      elevation: elevation ?? 10,
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          height: height ?? 120,
          width: width ?? MediaQuery.sizeOf(context).width,
          child: Image.network(
            filterQuality: FilterQuality.high,
            imageUrl,
            scale: 1.0,
            fit: fit ?? BoxFit.fill,
            height: height ?? 120,
            width: width ?? MediaQuery.sizeOf(context).width,
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
      ),
    );
  }
}
