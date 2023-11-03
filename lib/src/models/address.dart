// To parse this JSON data, do
//
//     final getAddressModel = getAddressModelFromJson(jsonString);

import 'dart:convert';

GetAddressModel getAddressModelFromJson(String str) =>
    GetAddressModel.fromJson(json.decode(str));

String getAddressModelToJson(GetAddressModel data) =>
    json.encode(data.toJson());

class GetAddressModel {
  bool success;
  List<Response> response;

  GetAddressModel({
    required this.success,
    required this.response,
  });

  factory GetAddressModel.fromJson(Map<String, dynamic> json) =>
      GetAddressModel(
        success: json["success"],
        response: List<Response>.from(
            json["response"].map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class Response {
  int id;
  int userId;
  String addressTitle;
  String province;
  String city;
  String street;
  DateTime createdAt;
  DateTime updatedAt;

  Response({
    required this.id,
    required this.userId,
    required this.addressTitle,
    required this.province,
    required this.city,
    required this.street,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        id: json["id"],
        userId: json["user_id"],
        addressTitle: json["address_title"],
        province: json["province"],
        city: json["city"],
        street: json["street"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "address_title": addressTitle,
        "province": province,
        "city": city,
        "street": street,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
