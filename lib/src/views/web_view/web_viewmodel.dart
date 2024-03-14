import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:shop/src/app/app.locator.dart';
import 'package:shop/src/app/app.router.dart';
import 'package:shop/src/network/api_client.dart';
import 'package:shop/src/services/brand/brand.dart';
import 'package:shop/src/utils/app_constraints/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'dart:developer' as dev;

import 'package:stacked_services/stacked_services.dart';

class WebViewModel extends BaseViewModel {
  late InAppWebViewController controller;

  navigateToWebToCart({
    required int index,
    required String remover,
  }) {
    locator<NavigationService>().clearStackAndShow(Routes.webToCartView,
        arguments: WebToCartViewArguments(
            productUrl: currentUrl, index: index, remover: remover));
  }

  bool show = false;
  String url = '';
  String currentUrl = '';
  final brandService = locator<BrandsService>();

  bool isScroling = false;
  scrollingPage({required String link}) {
    if (currentUrl != link) {
      isScroling = false;
    }
    if (isScroling == false) {
      dev.log('current link $currentUrl');
      dev.log('scroling link $link');
      checkUrl(link: link);
      currentUrl = link;
    }
  }

  bool apiLoader = false;
  checkUrl({required link}) async {
    isScroling = true;
    currentUrl = link;
    show = false;
    apiLoader = true;
    notifyListeners();
    final res = await ApiClient.postRes(
      endPoint: AppStrings.brandCheck,
      body: {'url': link},
    );

    if (res == 'Somthig went wrong!') {
      isScroling = false;
      await checkUrl(link: link);
      return;
    }

    if (res['success'] == true) {
      show = true;
      isScroling = true;
      apiLoader = false;
    } else {
      show = false;
      isScroling = true;
      apiLoader = false;
    }
    notifyListeners();
    return show;
  }

  bool isLoading = false;
  webLoader({required int progress}) {
    isLoading = true;
    notifyListeners();
    if (progress > 80) {
      return isLoading = false;
    }
  }

  removeringElements(
      {required InAppWebViewController controller, required String removers}) {
    String js = '''
                    function cartRemove(cart){
                      if(cart[0] == '#'){
                        val = cart.slice(1);
                        var remover = document.getElementById(val);
                        if(remover != null){
                          remover.parentNode.removeChild(remover);
                        }
                      }
                      else if(cart[0] == '.'){
                        val = cart.slice(1);
                        var remover = document.getElementsByClassName(val);
                        if(remover.length > 0){
                          remover[0].parentNode.removeChild(remover[0]);
                        }
                      }
                      else{
                        var remover = document.getElementsByTagName(cart);
                        if(remover.length > 0){
                          remover[0].parentNode.removeChild(remover[0]);
                        }
                      }
                    }

                    function runArray(array){
                      let data = array.split(',');
                      for (let i = 0; i <= data.length-1; i++) {
                          cartRemove(data[i].toString());
                      }
                    }

                    function runArrayWithTime(array){
                      let data = array.split(',');
                      for (let i = 0; i <= data.length-1; i++) {
                        var temp = i+1
                        setTimeout(function() {
                          cartRemove(data[i].toString());
                        }, temp * 1000);
                      }
                    }

                    let inputString = "$removers";
                    runArray(inputString);
                    runArrayWithTime(inputString);
                  ''';

    controller.callAsyncJavaScript(functionBody: js);
  }
}
