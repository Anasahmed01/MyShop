import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../utils/style/color/app_colors.dart';
import '../../utils/style/images/images.dart';
import '../../utils/style/svg/svg.dart';
import '../text/text.dart';

Widget customButton({
  required String text,
  required double buttonHeight,
  required double buttonwidth,
  Color? buttonColor,
  int? maxLine,
  Color? textColor,
  FontWeight? fontWeight,
  TextOverflow? overflow,
  TextAlign? textAlign,
  double? textSize,
  double? borderRadius,
}) {
  return Container(
    height: buttonHeight,
    width: buttonwidth,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius ?? 30),
      color: buttonColor ?? AppColors.seconderyColor2,
    ),
    child: Center(
      child: CustomText.customSizedText(
        overflow: overflow ?? TextOverflow.ellipsis,
        color: textColor ?? Colors.white,
        fontWeight: fontWeight ?? FontWeight.normal,
        maxLine: maxLine ?? 1,
        size: textSize ?? 14,
        textAlign: textAlign ?? TextAlign.center,
        text: text,
      ),
    ),
  );
}

Widget customAnimatedButton({
  required onPressed,
  required RoundedLoadingButtonController controller,
  required String text,
  required double height,
  required double width,
  double? borderRadius,
  int? maxLine,
  Color? textColor,
  FontWeight? fontWeight,
  TextOverflow? overflow,
  double? fontSize,
  TextAlign? textAlign,
}) {
  return RoundedLoadingButton(
      elevation: 0,
      height: height,
      width: width,
      borderRadius: borderRadius ?? 30,
      color: AppColors.seconderyColor2,
      successColor: AppColors.seconderyColor2,
      controller: controller,
      onPressed: onPressed,
      child: CustomText.customSizedText(
        text: text,
        maxLine: maxLine,
        color: textColor ?? Colors.white,
        fontWeight: fontWeight ?? FontWeight.normal,
        overflow: overflow ?? TextOverflow.ellipsis,
        size: fontSize ?? 14,
        textAlign: textAlign ?? TextAlign.center,
      ));
}

Widget customButtonChild({
  required Widget? child,
  double? buttonHeight,
  double? buttonwidth,
  Color? buttonColor,
  double? distenceTop,
  double? distenceBottom,
  double? distenceleft,
  double? distenceRight,
}) {
  return Padding(
    padding: EdgeInsets.only(
      top: distenceTop ?? 10.0,
      bottom: distenceBottom ?? 5,
      left: distenceleft ?? 0,
      right: distenceRight ?? 0,
    ),
    child: Container(
      height: buttonHeight ?? 45,
      width: buttonwidth ?? 77,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: buttonColor ?? Colors.grey[200],
      ),
      child: child,
    ),
  );
}

Widget weGo({
  required BuildContext context,
  required int isSelected,
  double? height,
  double? width,
}) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: Container(
      height: height ?? 40,
      width: width ?? 70,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: isSelected == 0
              ? AppColors.seconderyColor
              : AppColors.primaryColor,
        ),
      ),
      child: SvgPicture.asset(AppSVG.weGo, fit: BoxFit.contain),
    ),
  );
}

Widget yuGo({
  required BuildContext context,
  required int isSelected,
  double? height,
  double? width,
}) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: Container(
      height: height ?? 40,
      width: width ?? 70,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: isSelected == 1
              ? AppColors.seconderyColor
              : AppColors.primaryColor,
        ),
      ),
      child: Image.asset(AppImage.yuGo, fit: BoxFit.contain),
    ),
  );
}
