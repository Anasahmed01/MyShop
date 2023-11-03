// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  List<ShopGo> shopGo;
  int statusCode;

  UserModel({
    required this.shopGo,
    required this.statusCode,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        shopGo:
            List<ShopGo>.from(json["ShopGo"].map((x) => ShopGo.fromJson(x))),
        statusCode: json["status_code"],
      );

  Map<String, dynamic> toJson() => {
        "ShopGo": List<dynamic>.from(shopGo.map((x) => x.toJson())),
        "status_code": statusCode,
      };
}

class ShopGo {
  String userId;
  String username;
  String nickname;
  String email;
  String userImage;
  String? gender;
  String? dob;
  String? country;
  String? phone;
  String success;

  ShopGo({
    required this.userId,
    required this.username,
    required this.email,
    required this.nickname,
    required this.userImage,
    this.gender,
    this.dob,
    this.country,
    this.phone,
    required this.success,
  });

  factory ShopGo.fromJson(Map<String, dynamic> json) => ShopGo(
        userId: json["user_id"],
        username: json["username"],
        nickname: json["nickname"],
        email: json["email"],
        userImage: json["user_image"],
        gender: json["gender"],
        dob: json["dob"],
        country: json["country"],
        phone: json["phone"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "username": username,
        "nickname": nickname,
        "email": email,
        "user_image": userImage,
        "gender": gender,
        "dob": dob,
        "country": country,
        "phone": phone,
        "success": success,
      };
}
