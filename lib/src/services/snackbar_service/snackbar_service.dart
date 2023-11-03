// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../utils/style/color/app_colors.dart';

class NavSnackbarService {
  static SnackbarService snackbarService = locator<SnackbarService>();
  static DialogService dialogService = locator<DialogService>();

  static Future<dynamic>? showSnackbar(String title, String message) {
    snackbarService.showSnackbar(
        title: title, message: message, duration: const Duration(seconds: 2));
  }

  static Future<dynamic>? showDialogBox(
    String? title,
    String description,
    String buttonTitle,
    String cancelTitle,
  ) {
    return dialogService.showDialog(
      title: title!,
      description: description,
      buttonTitle: buttonTitle,
      barrierDismissible: false,
      buttonTitleColor: AppColors.primaryColor,
      cancelTitle: cancelTitle,
      cancelTitleColor: Colors.red,
    );
  }

  static Future<dynamic>? loadingDialog() {
    return dialogService.showDialog(
      title: 'Loading',
      description: 'Please wait...',
      barrierDismissible: true,
    );
  }

  // static Future<dynamic> optionDialog({
  //   required BuildContext context,
  //   required List<SheetAction<dynamic>> actions,
  //   required String? title,
  // }) async {
  //   return showModalActionSheet(
  //     context: context,
  //     actions: actions,
  //     title: title,

  //   );
  // }
}
