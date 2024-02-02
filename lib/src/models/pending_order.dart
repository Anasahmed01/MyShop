// To parse this JSON data, do
//
//     final pendingOrdersModel = pendingOrdersModelFromJson(jsonString);

import 'dart:convert';

PendingOrdersModel pendingOrdersModelFromJson(String str) =>
    PendingOrdersModel.fromJson(json.decode(str));

String pendingOrdersModelToJson(PendingOrdersModel data) =>
    json.encode(data.toJson());

class PendingOrdersModel {
  bool success;
  String currency;
  List<Response> response;

  PendingOrdersModel({
    required this.success,
    required this.currency,
    required this.response,
  });

  factory PendingOrdersModel.fromJson(Map<String, dynamic> json) =>
      PendingOrdersModel(
        success: json["success"],
        currency: json["currency"],
        response: List<Response>.from(
            json["response"].map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "currency": currency,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class Response {
  String id;
  String name;
  String price;
  int quantity;
  Attributes attributes;

  Response({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.attributes,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
        attributes: Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "quantity": quantity,
        "attributes": attributes.toJson(),
      };
}

class Attributes {
  String userId;
  String size;
  String color;
  String logo;
  String productImage;
  String productUrl;
  String shippingPrice;
  String totalPrice;
  String module;
  String remover;
  DateTime createdAt;

  Attributes({
    required this.userId,
    required this.size,
    required this.color,
    required this.logo,
    required this.productImage,
    required this.productUrl,
    required this.shippingPrice,
    required this.totalPrice,
    required this.module,
    required this.remover,
    required this.createdAt,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        userId: json["user_id"],
        size: json["size"],
        color: json["color"],
        logo: json["logo"],
        productImage: json["productImage"],
        productUrl: json["productUrl"],
        shippingPrice: json["shippingPrice"],
        totalPrice: json["totalPrice"],
        module: json["module"],
        remover: json["remover"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "size": size,
        "color": color,
        "logo": logo,
        "productImage": productImage,
        "productUrl": productUrl,
        "shippingPrice": shippingPrice,
        "totalPrice": totalPrice,
        "module": module,
        "remover": remover,
        "created_at": createdAt.toIso8601String(),
      };
}
