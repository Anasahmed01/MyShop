// To parse this JSON data, do
//
//     final orderHistoryModel = orderHistoryModelFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

OrderHistoryModel orderHistoryModelFromJson(String str) =>
    OrderHistoryModel.fromJson(json.decode(str));

String orderHistoryModelToJson(OrderHistoryModel data) =>
    json.encode(data.toJson());

class OrderHistoryModel {
  bool success;
  List<Response> response;

  OrderHistoryModel({
    required this.success,
    required this.response,
  });

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) =>
      OrderHistoryModel(
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
  int orderId;
  String totalBill;
  int items;
  DateTime date;
  CurrencySymbol currencySymbol;

  Response({
    required this.orderId,
    required this.totalBill,
    required this.items,
    required this.date,
    required this.currencySymbol,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        orderId: json["order_id"],
        totalBill: json["total_bill"],
        items: json["items"],
        date: DateTime.parse(json["date"]),
        currencySymbol: currencySymbolValues.map[json["currency_symbol"]]!,
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "total_bill": totalBill,
        "items": items,
        "date": date.toIso8601String(),
        "currency_symbol": currencySymbolValues.reverse[currencySymbol],
      };
}

enum CurrencySymbol { AED, SAR, TRY }

final currencySymbolValues = EnumValues({
  "AED": CurrencySymbol.AED,
  "SAR": CurrencySymbol.SAR,
  "TRY": CurrencySymbol.TRY
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
