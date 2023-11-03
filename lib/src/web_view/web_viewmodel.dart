import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class WebViewModel extends BaseViewModel {
  GlobalKey fkey = GlobalKey();
  GlobalKey loaderkey = GlobalKey();
  bool show = false;
  bool isLoading = false;
}
