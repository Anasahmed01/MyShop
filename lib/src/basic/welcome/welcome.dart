import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../reusable_widgets/buttons/app_buttons.dart';
import '../../reusable_widgets/text/text.dart';
import '../../utils/style/color/app_colors.dart';
import '../../utils/style/images/images.dart';
import 'welcome_viewmodel.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => WelcomeViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: AppColors.primaryColor,
            title: Image.asset(
              AppImage.shopGoForShop,
              height: 27,
              width: 150,
            ),
          ),
          body: SingleChildScrollView(
            padding:
                EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Image.asset(
                      AppImage.welcome1,
                      height: MediaQuery.sizeOf(context).width * 0.8,
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText.customSizedText(
                        text: 'Shop from hundreds',
                        size: 28,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomText.customSizedText(
                        text: 'Turkish brands online',
                        size: 28,
                        color: AppColors.primaryColor,
                      ),
                      const SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0, top: 20),
                        child: InkWell(
                          onTap: () {
                            viewModel.navigateToNext();
                          },
                          child: customButton(
                            text: 'Continue',
                            buttonHeight: 50,
                            buttonwidth: MediaQuery.sizeOf(context).width * 0.4,
                            buttonColor: AppColors.seconderyColor2,
                            textSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
