// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../reusable_widgets/buttons/app_buttons.dart';
import '../../reusable_widgets/text/text.dart';
import '../../utils/style/color/app_colors.dart';
import 'widgets/inactive_widgets/cart_widgets.dart';
import 'cart_viewmodel.dart';
import 'widgets/tabbar_widgets/cart_tab/cart_tabs.dart';
import 'widgets/tabbar_widgets/past_orders/past_orders.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CartViewModel(),
      builder: (context, viewModel, child) {
        return Column(
          children: [
            Flexible(
              child: DefaultTabController(
                initialIndex: 0,
                length: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        width: MediaQuery.sizeOf(context).width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: GestureDetector(
                                onTap: () {
                                  viewModel.yuGoWeGo = 0;
                                  viewModel.notifyListeners();
                                },
                                child: weGo(
                                    context: context,
                                    isSelected: viewModel.yuGoWeGo),
                              ),
                            ),
                            CustomText.customSizedText(
                              text: 'My Orders',
                              size: 18,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w600,
                            ),
                            Flexible(
                              child: GestureDetector(
                                onTap: () {
                                  viewModel.yuGoWeGo = 1;
                                  viewModel.notifyListeners();
                                },
                                child: yuGo(
                                    context: context,
                                    isSelected: viewModel.yuGoWeGo),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Material(
                          color: AppColors.primaryColor,
                          child: SizedBox(
                            height: 40,
                            child: TabBar(
                              splashFactory: NoSplash.splashFactory,
                              overlayColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                (Set<MaterialState> states) {
                                  return states.contains(MaterialState.focused)
                                      ? null
                                      : Colors.transparent;
                                },
                              ),
                              labelColor: AppColors.whiteColor,
                              unselectedLabelColor: AppColors.whiteColor,
                              indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.seconderyColor2),
                              tabs: CartWidgets.filterTabs,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: TabBarView(
                          children: [
                            CartTab(),
                            // PendingOrderTab(),
                            PastOrderTab(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
