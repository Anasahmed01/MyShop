import 'package:flutter/material.dart';
import 'package:shop/src/app/app.locator.dart';
import 'package:shop/src/app/app.router.dart';
import 'package:shop/src/services/storage/storage.dart';
import 'package:shop/src/utils/style/color/app_colors.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageServices.init();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.whiteColor,
          cardTheme: CardTheme(surfaceTintColor: AppColors.whiteColor),
          tabBarTheme:
              const TabBarTheme(indicatorSize: TabBarIndicatorSize.tab),
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: AppColors.whiteColor))),
      debugShowCheckedModeBanner: false,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
