// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i17;
import 'package:flutter/material.dart';
import 'package:shop/src/views/auth/login/login.dart' as _i4;
import 'package:shop/src/views/auth/signup/signup.dart' as _i5;
import 'package:shop/src/views/basic/splash/splash.dart' as _i2;
import 'package:shop/src/views/basic/welcome/welcome.dart' as _i3;
import 'package:shop/src/views/checkout/checkout_view.dart' as _i15;
import 'package:shop/src/views/checkout/placed_order.dart' as _i16;
import 'package:shop/src/views/drawer/drawer_navigation/customer_service/customer_service.dart'
    as _i11;
import 'package:shop/src/views/drawer/drawer_navigation/how_its_work/how_its_work.dart'
    as _i10;
import 'package:shop/src/views/drawer/drawer_navigation/payment_method/payment_methods.dart'
    as _i14;
import 'package:shop/src/views/drawer/drawer_navigation/rate_us/rate_us.dart'
    as _i9;
import 'package:shop/src/views/drawer/drawer_navigation/shipping_calculator/shipping_calculator.dart'
    as _i12;
import 'package:shop/src/views/drawer/drawer_navigation/track_order/track_order.dart'
    as _i13;
import 'package:shop/src/views/home/home.dart' as _i7;
import 'package:shop/src/views/navigation/navigaiton.dart' as _i6;
import 'package:shop/src/views/web_view/web_view.dart' as _i8;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i18;

class Routes {
  static const splash = '/';

  static const welcome = '/Welcome';

  static const logIn = '/log-in';

  static const signUp = '/sign-up';

  static const navigationView = '/navigation-view';

  static const home = '/Home';

  static const webViewr = '/web-viewr';

  static const rateUsView = '/rate-us-view';

  static const howItsWorkView = '/how-its-work-view';

  static const customerServiceView = '/customer-service-view';

  static const shippingCalculatorView = '/shipping-calculator-view';

  static const trackOrderView = '/track-order-view';

  static const paymentMethodView = '/payment-method-view';

  static const checkOutView = '/check-out-view';

  static const placedOrder = '/placed-order';

