import 'package:flutter/material.dart';
import 'package:shop/src/app/app.locator.dart';
import 'package:shop/src/services/brand/brand.dart';
import 'package:stacked/stacked.dart';

class WebViewModel extends BaseViewModel {
  GlobalKey fkey = GlobalKey();
  GlobalKey loaderkey = GlobalKey();
  bool show = false;
  bool isLoading = false;
  final brandService = locator<BrandsService>();
}
