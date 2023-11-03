import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../utils/style/text_style/text_style.dart';

class CustomText {
  static Widget customSizedText({
    required String text,
    Color? color,
    int? maxLine,
    TextOverflow? overflow,
    TextAlign? textAlign,
    double? size,
    FontWeight? fontWeight,
    double? minFontSize,
    double? maxFontSize,
  }) {
    return AutoSizeText(
      text,
      maxLines: maxLine ?? 1,
      overflow: overflow ?? TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.justify,
      textDirection: TextDirection.ltr,
      minFontSize: minFontSize ?? 8,
      maxFontSize: maxFontSize ?? 34,
      style: AppTextStyle.customTextStyle(
        size: size ?? 14,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? Colors.black,
      ),
    );
  }

  static Widget errorText(
      {required String errorText, required bool visible, double? leftPadding}) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding ?? 20),
      child: Align(
        alignment: Alignment.topLeft,
        child: Visibility(
          visible: visible,
          child: customSizedText(
            text: errorText,
            color: Colors.red,
            size: 12,
            maxFontSize: 12,
          ),
        ),
      ),
    );
  }
}