  static const all = <String>{
    splash,
    welcome,
    logIn,
    signUp,
    navigationView,
    home,
    webViewr,
    rateUsView,
    howItsWorkView,
    customerServiceView,
    shippingCalculatorView,
    trackOrderView,
    paymentMethodView,
    checkOutView,
    placedOrder,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splash,
      page: _i2.Splash,
    ),
    _i1.RouteDef(
      Routes.welcome,
      page: _i3.Welcome,
    ),
    _i1.RouteDef(
      Routes.logIn,
      page: _i4.LogIn,
    ),
    _i1.RouteDef(
      Routes.signUp,
      page: _i5.SignUp,
    ),
    _i1.RouteDef(
      Routes.navigationView,
      page: _i6.NavigationView,
    ),
    _i1.RouteDef(
      Routes.home,
      page: _i7.Home,
    ),
    _i1.RouteDef(
      Routes.webViewr,
      page: _i8.WebViewr,
    ),
    _i1.RouteDef(
      Routes.rateUsView,
      page: _i9.RateUsView,
    ),
    _i1.RouteDef(
      Routes.howItsWorkView,
      page: _i10.HowItsWorkView,
    ),
    _i1.RouteDef(
      Routes.customerServiceView,
      page: _i11.CustomerServiceView,
    ),
    _i1.RouteDef(
      Routes.shippingCalculatorView,
      page: _i12.ShippingCalculatorView,
    ),
    _i1.RouteDef(
      Routes.trackOrderView,
      page: _i13.TrackOrderView,
    ),
    _i1.RouteDef(
      Routes.paymentMethodView,
      page: _i14.PaymentMethodView,
    ),
    _i1.RouteDef(
      Routes.checkOutView,
      page: _i15.CheckOutView,
    ),
    _i1.RouteDef(
      Routes.placedOrder,
      page: _i16.PlacedOrder,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.Splash: (data) {
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.Splash(),
        settings: data,
      );
    },
    _i3.Welcome: (data) {
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.Welcome(),
        settings: data,
      );
    },
    _i4.LogIn: (data) {
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.LogIn(),
        settings: data,
      );
    },
    _i5.SignUp: (data) {
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.SignUp(),
        settings: data,
      );
    },
    _i6.NavigationView: (data) {
      final args = data.getArgs<NavigationViewArguments>(nullOk: false);
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i6.NavigationView(key: args.key, index: args.index),
        settings: data,
      );
    },
    _i7.Home: (data) {
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.Home(),
        settings: data,
      );
    },
    _i8.WebViewr: (data) {
      final args = data.getArgs<WebViewrArguments>(nullOk: false);
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i8.WebViewr(key: args.key, url: args.url, index: args.index),
        settings: data,
      );
    },
    _i9.RateUsView: (data) {
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.RateUsView(),
        settings: data,
      );
    },
    _i10.HowItsWorkView: (data) {
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.HowItsWorkView(),
        settings: data,
      );
    },
    _i11.CustomerServiceView: (data) {
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.CustomerServiceView(),
        settings: data,
      );
    },
    _i12.ShippingCalculatorView: (data) {
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.ShippingCalculatorView(),
        settings: data,
      );
    },
    _i13.TrackOrderView: (data) {
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.TrackOrderView(),
        settings: data,
      );
    },
    _i14.PaymentMethodView: (data) {
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.PaymentMethodView(),
        settings: data,
      );
    },
    _i15.CheckOutView: (data) {
      final args = data.getArgs<CheckOutViewArguments>(nullOk: false);
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => _i15.CheckOutView(
            key: args.key, totalAmount: args.totalAmount, flag: args.flag),
        settings: data,
      );
    },
    _i16.PlacedOrder: (data) {
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.PlacedOrder(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class NavigationViewArguments {
  const NavigationViewArguments({
    this.key,
    required this.index,
  });

  final _i17.Key? key;

  final int index;

  @override
  String toString() {
    return '{"key": "$key", "index": "$index"}';
  }

  @override
  bool operator ==(covariant NavigationViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.index == index;
  }

  @override
  int get hashCode {
    return key.hashCode ^ index.hashCode;
  }
}

class WebViewrArguments {
  const WebViewrArguments({
    this.key,
    required this.url,
    required this.index,
  });

  final _i17.Key? key;

  final String url;

  final int index;

  @override
  String toString() {
    return '{"key": "$key", "url": "$url", "index": "$index"}';
  }

  @override
  bool operator ==(covariant WebViewrArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.url == url && other.index == index;
  }

  @override
  int get hashCode {
    return key.hashCode ^ url.hashCode ^ index.hashCode;
  }
}

class CheckOutViewArguments {
  const CheckOutViewArguments({
    this.key,
    required this.totalAmount,
    required this.flag,
  });

  final _i17.Key? key;

  final double totalAmount;

  final int flag;

  @override
  String toString() {
    return '{"key": "$key", "totalAmount": "$totalAmount", "flag": "$flag"}';
  }

  @override
  bool operator ==(covariant CheckOutViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.totalAmount == totalAmount &&
        other.flag == flag;
  }

  @override
  int get hashCode {
    return key.hashCode ^ totalAmount.hashCode ^ flag.hashCode;
  }
}

extension NavigatorStateExtension on _i18.NavigationService {
  Future<dynamic> navigateToSplash([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splash,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWelcome([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.welcome,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLogIn([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.logIn,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignUp([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signUp,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNavigationView({
    _i17.Key? key,
    required int index,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.navigationView,
        arguments: NavigationViewArguments(key: key, index: index),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHome([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.home,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWebViewr({
    _i17.Key? key,
    required String url,
    required int index,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.webViewr,
        arguments: WebViewrArguments(key: key, url: url, index: index),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRateUsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.rateUsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHowItsWorkView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.howItsWorkView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCustomerServiceView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.customerServiceView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToShippingCalculatorView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.shippingCalculatorView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTrackOrderView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.trackOrderView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPaymentMethodView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.paymentMethodView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCheckOutView({
    _i17.Key? key,
    required double totalAmount,
    required int flag,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.checkOutView,
        arguments: CheckOutViewArguments(
            key: key, totalAmount: totalAmount, flag: flag),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPlacedOrder([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.placedOrder,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplash([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splash,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithWelcome([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.welcome,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLogIn([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.logIn,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignUp([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signUp,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNavigationView({
    _i17.Key? key,
    required int index,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.navigationView,
        arguments: NavigationViewArguments(key: key, index: index),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHome([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.home,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithWebViewr({
    _i17.Key? key,
    required String url,
    required int index,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.webViewr,
        arguments: WebViewrArguments(key: key, url: url, index: index),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRateUsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.rateUsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHowItsWorkView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.howItsWorkView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCustomerServiceView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.customerServiceView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithShippingCalculatorView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.shippingCalculatorView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTrackOrderView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.trackOrderView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPaymentMethodView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.paymentMethodView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCheckOutView({
    _i17.Key? key,
    required double totalAmount,
    required int flag,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.checkOutView,
        arguments: CheckOutViewArguments(
            key: key, totalAmount: totalAmount, flag: flag),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPlacedOrder([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.placedOrder,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
