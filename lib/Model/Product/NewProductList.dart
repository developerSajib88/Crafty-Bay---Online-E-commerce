// To parse this JSON data, do
//
//     final newProductList = newProductListFromJson(jsonString);

import 'dart:convert';

NewProductList newProductListFromJson(String str) => NewProductList.fromJson(json.decode(str));

String newProductListToJson(NewProductList data) => json.encode(data.toJson());

class NewProductList {
  NewProductList({
    required this.msg,
    required this.data,
  });

  String msg;
  List<Datum> data;

  factory NewProductList.fromJson(Map<String, dynamic> json) => NewProductList(
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
    required this.price,
    required this.discount,
    required this.discountPrice,
    required this.image,
    required this.stock,
    required this.star,
    required this.remark,
    required this.categoryId,
    required this.brandId,
    required this.createdAt,
    required this.updatedAt,
    this.brand,
    this.category,
  });

  int id;
  String title;
  String shortDes;
  String price;
  int discount;
  String discountPrice;
  String image;
  int stock;
  double star;
  String remark;
  int categoryId;
  int brandId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic brand;
  dynamic category;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    shortDes: json["short_des"],
    price: json["price"],
    discount: json["discount"],
    discountPrice: json["discount_price"],
    image: json["image"],
    stock: json["stock"],
    star: json["star"]?.toDouble(),
    remark: json["remark"],
    categoryId: json["category_id"],
    brandId: json["brand_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    brand: json["brand"],
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "short_des": shortDes,
    "price": price,
    "discount": discount,
    "discount_price": discountPrice,
    "image": image,
    "stock": stock,
    "star": star,
    "remark": remark,
    "category_id": categoryId,
    "brand_id": brandId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "brand": brand,
    "category": category,
  };
}
