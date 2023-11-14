import 'package:card_swiper/card_swiper.dart';
import 'package:shop/src/utils/style/images/images.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../app/app.router.dart';

class AllBrandsViewModel extends BaseViewModel {
  SwiperController controller = SwiperController();

  bool noInternet = false;
  bool otherError = false;

  navigateToWebView({required int index}) {
    locator<NavigationService>().navigateTo(
      Routes.webViewr,
    );
  }

  List<String> allBrandsImages = [];
  List<String> brandsUrls = [];
  List<String> brandsname = [];
  bool isLoading = false;

  final getBrandImg = [
    AppImage.brandPuma,
    AppImage.brandAmazon,
    AppImage.brandCk,
    AppImage.brandGucci,
    AppImage.brandLacoste,
    AppImage.brandLevis,
    AppImage.brandPuma,
    AppImage.brandAmazon,
    AppImage.brandCk,
    AppImage.brandGucci,
    AppImage.brandLacoste,
    AppImage.brandLevis
  ];
}
