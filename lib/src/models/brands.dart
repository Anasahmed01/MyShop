// To parse this JSON data, do
//
//     final allBrandsModel = allBrandsModelFromJson(jsonString);

import 'dart:convert';

AllBrandsModel allBrandsModelFromJson(String str) =>
    AllBrandsModel.fromJson(json.decode(str));

String allBrandsModelToJson(AllBrandsModel data) => json.encode(data.toJson());

class AllBrandsModel {
  bool status;
  StorySlider storySlider;
  Categories categories;
  List<Response> response;

  AllBrandsModel({
    required this.status,
    required this.storySlider,
    required this.categories,
    required this.response,
  });

  factory AllBrandsModel.fromJson(Map<String, dynamic> json) => AllBrandsModel(
        status: json["status"],
        storySlider: StorySlider.fromJson(json["story_slider"]),
        categories: Categories.fromJson(json["categories"]),
        response: List<Response>.from(
            json["response"].map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "story_slider": storySlider.toJson(),
        "categories": categories.toJson(),
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
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
  String remover;
  List<String> siteExistCategories;

  Response({
    required this.siteImage,
    required this.siteUrl,
    required this.remover,
    required this.siteExistCategories,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        siteImage: json["site_image"],
        siteUrl: json["site_url"],
        remover: json["remover"],
        siteExistCategories:
            List<String>.from(json["site_exist_categories"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "site_image": siteImage,
        "site_url": siteUrl,
        "remover": remover,
        "site_exist_categories":
            List<dynamic>.from(siteExistCategories.map((x) => x)),
      };
}

class StorySlider {
  List<HomeSlider> homeSliders;
  List<AllStory> allStories;

  StorySlider({
    required this.homeSliders,
    required this.allStories,
  });

  factory StorySlider.fromJson(Map<String, dynamic> json) => StorySlider(
        homeSliders: List<HomeSlider>.from(
            json["home_sliders"].map((x) => HomeSlider.fromJson(x))),
        allStories: List<AllStory>.from(
            json["all_stories"].map((x) => AllStory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "home_sliders": List<dynamic>.from(homeSliders.map((x) => x.toJson())),
        "all_stories": List<dynamic>.from(allStories.map((x) => x.toJson())),
      };
}

class AllStory {
  String thumbnailImage;
  String videoLink;

  AllStory({
    required this.thumbnailImage,
    required this.videoLink,
  });

  factory AllStory.fromJson(Map<String, dynamic> json) => AllStory(
        thumbnailImage: json["thumbnail_image"],
        videoLink: json["video_link"],
      );

  Map<String, dynamic> toJson() => {
        "thumbnail_image": thumbnailImage,
        "video_link": videoLink,
      };
}

class HomeSlider {
  int id;
  String homeSliderImage;
  DateTime createdAt;
  DateTime updatedAt;

  HomeSlider({
    required this.id,
    required this.homeSliderImage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory HomeSlider.fromJson(Map<String, dynamic> json) => HomeSlider(
        id: json["id"],
        homeSliderImage: json["home_slider_image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "home_slider_image": homeSliderImage,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
