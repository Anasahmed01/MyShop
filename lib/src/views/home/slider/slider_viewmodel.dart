// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:shop/src/network/api_client.dart';
import 'package:shop/src/services/snackbar_service/snackbar_service.dart';
import 'package:shop/src/utils/app_constraints/app_strings.dart';
import 'package:stacked/stacked.dart';
import '../../../utils/style/color/app_colors.dart';

class SliderViewModel extends BaseViewModel {
  final controller = SwiperController();
  List<String> sliderImg = [];
  bool sliderVisible = true;
  bool isLoading = false;

  getSlider() async {
    try {
      isLoading = true;
      sliderVisible = true;
      notifyListeners();
      final data = await ApiClient.getRes(endpoint: AppStrings.slider);
      if (data == 'No Internet') {
        isLoading = false;
        sliderVisible = false;
        notifyListeners();
        return;
      }

      if (data == 'Somthing went wrong!') {
        isLoading = false;
        sliderVisible = false;
        notifyListeners();
        return;
      }
      for (var item in data) {
        var img = jsonDecode(
          jsonEncode(item["home_slider_image"]).toString(),
        );
        sliderImg.add(img.toString());
        notifyListeners();
      }
      isLoading = false;
      sliderVisible = true;
      notifyListeners();
    } on SocketException {
      NavSnackbarService.showSnackbar(
          '', 'Please check your Internet connection!');
    } catch (e) {
      print('YouRError>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$e');
      isLoading = false;
      sliderVisible = false;
      notifyListeners();
    }
  }

  void next() => controller.next();
  void previous() => controller.previous();

  Color button1Color = Colors.grey;
  Color button2Color = AppColors.primaryColor;

  void selectButton1() {
    rebuildUi();
    button1Color = AppColors.primaryColor;
    button2Color = Colors.grey;
  }

  void selectButton2() {
    rebuildUi();
    button1Color = Colors.grey;
    button2Color = AppColors.primaryColor;
  }
}
