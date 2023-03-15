// To parse this JSON data, do
//
//     final categoryList = categoryListFromJson(jsonString);

import 'dart:convert';

CategoryList categoryListFromJson(String str) => CategoryList.fromJson(json.decode(str));

String categoryListToJson(CategoryList data) => json.encode(data.toJson());

class CategoryList {
  CategoryList({
    required this.msg,
    required this.data,
  });

  String msg;
  List<Datum> data;

  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
    msg: json["msg"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.categoryName,
    required this.categoryImg,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String categoryName;
  String categoryImg;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    categoryName: json["categoryName"],
    categoryImg: json["categoryImg"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "categoryName": categoryName,
    "categoryImg": categoryImg,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
