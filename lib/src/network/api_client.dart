// ignore_for_file: empty_catches, unused_local_variable, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shop/src/services/snackbar_service/snackbar_service.dart';
import 'dart:developer' as devlog;
import 'package:shop/src/services/storage/storage.dart';
import 'package:shop/src/utils/app_constraints/app_strings.dart';

class ApiClient {
  static Future postRes({
    required String endPoint,
    required body,
    Map<String, String>? header,
  }) async {
    try {
      String? userToken = LocalStorageServices.getToken();
      final String url = AppStrings.siteUrl + endPoint;

      final http.Response res = await http.post(
        Uri.parse(url),
        body: body,
        headers: header ?? {"Authorization": "Bearer ${userToken}"},
      );
      final response = json.decode(res.body);
      if (res.statusCode == 200) {
        return response;
      } else if (res.statusCode == 404) {
        return response;
      } else if (res.statusCode == 400) {
        return response;
      } else {
        return response;
      }
    } on SocketException {
      NavSnackbarService.showSnackbar(
          '', 'Please check your internet connection');
      return 'No Internet';
    } catch (e) {
      devlog.log('$e', name: 'Catch');
      NavSnackbarService.showSnackbar('', 'Something went wrong!');
      return 'Somthing went wrong!';
    }
  }

  static Future getRes({
    required String endpoint,
    Map<String, String>? header,
  }) async {
    try {
      String? userToken = LocalStorageServices.getToken();
      final String url = AppStrings.siteUrl + endpoint;
      final http.Response res = await http.get(
        Uri.parse(url),
        headers: header ?? {'Authorization': "Bearer $userToken"},
      );
      if (res.statusCode == 200) {
        final response = json.decode(res.body.toString());
        return response;
      } else if (res.statusCode == 404) {
        final response = json.decode(res.body.toString());
        return response;
      } else if (res.statusCode == 400) {
        final response = json.decode(res.body.toString());
        return response;
      } else {
        return res;
      }
    } on SocketException {
      return 'No Internet';
    } catch (e) {
      devlog.log('$e', name: 'Catch');
      return 'Somthing went wrong!';
    }
  }

  static Future postUserImg({
    required String endpoint,
    required profImage,
  }) async {
    try {
      String? userToken = LocalStorageServices.getToken();
      final String url = AppStrings.siteUrl + endpoint;
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.headers.addAll({'Authorization': "Bearer $userToken"});
      request.files.add(
        http.MultipartFile.fromBytes(
            'image', File(profImage!.path).readAsBytesSync(),
            filename: profImage!.path),
      );

      await request.send();
    } on SocketException {
      NavSnackbarService.showSnackbar(
          '', 'Please check your internet connection');
      return null;
    } catch (e) {
      devlog.log('$e', name: 'User Image');
      NavSnackbarService.showSnackbar('', 'Something went wrong!');
      return null;
    }
  }
}
