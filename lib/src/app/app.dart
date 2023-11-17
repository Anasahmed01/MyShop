import 'package:shop/src/services/brand/brand.dart';
import 'package:shop/src/services/user_services/user_service.dart';
import 'package:shop/src/views/web_view/web_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../views/auth/login/login.dart';
import '../views/auth/signup/signup.dart';
import '../views/basic/splash/splash.dart';
import '../views/basic/welcome/welcome.dart';
import '../views/checkout/checkout_view.dart';
import '../views/checkout/placed_order.dart';
import '../views/drawer/drawer_navigation/customer_service/customer_service.dart';
import '../views/drawer/drawer_navigation/how_its_work/how_its_work.dart';
import '../views/drawer/drawer_navigation/payment_method/payment_methods.dart';
import '../views/drawer/drawer_navigation/rate_us/rate_us.dart';
import '../views/drawer/drawer_navigation/shipping_calculator/shipping_calculator.dart';
import '../views/drawer/drawer_navigation/track_order/track_order.dart';
import '../views/home/home.dart';
import '../views/navigation/navigaiton.dart';

@StackedApp(routes: [
  //Basic
  MaterialRoute(page: Splash, initial: true),
  MaterialRoute(page: Welcome),

//Auth
  MaterialRoute(page: LogIn),
  MaterialRoute(page: SignUp),

  //Navigation bar views
  MaterialRoute(page: NavigationView),
  // home
  MaterialRoute(page: Home),

  //Auth
  MaterialRoute(page: WebViewr),

  //Drawer Navigations
  MaterialRoute(page: RateUsView),
  MaterialRoute(page: HowItsWorkView),
  MaterialRoute(page: CustomerServiceView),
  MaterialRoute(page: ShippingCalculatorView),
  MaterialRoute(page: TrackOrderView),
  MaterialRoute(page: PaymentMethodView),
  MaterialRoute(page: CheckOutView),
  MaterialRoute(page: PlacedOrder),
], dependencies: [
  Singleton(classType: NavigationService),
  LazySingleton(classType: SnackbarService),
  LazySingleton(classType: DialogService),

  //Auth
  Singleton(classType: UserService),

  //brand
  Singleton(classType: BrandService),
])
class App {}
