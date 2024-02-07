// To parse this JSON data, do
//
//     final walletTransactionModel = walletTransactionModelFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

WalletTransactionModel walletTransactionModelFromJson(String str) =>
    WalletTransactionModel.fromJson(json.decode(str));

String walletTransactionModelToJson(WalletTransactionModel data) =>
    json.encode(data.toJson());

class WalletTransactionModel {
  bool success;
  String message;
  String balance;
  List<Response> response;

  WalletTransactionModel({
    required this.success,
    required this.message,
    required this.balance,
    required this.response,
  });

  factory WalletTransactionModel.fromJson(Map<String, dynamic> json) =>
      WalletTransactionModel(
        success: json["success"],
        message: json["message"],
        balance: json["balance"],
        response: List<Response>.from(
            json["response"].map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "balance": balance,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class Response {
  String amount;
  Type type;
  Currency currency;
  DateTime createdAt;

  Response({
    required this.amount,
    required this.type,
    required this.currency,
    required this.createdAt,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        amount: json["amount"],
        type: typeValues.map[json["type"]]!,
        currency: currencyValues.map[json["currency"]]!,
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "type": typeValues.reverse[type],
        "currency": currencyValues.reverse[currency],
        "created_at": createdAt.toIso8601String(),
      };
}

enum Currency { USD }

final currencyValues = EnumValues({"USD": Currency.USD});

enum Type { DEPOSIT, PURCHASE, WITHDRAW }

final typeValues = EnumValues({
  "Deposit": Type.DEPOSIT,
  "Purchase": Type.PURCHASE,
  "Withdraw": Type.WITHDRAW
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
