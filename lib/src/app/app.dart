import 'package:shop/src/auth/login/login.dart';
import 'package:shop/src/auth/signup/signup.dart';
import 'package:shop/src/basic/splash/splash.dart';
import 'package:shop/src/basic/welcome/welcome.dart';
import 'package:shop/src/home/home.dart';
import 'package:shop/src/services/user_services/user_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: Splash, initial: true),
  MaterialRoute(page: LogIn),
  MaterialRoute(page: SignUp),
  MaterialRoute(page: Home),
  MaterialRoute(page: Welcome),
], dependencies: [
  Singleton(classType: NavigationService),
  LazySingleton(classType: SnackbarService),
  LazySingleton(classType: DialogService),

  //Auth
  Singleton(classType: UserService),
])
class App {}
