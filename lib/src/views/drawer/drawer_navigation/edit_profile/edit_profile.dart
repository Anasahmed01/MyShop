import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../../reusable_widgets/errors/error.dart';
import '../../../../utils/style/color/app_colors.dart';
import 'edit_profile_viewmodel.dart';
import 'widget/active_user.dart';

class EditMyAccountView extends StatelessWidget {
  const EditMyAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => EditProfileViewModel(),
      onViewModelReady: (viewModel) async {
        await viewModel.getUserInfo();
      },
      builder: (context, viewModel, child) {
        if (viewModel.noInternet == true) {
          return Scaffold(
            backgroundColor: AppColors.whiteColor,
            appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.whiteColor,
              leading: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  viewModel.navigateToback();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.blackColor,
                ),
              ),
            ),
            body: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: CustomError.noInternet(),
            ),
          );
        }
        if (viewModel.otherError == true) {
          return Scaffold(
            backgroundColor: AppColors.whiteColor,
            appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.whiteColor,
              leading: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  viewModel.navigateToback();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.blackColor,
                ),
              ),
            ),
            body: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: CustomError.otherError(),
            ),
          );
        }
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.whiteColor,
            leading: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                viewModel.navigateToback();
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColors.blackColor,
              ),
            ),
            // actions: [
            //   viewModel.currentUser == null
            //       ? Container()
            //       : TextButton(
            //           onPressed: () {},
            //           child: CustomText.customSizedText(
            //             text: 'Delete account',
            //             color: AppColors.redColor,
            //             size: 14,
            //             maxFontSize: 14,
            //             minFontSize: 14,
            //             fontWeight: FontWeight.w500,
            //           ),
            //         ),
            // ],
          ),
          body: SingleChildScrollView(
            child: activeUser(
                userModel: viewModel.currentUser!,
                viewModel: viewModel,
                context: context),
          ),
        );
      },
    );
  }
}
