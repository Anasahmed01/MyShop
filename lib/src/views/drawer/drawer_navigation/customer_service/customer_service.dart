// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../reusable_widgets/text/text.dart';
import '../../../../utils/style/color/app_colors.dart';
import 'customer_service_viewmodel.dart';
import 'widget/container_widget.dart';

class CustomerServiceView extends StatelessWidget {
  const CustomerServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CustomerServiceViewModel(),
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
                      text: "Customer Service",
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
          )),
        );
      },
    );
  }
}
