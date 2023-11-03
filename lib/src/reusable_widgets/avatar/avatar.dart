import 'package:flutter/material.dart';

import '../../utils/style/images/images.dart';

customCircleAvatar(
    {required String imgUrl,
    required double radius,
    Color? borderColor,
    Color? color}) {
  return Container(
    height: radius,
    width: radius,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: borderColor ?? Colors.transparent,
        width: 1.0,
      ),
      color: color ?? Colors.transparent,
      image: DecorationImage(
        image: NetworkImage(
          imgUrl,
          scale: 1,
        ),
        scale: 1,
        fit: BoxFit.cover,
        onError: (exception, stackTrace) {
          debugPrint(exception.toString());
          Image.asset(
            AppImage.avatar,
            fit: BoxFit.cover,
          );
        },
      ),
    ),
    // child: CircleAvatar(
    //   radius: radius,
    //   backgroundColor: Colors.transparent,
    //   backgroundImage: NetworkImage(imgUrl),
    //   onBackgroundImageError: (exception, stackTrace) {},

    //   // child: imgUrl == ''
    //   //     ? Image.asset(
    //   //         AppImage.avatar,
    //   //         fit: BoxFit.cover,
    //   //       )
    //   //     : Image.network(
    //   //         imgUrl,
    //   //         fit: BoxFit.cover,
    //   //       ),
    // ),
  );
}

customInactiveCircleAvatar(
    {required String assetsImage, required double radius, Color? borderColor}) {
  return Container(
    height: radius,
    width: radius,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: borderColor ?? Colors.transparent,
        width: 1.0,
      ),
      image: DecorationImage(
        image: AssetImage(assetsImage),
        scale: 1,
        fit: BoxFit.cover,
        onError: (exception, stackTrace) {
          debugPrint(exception.toString());
          Image.asset(
            AppImage.inactiveUser,
            fit: BoxFit.cover,
          );
        },
      ),
    ),
    // child: CircleAvatar(
    //   radius: radius,
    //   backgroundColor: Colors.transparent,
    //   backgroundImage: NetworkImage(imgUrl),
    //   onBackgroundImageError: (exception, stackTrace) {},

    //   // child: imgUrl == ''
    //   //     ? Image.asset(
    //   //         AppImage.avatar,
    //   //         fit: BoxFit.cover,
    //   //       )
    //   //     : Image.network(
    //   //         imgUrl,
    //   //         fit: BoxFit.cover,
    //   //       ),
    // ),
  );
}
