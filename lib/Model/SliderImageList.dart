// To parse this JSON data, do
//
//     final sliderImageList = sliderImageListFromJson(jsonString);

import 'dart:convert';

SliderImageList sliderImageListFromJson(String str) => SliderImageList.fromJson(json.decode(str));

String sliderImageListToJson(SliderImageList data) => json.encode(data.toJson());

class SliderImageList {
  SliderImageList({
    required this.msg,
    required this.data,
  });

  String msg;
  List<Datum> data;

  factory SliderImageList.fromJson(Map<String, dynamic> json) => SliderImageList(
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
    required this.title,
    required this.shortDes,
    required this.image,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String title;
  String shortDes;
  String image;
  int productId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    shortDes: json["short_des"],
    image: json["image"],
    productId: json["product_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "short_des": shortDes,
    "image": image,
    "product_id": productId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
