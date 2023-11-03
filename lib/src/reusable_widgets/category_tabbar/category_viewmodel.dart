import 'package:stacked/stacked.dart';

import '../../utils/style/images/images.dart';

class CategoryViewModel extends BaseViewModel{
  int tabSelection = 0;

  onTabbarChange({required int value}) {
    tabSelection = value;
    notifyListeners();
  }

  bool isTileSelected = false;
  bool isTileUnSelected = true;

  List<dynamic> tabBarImages = [
    AppImage.tabbar1,
    AppImage.tabbar2,
    AppImage.tabbar3,
    AppImage.tabbar4,
    AppImage.tabbar5,
    AppImage.tabbar6,
  ];
}