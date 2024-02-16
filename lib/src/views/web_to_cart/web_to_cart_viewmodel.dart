import 'package:shop/src/models/product_detail.dart';
import 'package:shop/src/network/api_client.dart';
import 'package:shop/src/utils/app_constraints/app_strings.dart';
import 'package:stacked/stacked.dart';

class WebToCartViewModel extends BaseViewModel {
  int currentSize = 0;
  bool isLoading = false;
  bool foundEror = false;
  ProductDetailModel? productDetail;
  getProductData({required String productUrl}) async {
    try {
      var res = await ApiClient.postRes(
          endPoint: AppStrings.productDetail, body: {'url': productUrl});

      if (res == 'Somthing went wrong!') {
        isLoading = false;
        foundEror = true;
        notifyListeners();
        return;
      }
      if (res == 'No Internet') {
        isLoading = false;
        foundEror = true;
        notifyListeners();
        return;
      }
      if (res['success'] == false) {
        isLoading = false;
        foundEror = true;
        notifyListeners();
        return;
      }

      if (res['success'] == true) {
        productDetail = ProductDetailModel.fromJson(res);
        foundEror = false;
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      foundEror = true;
      isLoading = false;
      notifyListeners();
    }
  }
}
