// To parse this JSON data, do
//
//     final productDetailModel = productDetailModelFromJson(jsonString);

import 'dart:convert';

ProductDetailModel productDetailModelFromJson(String str) =>
    ProductDetailModel.fromJson(json.decode(str));

String productDetailModelToJson(ProductDetailModel data) =>
    json.encode(data.toJson());

class ProductDetailModel {
  bool success;
  Response response;

  ProductDetailModel({
    required this.success,
    required this.response,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailModel(
        success: json["success"],
        response: Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "response": response.toJson(),
      };
}

class Response {
  String productId;
  String url;
  String heading;
  String price;
  String productImagesArray;
  String logo;
  List<String> sizesArray;
  List<dynamic> sizePriceListArray;
  List<dynamic> categoriesArray;
  String productColor;
  List<dynamic> color;
  List<dynamic> colorNames;
  List<dynamic> colorPriceListArray;
  List<String> colorUrl;
  List<String> colorImages;
  String brand;
  String rating;
  String shippingPrice;
  String totalPrice;
  String remover;
  DateTime createdAt;
  String currencySymbol;

  Response({
    required this.productId,
    required this.url,
    required this.heading,
    required this.price,
    required this.productImagesArray,
    required this.logo,
    required this.sizesArray,
    required this.sizePriceListArray,
    required this.categoriesArray,
    required this.productColor,
    required this.color,
    required this.colorNames,
    required this.colorPriceListArray,
    required this.colorUrl,
    required this.colorImages,
    required this.brand,
    required this.rating,
    required this.shippingPrice,
    required this.totalPrice,
    required this.remover,
    required this.createdAt,
    required this.currencySymbol,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        productId: json["product_id"],
        url: json["url"],
        heading: json["heading"],
        price: json["price"],
        productImagesArray: json["productImagesArray"],
        logo: json["logo"],
        sizesArray: List<String>.from(json["sizesArray"].map((x) => x)),
        sizePriceListArray:
            List<dynamic>.from(json["size_price_list_array"].map((x) => x)),
        categoriesArray:
            List<dynamic>.from(json["categoriesArray"].map((x) => x)),
        productColor: json["productColor"],
        color: List<dynamic>.from(json["color"].map((x) => x)),
        colorNames: List<dynamic>.from(json["color_names"].map((x) => x)),
        colorPriceListArray:
            List<dynamic>.from(json["color_price_list_array"].map((x) => x)),
        colorUrl: List<String>.from(json["colorUrl"].map((x) => x)),
        colorImages: List<String>.from(json["colorImages"].map((x) => x)),
        brand: json["brand"],
        rating: json["rating"],
        shippingPrice: json["shipping_price"],
        totalPrice: json["total_price"],
        remover: json["remover"],
        createdAt: DateTime.parse(json["created_at"]),
        currencySymbol: json["currency_symbol"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "url": url,
        "heading": heading,
        "price": price,
        "productImagesArray": productImagesArray,
        "logo": logo,
        "sizesArray": List<dynamic>.from(sizesArray.map((x) => x)),
        "size_price_list_array":
            List<dynamic>.from(sizePriceListArray.map((x) => x)),
        "categoriesArray": List<dynamic>.from(categoriesArray.map((x) => x)),
        "productColor": productColor,
        "color": List<dynamic>.from(color.map((x) => x)),
        "color_names": List<dynamic>.from(colorNames.map((x) => x)),
        "color_price_list_array":
            List<dynamic>.from(colorPriceListArray.map((x) => x)),
        "colorUrl": List<dynamic>.from(colorUrl.map((x) => x)),
        "colorImages": List<dynamic>.from(colorImages.map((x) => x)),
        "brand": brand,
        "rating": rating,
        "shipping_price": shippingPrice,
        "total_price": totalPrice,
        "remover": remover,
        "created_at": createdAt.toIso8601String(),
        "currency_symbol": currencySymbol,
      };
}
