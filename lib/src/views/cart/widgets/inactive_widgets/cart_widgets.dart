// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../../reusable_widgets/text/text.dart';
import '../../../../utils/style/color/app_colors.dart';
import '../../cart_viewmodel.dart';

class CartWidgets {
  static List<Widget> filterTabs = [
    CustomText.customSizedText(
      text: 'Cart',
      size: 14,
      textAlign: TextAlign.center,
      fontWeight: FontWeight.w700,
      maxLine: 2,
      color: AppColors.whiteColor,
      minFontSize: 14,
      maxFontSize: 20,
    ),
    CustomText.customSizedText(
      text: 'Pending',
      size: 14,
      fontWeight: FontWeight.w700,
      color: AppColors.whiteColor,
      textAlign: TextAlign.center,
      maxLine: 2,
      minFontSize: 14,
      maxFontSize: 20,
    ),
    CustomText.customSizedText(
      text: 'Past orders',
      size: 14,
      textAlign: TextAlign.center,
      fontWeight: FontWeight.w700,
      color: AppColors.whiteColor,
      maxLine: 2,
      minFontSize: 14,
      maxFontSize: 20,
    ),
  ];

  static Widget customYuGoWeGoButton({
    required onPressed,
    required double buttonHeight,
    required double buttonWidth,
    required buttonColor,
    required image,
    required borderColor,
  }) {
    return SizedBox(
      height: buttonHeight,
      width: buttonWidth,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(buttonColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: BorderSide(color: borderColor), // Add the border color here
            ),
          ),
        ),
        onPressed: onPressed,
        child: Center(
          child: image,
        ),
      ),
    );
  }
}

class SizedWidgetForShop extends StatelessWidget {
  const SizedWidgetForShop({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CartViewModel(),
      builder: (context, viewModel, child) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: 30,
          color: Colors.transparent,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      viewModel.rebuildUi();
                      // viewModel.currentSize = index;
                    },
                    child: Material(
                      elevation: 2,
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(30),
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color:
                                    //viewModel.currentSize == index
                                    // ? AppColors.blackColor
                                    // :
                                    AppColors.whiteColor),
                          ),
                          height: 60,
                          width: 30,
                          child: Center(
                              child: CustomText.customSizedText(
                                  text: viewModel.sizeList[index],
                                  color: AppColors.greyColor,
                                  size: 12)
                              //  Text(
                              //   viewModel.sizeList[index],
                              //   style: GoogleFonts.poppins(
                              //       color: viewModel.currentSize == index
                              //           ? AppColors.blackColor
                              //           : AppColors.greyColor,
                              //       fontSize: 10),
                              // ),
                              ),
                        ),
                      ),
                    ),
                  ),
              separatorBuilder: (_, index) => const SizedBox(
                    width: 10,
                  ),
              itemCount: viewModel.sizeList.length),
        );
      },
    );
  }
}

class CounterPickerWidget extends StatelessWidget {
  final String productId;
  const CounterPickerWidget({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CartViewModel(),
      builder: (context, viewModel, child) {
        return Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 5),
          child: Container(
            height: 30,
            decoration: BoxDecoration(
              color: AppColors.lightGreyColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    // viewModel.decrement(productId: productId, value: 1);
                  },
                  iconSize: 15,
                  icon: const Icon(Icons.remove),
                ),
                const Text(
                  '1',
                  style: TextStyle(fontSize: 18),
                ),
                IconButton(
                  onPressed: () {
                    // viewModel.increment(productId: productId, value: 1);
                  },
                  iconSize: 15,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ColorPicker extends StatelessWidget {
  final bool outerBorder;
  final Color color;
  ColorPicker(this.outerBorder, this.color);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CartViewModel(),
      builder: (context, viewModel, child) {
        return Container(
          height: 20,
          width: 30,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.9),
                  blurRadius: 0.1,
                  spreadRadius: 0.5,
                  offset: const Offset(0.5, 0.5),
                )
              ],
              shape: BoxShape.circle,
              border: outerBorder
                  ? Border.all(
                      color: color,
                      width: 2,
                    )
                  : null),
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          ),
        );
      },
    );
  }
}

class ColorPickerWidget extends StatelessWidget {
  const ColorPickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CartViewModel(),
      builder: (context, viewModel, child) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 60.0,
          ),
          child: Material(
            borderRadius: BorderRadius.circular(30),
            elevation: 5,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(30),
              ),
              height: 130,
              width: 38,
              padding: const EdgeInsets.all(8),
              child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          viewModel.rebuildUi();
                          // viewModel.curruntColor = index;
                        },
                        // child: ColorPicker(viewModel.curruntColor == index,
                        //     viewModel.colors[index]),
                      ),
                  separatorBuilder: (_, index) => const SizedBox(height: 10),
                  itemCount: 5),
            ),
          ),
        );
      },
    );
  }
}
