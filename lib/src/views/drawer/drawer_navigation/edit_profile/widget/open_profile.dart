import 'package:flutter/material.dart';
import 'package:shop/src/utils/style/color/app_colors.dart';
import 'package:shop/src/views/drawer/drawer_navigation/edit_profile/edit_profile_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../../../models/user.dart';

class OpenProfileView extends StatefulWidget {
  const OpenProfileView({super.key});

  @override
  State<OpenProfileView> createState() => _OpenProfileViewState();
}

class _OpenProfileViewState extends State<OpenProfileView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => EditProfileViewModel(),
      onViewModelReady: (viewModel) async {
        await viewModel.getUserInfo();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
              leading: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.blackColor,
                  ))),
          body: Center(
            child: profileContainer(
                context: context, userModel: viewModel.currentUser!),
          ),
        );
      },
    );
  }

  Container profileContainer({
    required BuildContext context,
    required UserModel userModel,
  }) =>
      Container(
          decoration: BoxDecoration(
              image: DecorationImage(
        image: NetworkImage(userModel.shopGo[0].userImage),
      )));
}
