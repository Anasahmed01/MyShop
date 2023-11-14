import 'package:flutter/cupertino.dart';
import '../../../reusable_widgets/errors/error.dart';
import '../../../reusable_widgets/text/text.dart';
import '../../../utils/style/color/app_colors.dart';

class NotificationError {
  static Widget noInternet({required BuildContext context}) {
    return Flexible(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.5,
        child: CustomError.noInternet(),
      ),
    );
  }

  static Widget otherError({required BuildContext context}) {
    return Flexible(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.5,
        child: CustomError.otherError(),
      ),
    );
  }

  static Widget emptyNotificaiton({required BuildContext context}) {
    return Flexible(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.bell_circle,
              color: AppColors.primaryColor,
              size: 50,
            ),
            CustomText.customSizedText(
              text: 'No notifications found!',
              color: AppColors.seconderyColor2,
              size: 18,
              minFontSize: 18,
              maxFontSize: 18,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
