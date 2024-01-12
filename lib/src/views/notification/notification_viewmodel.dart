import 'package:shop/src/models/notification.dart';
import 'package:shop/src/network/api_client.dart';
import 'package:shop/src/utils/app_constraints/app_strings.dart';
import 'package:stacked/stacked.dart';

class NotificationViewModel extends BaseViewModel {
  List<NotificationModel> notificationList = [];

  bool isLoading = false;
  bool noInternet = false;
  bool otherError = false;

  // NotificationModel? getNotificationModel;

  getNotifications() async {
    isLoading = true;
    notifyListeners();
    try {
      var response = await ApiClient.getRes(endpoint: AppStrings.notification);

      if (response == 'No Internet') {
        noInternet = true;
        isLoading = false;
        otherError = false;
        notifyListeners();
        return;
      }
      if (response == 'Somthing went wrong!') {
        otherError = true;
        isLoading = false;
        noInternet = false;
        notifyListeners();
        return;
      }
      if (response.length == 0) {
        notificationList = [];
        isLoading = false;
        noInternet = false;
        otherError = false;
        notifyListeners();
        return;
      }
      if (response.length != 0) {
        for (var items in response) {
          notificationList.add(NotificationModel.fromJson(items));
        }
        isLoading = false;
        noInternet = false;
        otherError = false;
        notifyListeners();
        return;
      }
    } catch (e) {
      otherError = true;
      isLoading = false;
      noInternet = false;
      notifyListeners();
    }
  }
}
