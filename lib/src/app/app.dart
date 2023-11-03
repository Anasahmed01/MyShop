import 'package:shop/src/auth/login/login.dart';
import 'package:shop/src/auth/signup/signup.dart';
import 'package:shop/src/pattern/pattren.dart';
import 'package:shop/src/services/user_services/user_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: LogIn, initial: true),
  MaterialRoute(page: SignUp),
  MaterialRoute(page: PatternView),
], dependencies: [
  Singleton(classType: NavigationService),
  LazySingleton(classType: SnackbarService),
  LazySingleton(classType: DialogService),

  //Auth
  Singleton(classType: UserService),
])
class App {}
