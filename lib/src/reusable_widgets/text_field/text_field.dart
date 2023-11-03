import 'package:flutter/material.dart';
import '../../utils/style/color/app_colors.dart';
import '../../utils/style/text_style/text_style.dart';

class CustomTextFields {
  static Widget textfield({
    required controller,
    String? hintText,
    double? height,
    Icon? prefixIcon,
    Icon? suffixIcon,
    Color? iconColor,
  }) {
    return SizedBox(
      height: height ?? 50,
      child: TextField(
        cursorColor: AppColors.blackColor,
        textInputAction: TextInputAction.next,
        controller: controller,
        decoration: InputDecoration(
          hintStyle: AppTextStyle.customTextStyle(
            color: AppColors.greyColor,
          ),
          fillColor: AppColors.textFieldColor,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.greyColor,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          suffixIcon: suffixIcon,
          suffixIconColor: iconColor ?? Colors.white,
          prefixIcon: prefixIcon,
          prefixIconColor: iconColor ?? Colors.white,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  static Widget appTextField({
    controller,
    onPressed,
    prefixIcon,
    double? height,
    Color? borderColor,
    width,
    hintText,
    validator,
    initialValue,
    obscureText = false,
    IconData? suffixIcon,
    onSuffixPressed,
    readOnly = false,
    onChanged,
    keBoardType,
  }) {
    //final bool suffixTapped;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: borderColor ?? Colors.transparent,
        ),
      ),
      child: TextFormField(
        cursorColor: AppColors.blackColor,
        textInputAction: TextInputAction.next,
        textAlign: TextAlign.start,
        keyboardType: keBoardType,
        readOnly: readOnly,
        onTap: onPressed,
        initialValue: initialValue,
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        obscureText: obscureText!,
        decoration: InputDecoration(
          errorStyle: const TextStyle(color: Colors.red),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(color: Colors.red),
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(color: Colors.red)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
          hintText: hintText,
          labelStyle: const TextStyle(fontSize: 10.0),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 35.0, bottom: 2, right: 10),
            child: Icon(
              prefixIcon,
              size: 18.0,
              color: Colors.grey,
            ),
          ),
          suffixIcon: InkWell(
            onTap: onSuffixPressed,
            child: Icon(suffixIcon, color: AppColors.greyColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.lightGreyColor,
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
          filled: true,
          alignLabelWithHint: true,
          fillColor: Colors.grey[100],
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  static Widget squareTextField({
    required controller,
    required String hintText,
    void Function(String)? onChanged,
    void Function()? onTap,
    TextInputType? keyBoardType,
    BorderRadius? borderRadius,
    String? Function(String?)? validator,
    Color? borderColor,
    TextStyle? hintStyle,
    Widget? suffixIcon,
    bool? autocorrect,
    bool? fillColor,
    int? maxLines,
    Icon? prefixIcon,
    EdgeInsetsGeometry? contentPadding,
    Color? hintColor,
    FontWeight? hintWeight,
    TextInputAction? textInputAction,
    bool? readOnly,
    BorderStyle? borderStyle,
  }) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      onTap: onTap,
      readOnly: readOnly ?? false,
      keyboardType: keyBoardType,
      cursorColor: AppColors.primaryColor,
      maxLines: maxLines ?? 1,
      autocorrect: autocorrect ?? false,
      textInputAction: TextInputAction.next,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        prefixIcon: prefixIcon,
        fillColor: AppColors.greyColor.withOpacity(0.2),
        filled: fillColor ?? false,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? AppColors.greyColor,
            style: borderStyle ?? BorderStyle.solid,
          ),
          borderRadius: borderRadius ?? BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? AppColors.greyColor,
            style: borderStyle ?? BorderStyle.solid,
          ),
          borderRadius: borderRadius ?? BorderRadius.circular(10.0),
        ),
        hintText: hintText,
        hintStyle: AppTextStyle.customTextStyle(
          color: hintColor ?? AppColors.greyColor,
          fontWeight: hintWeight ?? FontWeight.normal,
          size: 14,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? AppColors.greyColor,
            style: borderStyle ?? BorderStyle.solid,
          ),
          borderRadius: borderRadius ?? BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
