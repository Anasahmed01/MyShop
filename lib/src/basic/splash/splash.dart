import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/src/basic/splash/splash_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../utils/style/color/app_colors.dart';
import '../../utils/style/images/images.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
        viewModelBuilder: () => SplashViewModel(),
        onViewModelReady: (viewModel) async {
          await viewModel.navigate();
        },
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: AppColors.primaryColor,
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImage.splashBackground),
                    fit: BoxFit.cover),
              ),
              child: Stack(
                children: [
                  Center(
                    child: SvgPicture.asset(AppImage.shopGo),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
