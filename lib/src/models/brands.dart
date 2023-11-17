// To parse this JSON data, do
//
//     final allBrandsModel = allBrandsModelFromJson(jsonString);

import 'dart:convert';

AllBrandsModel allBrandsModelFromJson(String str) =>
    AllBrandsModel.fromJson(json.decode(str));

String allBrandsModelToJson(AllBrandsModel data) => json.encode(data.toJson());

class AllBrandsModel {
  bool status;
  Categories categories;
  List<Response> response;

  AllBrandsModel({
    required this.status,
    required this.categories,
    required this.response,
  });

  factory AllBrandsModel.fromJson(Map<String, dynamic> json) => AllBrandsModel(
        status: json["Status"],
        categories: Categories.fromJson(json["categories"]),
        response: List<Response>.from(
            json["Response"].map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "categories": categories.toJson(),
        "Response": List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class Categories {
  List<String> categoryNames;
  List<String> categoryImages;

  Categories({
    required this.categoryNames,
    required this.categoryImages,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        categoryNames: List<String>.from(json["category_names"].map((x) => x)),
        categoryImages:
            List<String>.from(json["category_images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "category_names": List<dynamic>.from(categoryNames.map((x) => x)),
        "category_images": List<dynamic>.from(categoryImages.map((x) => x)),
      };
}

class Response {
  String siteImage;
  String siteUrl;
  List<String> siteExistCategories;

  Response({
    required this.siteImage,
    required this.siteUrl,
    required this.siteExistCategories,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        siteImage: json["site_image"],
        siteUrl: json["site_url"],
        siteExistCategories:
            List<String>.from(json["site_exist_categories"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "site_image": siteImage,
        "site_url": siteUrl,
        "site_exist_categories":
            List<dynamic>.from(siteExistCategories.map((x) => x)),
      };
}
