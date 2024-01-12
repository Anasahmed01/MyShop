// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  bool success;
  Data data;
  List<Response> response;

  CartModel({
    required this.success,
    required this.data,
    required this.response,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
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
  String currencySymbol;
  String couponPrice;
  String serviceFee;
  String shippingPrice;
  String yugoProductPrice;
  String totalPrice;

  Data({
    required this.currencySymbol,
    required this.couponPrice,
    required this.serviceFee,
    required this.shippingPrice,
    required this.yugoProductPrice,
    required this.totalPrice,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currencySymbol: json["currency_symbol"],
        couponPrice: json["coupon_price"],
        serviceFee: json["service_fee"],
        shippingPrice: json["shipping_price"],
        yugoProductPrice: json["yugo_product_price"],
        totalPrice: json["total_price"],
      );

  Map<String, dynamic> toJson() => {
        "currency_symbol": currencySymbol,
        "coupon_price": couponPrice,
        "service_fee": serviceFee,
        "shipping_price": shippingPrice,
        "yugo_product_price": yugoProductPrice,
        "total_price": totalPrice,
      };
}

class Response {
  String id;
  String name;
  String price;
  int quantity;
  Attributes attributes;
  List<dynamic> conditions;

  Response({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.attributes,
    required this.conditions,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
        attributes: Attributes.fromJson(json["attributes"]),
        conditions: List<dynamic>.from(json["conditions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "quantity": quantity,
        "attributes": attributes.toJson(),
        "conditions": List<dynamic>.from(conditions.map((x) => x)),
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
  String serviceFee;

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
    required this.serviceFee,
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
        serviceFee: json["service_fee"],
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
        "service_fee": serviceFee,
      };
}
