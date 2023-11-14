import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../reusable_widgets/avatar/avatar.dart';
import '../../reusable_widgets/text/text.dart';
import '../../utils/style/color/app_colors.dart';
import '../../utils/style/images/images.dart';

drawer({
  required BuildContext context,
  required String userImg,
  required String userName,
  void Function()? myAccount,
  void Function()? weGo,
  void Function()? yuGo,
  void Function()? trackOrder,
  void Function()? payment,
  void Function()? fav,
  void Function()? cart,
  void Function()? myAddress,
  void Function()? shippingCalculator,
  void Function()? howItWorks,
  void Function()? consumerService,
  void Function()? rateUs,
  void Function()? logout,
}) {
  return SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Column(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImage.drawerBackground),
                fit: BoxFit.cover),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
              Center(
                child: userName.isEmpty
                    ? Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(AppImage.inactiveUser),
                            radius: 55,
                          ),
                          Flexible(
                            child: CustomText.customSizedText(
                                text: '',
                                size: 17,
                                color: AppColors.whiteColor),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          // CircleAvatar(
                          //   backgroundImage: AssetImage(AppImage.avatar),
                          //   radius: 55,
                          // ),
                          customCircleAvatar(
                            radius: MediaQuery.sizeOf(context).width * 0.28,
                            imgUrl: userImg,
                            color: AppColors.whiteColor,
                          ),
                          Flexible(
                            child: CustomText.customSizedText(
                                text: userName,
                                size: 17,
                                color: AppColors.whiteColor),
                          ),
                        ],
                      ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings,
                    color: AppColors.seconderyColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 180),
              childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 30.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
              children: [
                drawerListTile(
                  leading: Icon(
                    Icons.account_circle_rounded,
                    color: AppColors.seconderyColor2,
                  ),
                  title: 'My Account',
                  color: AppColors.seconderyColor2,
                  onTab: myAccount ?? () {},
                ),
                drawerListTile(
                  leading: SvgPicture.asset(AppImage.drawer1),
                  title: 'WeGo Order',
                  onTab: weGo ?? () {},
                ),
                drawerListTile(
                  leading: SvgPicture.asset(AppImage.drawer1),
                  title: 'Yugo Order',
                  onTab: yuGo ?? () {},
                ),
                drawerListTile(
                  leading: Icon(
                    CupertinoIcons.location_solid,
                    color: AppColors.primaryColor,
                  ),
                  // SvgPicture.asset(
                  //   AppImage.drawer2,
                  //   width: 15,
                  // ),
                  title: 'Track Order',
                  onTab: trackOrder ?? () {},
                ),
                drawerListTile(
                  leading: SvgPicture.asset(AppImage.drawer3),
                  title: 'Payment',
                  onTab: payment ?? () {},
                ),
                drawerListTile(
                  leading: Icon(Icons.favorite,
                      size: 25, color: AppColors.primaryColor),
                  title: 'Favorite',
                  onTab: fav ?? () {},
                ),
                drawerListTile(
                  leading: Icon(Icons.shopping_bag,
                      size: 25, color: AppColors.primaryColor),
                  title: 'Cart',
                  onTab: cart ?? () {},
                ),
                drawerListTile(
                  leading: SvgPicture.asset(AppImage.drawer4),
                  title: 'My Address',
                  onTab: myAddress ?? () {},
                ),
                drawerListTile(
                  leading: SvgPicture.asset(AppImage.drawer5),
                  title: 'Shipping Calculator',
                  onTab: shippingCalculator ?? () {},
                ),
                drawerListTile(
                  leading: SvgPicture.asset(AppImage.drawer6),
                  title: 'How it Works',
                  onTab: howItWorks ?? () {},
                ),
                drawerListTile(
                  leading: SvgPicture.asset(AppImage.drawer7),
                  title: 'Customer Service',
                  onTab: consumerService ?? () {},
                ),
                drawerListTileNoTrailing(
                  leading: SvgPicture.asset(AppImage.drawer8),
                  title: 'Rate Us',
                  onTab: rateUs ?? () {},
                ),
                drawerListTileNoTrailing(
                  leading: SvgPicture.asset(AppImage.drawer9),
                  title: 'Logout',
                  color: AppColors.redColor,
                  onTab: logout ?? () {},
                ),
              ]),
        ),
      ],
    ),
  );
}

Widget drawerListTile({
  required Widget leading,
  required String title,
  Color? color,
  onTab,
}) {
  return ListTile(
    onTap: onTab,
    leading: leading,
    title: CustomText.customSizedText(
        text: title, size: 18, color: color ?? AppColors.blackColor),
    trailing: Icon(
      Icons.chevron_right,
      color: color ?? Colors.black,
    ),
  );
}

Widget drawerListTileNoTrailing({
  required Widget leading,
  required String title,
  Color? color,
  onTab,
}) {
  return ListTile(
    onTap: onTab,
    leading: leading,
    title: CustomText.customSizedText(
      text: title,
      size: 18,
      color: color ?? AppColors.blackColor,
    ),
  );
}
