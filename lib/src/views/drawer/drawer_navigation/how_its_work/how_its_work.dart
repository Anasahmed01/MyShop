// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../../reusable_widgets/text/text.dart';
import '../../../../utils/style/color/app_colors.dart';
import '../customer_service/widget/container_widget.dart';
import 'how_its_work_viewmodel.dart';

class HowItsWorkView extends StatelessWidget {
  const HowItsWorkView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HowItsWorkViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.primaryColor,
            leading: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                viewModel.navigateToNavigationView();
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColors.whiteColor,
              ),
            ),
            bottom: Tab(
              child: Container(
                height: 50,
                width: double.infinity,
                color: AppColors.whiteColor,
                child: Center(
                  child: CustomText.customSizedText(
                      text: "How It's Work",
                      size: 18,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: contentContainer(),
            ),
          ),
        );
      },
    );
  }
}
