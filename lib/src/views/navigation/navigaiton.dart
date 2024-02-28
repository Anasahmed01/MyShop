// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/src/views/navigation/navigation_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../reusable_widgets/avatar/avatar.dart';
import '../../utils/style/color/app_colors.dart';
import '../../utils/style/images/images.dart';
import '../../utils/style/text_style/text_style.dart';
import '../drawer/drawer.dart';

class NavigationView extends StatelessWidget {
  int index = 0;
  NavigationView({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => NavViewModel(),
      fireOnViewModelReadyOnce: true,
      onViewModelReady: (viewModel) async {
        await viewModel.getUser();
      },
      builder: (context, viewModel, child) {
        return WillPopScope(
          onWillPop: () async {
            final shouldPop = await showDialog<bool>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    'Exit',
                    style: AppTextStyle.customTextStyle(
                      color: AppColors.primaryColor,
                      size: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  content: Text(
                    'Are you sure you want to exit the app?',
                    style: AppTextStyle.customTextStyle(
                      color: AppColors.greyColor,
                      size: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: Text(
                        'Yes',
                        style: AppTextStyle.customTextStyle(
                          color: AppColors.primaryColor,
                          size: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: Text(
                        'No',
                        style: AppTextStyle.customTextStyle(
                          color: AppColors.redColor,
                          size: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
            return shouldPop!;
          },
          child: Scaffold(
            backgroundColor: AppColors.whiteColor,
            drawer: Drawer(
              width: MediaQuery.sizeOf(context).width / 1.32,
              backgroundColor: AppColors.whiteColor,
              child: drawer(
                  userImg: viewModel.currentUser == null
                      ? ''
                      : viewModel.currentUser!.shopGo[0].userImage,
                  userName: viewModel.currentUser == null
                      ? ''
                      : viewModel.currentUser!.shopGo[0].nickname,
                  context: context,
                  myAccount: () {
                    viewModel.navigateToEditMyAccountView();
                  },
                  weGo: () {},
                  yuGo: () {
                    //viewModel.navigateToBrandedProductView();
                  },
                  trackOrder: () {
                    // viewModel.navigateToTrackOrder();
                  },
                  payment: () {
                    // viewModel.navigateToPaymentMethodView();
                  },
                  fav: () {
                    // viewModel.navigateToHomefavouriteView();
                  },
                  cart: () {
                    if (index == 2) {
                      Navigator.pop(context);
                    } else {
                      viewModel.navigateToCart();
                    }
                  },
                  myAddress: () {
                    // viewModel.navigateToMyAddressView();
                  },
                  shippingCalculator: () {
                    // viewModel.navigateToshippingCalculator();
                  },
                  howItWorks: () {
                    viewModel.navigateToHowItsWorkView();
                  },
                  consumerService: () {
                    viewModel.navigateToCustomerServiceView();
                  },
                  rateUs: () {
                    viewModel.navigateToRateUsView();
                  },
                  logout: () {
                    viewModel.logout();
                  }),
            ),
            appBar: AppBar(
              backgroundColor: AppColors.primaryColor,
              elevation: 0.0,
              actions: [
                viewModel.currentUser == null
                    ? Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: customInactiveCircleAvatar(
                          radius: MediaQuery.sizeOf(context).width * 0.09,
                          borderColor: AppColors.greenColor,
                          assetsImage: AppImage.inactiveUser,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: customCircleAvatar(
                            radius: MediaQuery.sizeOf(context).width * 0.09,
                            borderColor: AppColors.greenColor,
                            imgUrl: viewModel.currentUser!.shopGo[0].userImage
                                .toString()),
                      ),
              ],
            ),
            bottomNavigationBar: NavigationBarTheme(
              data: NavigationBarThemeData(
                indicatorColor: AppColors.seconderyColor2,
                indicatorShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
              ),
              child: NavigationBar(
                onDestinationSelected: (value) {
                  index = value;
                  viewModel.notifyListeners();
                },
                key: viewModel.navigationKey,
                selectedIndex: index,
                labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                height: 60,
                backgroundColor: AppColors.primaryColor,
                destinations: [
                  NavigationDestination(
                      selectedIcon: ImageIcon(
                        AssetImage(AppImage.slectedBottom1),
                        color: AppColors.whiteColor,
                        size: 23,
                      ),
                      icon: ImageIcon(
                        AssetImage(AppImage.bottom1),
                        color: AppColors.seconderyColor2,
                        size: 25,
                      ),
                      label: ''),
                  NavigationDestination(
                      selectedIcon: ImageIcon(
                        AssetImage(AppImage.slectedBottom2),
                        color: AppColors.whiteColor,
                        size: 23,
                      ),
                      icon: ImageIcon(
                        AssetImage(AppImage.bottom2),
                        color: AppColors.seconderyColor2,
                        size: 25,
                      ),
                      label: ''),
                  NavigationDestination(
                      selectedIcon: ImageIcon(
                        AssetImage(AppImage.slectedBottom3),
                        color: AppColors.whiteColor,
                        size: 23,
                      ),
                      icon: ImageIcon(
                        AssetImage(AppImage.bottom3),
                        color: AppColors.seconderyColor2,
                        size: 25,
                      ),
                      label: ''),
                  NavigationDestination(
                      selectedIcon: ImageIcon(
                        AssetImage(AppImage.slectedBottom4),
                        color: AppColors.whiteColor,
                        size: 23,
                      ),
                      icon: ImageIcon(
                        AssetImage(AppImage.bottom4),
                        color: AppColors.seconderyColor2,
                        size: 25,
                      ),
                      label: ''),
                  NavigationDestination(
                      selectedIcon: SvgPicture.asset(
                        AppImage.slectedBottom5,
                      ),
                      icon: SvgPicture.asset(
                        AppImage.bottom5,
                      ),
                      label: ''),
                ],
              ),
            ),
            body: viewModel.getViewForIndex(index),
          ),
        );
      },
    );
  }
}
