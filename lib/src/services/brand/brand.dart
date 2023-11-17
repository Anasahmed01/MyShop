// ignore_for_file: unused_local_variable

import 'package:shop/src/models/brands.dart';
import 'package:shop/src/network/api_client.dart';
import 'package:shop/src/utils/app_constraints/app_strings.dart';

class BrandService {
  Categories? category;
  List<Response> brands = [];

  getBrandbyCategory() async {
    brands = [];
    category = null;

    final res =
        await ApiClient.getRes(endpoint: AppStrings.getBrandsByCategory);

    if (res == 'No Internet') {
      return 'No Internet';
    }

    if (res == 'Somthing went wrong!') {
      return 'Somthing went wrong!';
    }

    if (res['response'].isEmpty) {
      return false;
    }

    if (res['status'] == true) {
       category = Categories.fromJson(res['categories']);
      for (var brand in res['response']) {
        brands.add(Response.fromJson(brand));
      }
    return true ;
    }
  }
}
