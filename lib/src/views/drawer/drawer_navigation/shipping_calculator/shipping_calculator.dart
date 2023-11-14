// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../../reusable_widgets/avatar/avatar.dart';
import '../../../../reusable_widgets/text/text.dart';
import '../../../../utils/style/color/app_colors.dart';
import '../../../../utils/style/images/images.dart';
import 'shipping_calculator_viewmodel.dart';

class ShippingCalculatorView extends StatelessWidget {
  const ShippingCalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ShippingCalculatorViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.primaryColor,
            leading: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                viewModel.navigateToback();
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColors.whiteColor,
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: customCircleAvatar(imgUrl: AppImage.avatar, radius: 15),
              ),
            ],
            bottom: Tab(
              child: Container(
                height: 50,
                width: double.infinity,
                color: AppColors.whiteColor,
                child: Center(
                  child: CustomText.customSizedText(
                      text: 'Shipping Calculator',
                      size: 18,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  CustomText.customSizedText(
                      text: 'Select the country you want to shop from',
                      size: 18,
                      color: AppColors.blackColor),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(),
                    child: CustomText.customSizedText(
                        text: 'Where you will ship from?',
                        size: 15,
                        color: AppColors.greyColor),
                  ),
                  DropdownButtonFormField(
                    hint: Text('Select country'),
                    icon: Icon(Icons.keyboard_arrow_down_sharp),
                    onChanged: (v) {},
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors
                                .greyColor), // Set the border color to grey
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    items: [
                      DropdownMenuItem(
                        value: "Turkey",
                        child: Text("Turkey"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(),
                    child: CustomText.customSizedText(
                        text: 'Where do you want to send it?',
                        size: 13,
                        color: AppColors.greyColor),
                  ),
                  DropdownButtonFormField(
                    hint: Text('Select country'),
                    icon: Icon(Icons.keyboard_arrow_down_sharp),
                    onChanged: (v) {},
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors
                                .greyColor), // Set the border color to grey
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    items: [
                      DropdownMenuItem(
                        value: "Israel",
                        child: Text("Israel"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText.customSizedText(
                      text: 'Enter you package dimensions',
                      size: 18,
                      color: AppColors.blackColor),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText.customSizedText(
                          text: 'Weight', size: 13, color: AppColors.greyColor),
                      SizedBox(
                        child: Row(
                          children: [
                            Radio(
                              activeColor: AppColors.primaryColor,
                              value: 'Lbs-Inchs',
                              groupValue: viewModel.groupValue,
                              onChanged: (value) {
                                viewModel.rebuildUi();
                                viewModel.groupValue = value!;
                              },
                            ),
                            CustomText.customSizedText(
                                text: 'Lbs-Inchs',
                                size: 14,
                                color: AppColors.greyColor),
                            Radio(
                              activeColor: AppColors.primaryColor,
                              value: 'Kg-Cm',
                              groupValue: viewModel.groupValue,
                              onChanged: (value) {
                                viewModel.rebuildUi();
                                viewModel.groupValue = value!;
                              },
                            ),
                            CustomText.customSizedText(
                                text: 'Kg-Cm',
                                size: 14,
                                color: AppColors.greyColor),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[50],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            viewModel.rebuildUi();
                            viewModel.decrement();
                          },
                          icon: Icon(Icons.remove,
                              color: AppColors.primaryColor, size: 30),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          width: 40,
                          height: 30,
                          child: Center(
                            child: Text(
                              '${viewModel.value}',
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            viewModel.rebuildUi();
                            viewModel.increment();
                          },
                          icon: Icon(Icons.add,
                              color: AppColors.primaryColor, size: 30),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: CustomText.customSizedText(
                        text: 'Width', size: 13, color: AppColors.greyColor),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[50],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            //viewModel.decrement();
                          },
                          icon: Icon(Icons.remove,
                              color: AppColors.primaryColor, size: 30),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          width: 40,
                          height: 30,
                          child: Center(
                            child: Text(
                              '0',
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // viewModel.increment();
                          },
                          icon: Icon(Icons.add,
                              color: AppColors.primaryColor, size: 30),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: CustomText.customSizedText(
                        text: 'Length', size: 13, color: AppColors.greyColor),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[50],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            //viewModel.decrement();
                          },
                          icon: Icon(Icons.remove,
                              color: AppColors.primaryColor, size: 30),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          width: 40,
                          height: 30,
                          child: Center(
                            child: Text(
                              '0',
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            //viewModel.increment();
                          },
                          icon: Icon(Icons.add,
                              color: AppColors.primaryColor, size: 30),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: CustomText.customSizedText(
                        text: 'Height', size: 13, color: AppColors.greyColor),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[50],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            // viewModel.decrement();
                          },
                          icon: Icon(Icons.remove,
                              color: AppColors.primaryColor, size: 30),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          width: 40,
                          height: 30,
                          child: Center(
                            child: Text(
                              '0',
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            //  viewModel.increment();
                          },
                          icon: Icon(Icons.add,
                              color: AppColors.primaryColor, size: 30),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText.customSizedText(
                          text: 'Total Price:',
                          size: 12,
                          color: AppColors.blackColor,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Container(
                            width: 105,
                            height: 33,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: CustomText.customSizedText(
                                text: viewModel.totalPrice == null
                                    ? '\$0'
                                    : '\$${viewModel.totalPrice.toString()}',
                                size: 22,
                                fontWeight: FontWeight.w600,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
