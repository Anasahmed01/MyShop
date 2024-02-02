// To parse this JSON data, do
//
//     final pastOrderModel = pastOrderModelFromJson(jsonString);

import 'dart:convert';

PastOrderModel pastOrderModelFromJson(String str) =>
    PastOrderModel.fromJson(json.decode(str));

String pastOrderModelToJson(PastOrderModel data) => json.encode(data.toJson());

class PastOrderModel {
  bool success;
  Data data;
  List<Response> response;

  PastOrderModel({
    required this.success,
    required this.data,
    required this.response,
  });

  factory PastOrderModel.fromJson(Map<String, dynamic> json) => PastOrderModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        response: List<Response>.from(
            json["response"].map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class Data {
  DateTime createdAt;
  String currencySymbol;

  Data({
    required this.createdAt,
    required this.currencySymbol,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        createdAt: DateTime.parse(json["created_at"]),
        currencySymbol: json["currency_symbol"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "currency_symbol": currencySymbol,
      };
}

class Response {
  String id;
  String name;
  String price;
  String quantity;
  String userId;
  String size;
  String color;
  String logo;
  String productImage;
  String productUrl;
  String shippingPrice;
  String module;
  String remover;

  Response({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.userId,
    required this.size,
    required this.color,
    required this.logo,
    required this.productImage,
    required this.productUrl,
    required this.shippingPrice,
    required this.module,
    required this.remover,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
        userId: json["user_id"],
        size: json["size"],
        color: json["color"],
        logo: json["logo"],
        productImage: json["product_image"],
        productUrl: json["product_url"],
        shippingPrice: json["shipping_price"],
        module: json["module"],
        remover: json["remover"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "quantity": quantity,
        "user_id": userId,
        "size": size,
        "color": color,
        "logo": logo,
        "product_image": productImage,
        "product_url": productUrl,
        "shipping_price": shippingPrice,
        "module": module,
        "remover": remover,
      };
}
