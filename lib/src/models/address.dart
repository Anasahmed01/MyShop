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
  String houseNo;
  String province;
  String country;
  String city;
  String street;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  Response({
    required this.id,
    required this.userId,
    required this.houseNo,
    required this.province,
    required this.country,
    required this.city,
    required this.street,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        id: json["id"],
        userId: json["user_id"],
        houseNo: json["house_no"],
        province: json["province"],
        country: json["country"],
        city: json["city"],
        street: json["street"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "house_no": houseNo,
        "province": province,
        "country": country,
        "city": city,
        "street": street,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
