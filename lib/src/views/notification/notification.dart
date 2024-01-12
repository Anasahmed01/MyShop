import 'package:flutter/material.dart';
import 'package:shop/src/views/notification/widget/waiting.dart';
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
      onViewModelReady: (viewModel) async {
        await viewModel.getNotifications();
        viewModel.notifyListeners();
      },
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
              if (viewModel.isLoading == true)
                Flexible(
                  child: NotificationWaiting.waitingList(context: context),
                ),
              if (viewModel.noInternet == true)
                NotificationError.noInternet(context: context),
              if (viewModel.otherError == true)
                NotificationError.otherError(context: context),
              if (viewModel.notificationList.isNotEmpty &&
                  viewModel.isLoading == false &&
                  viewModel.noInternet == false &&
                  viewModel.otherError == false)
                Flexible(
                    child: NotificationWidgets.notifitationList(
                        viewModel: viewModel)),
              if (viewModel.notificationList.isEmpty &&
                  viewModel.isLoading == false &&
                  viewModel.noInternet == false &&
                  viewModel.otherError == false)
                NotificationError.emptyNotificaiton(context: context),
            ],
          ),
        );
      },
    );
  }
}
