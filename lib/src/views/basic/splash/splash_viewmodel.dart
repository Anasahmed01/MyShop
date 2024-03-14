import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shop/src/views/navigation/navigaiton.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../services/storage/storage.dart';
import '../../../services/user_services/user_service.dart';
import '../welcome/welcome.dart';

class SplashViewModel extends BaseViewModel {
  String? userId = LocalStorageServices.getUserId();
  final users = locator<UserService>();

  navigate() async {
    // if (userId != null) {
    //   users.isLogin = true;
    //   await users.getUserData();
    //   await users.getAddress();
    // }
    // UserData.getUserData(userId!);

    if (userId != null) {
      users.isLogin = true;
      await users.getUserData();
      await users.getAddress();
      locator<NavigationService>().replaceWithTransition(
        NavigationView(index: 0), //add index
        opaque: true,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.bounceOut,
      );
    } else {
      Timer(const Duration(seconds: 3), () {
        locator<NavigationService>().replaceWithTransition(const Welcome(),
            opaque: true,
            duration: const Duration(milliseconds: 300),
            transitionStyle: Transition.leftToRightWithFade);
      });

      // locator<NavigationService>()
      //     .pushNamedAndRemoveUntil(Routes.welcomeView);
    }
  }
}
