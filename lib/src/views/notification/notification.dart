import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../utils/style/color/app_colors.dart';
import 'notification_viewmodel.dart';
import 'widget/errors.dart';
import 'widget/widget.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => NotificationViewModel(),
      onViewModelReady: (viewModel) async {},
      builder: (context, viewModel, child) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NotificationWidgets.heading(),
              NotificationWidgets.headerRow(),
              Divider(color: AppColors.greyColor),
              Flexible(
                  child: NotificationWidgets.notifitationList(
                      viewModel: viewModel)),
              NotificationError.emptyNotificaiton(context: context),
            ],
          ),
        );
      },
    );
  }
}
