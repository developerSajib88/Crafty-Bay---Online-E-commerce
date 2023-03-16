// To parse this JSON data, do
//
//     final popularProductList = popularProductListFromJson(jsonString);

import 'dart:convert';

PopularProductList popularProductListFromJson(String str) => PopularProductList.fromJson(json.decode(str));

String popularProductListToJson(PopularProductList data) => json.encode(data.toJson());

class PopularProductList {
  PopularProductList({
    required this.msg,
    required this.data,
  });

  String msg;
  List<Datum> data;

  factory PopularProductList.fromJson(Map<String, dynamic> json) => PopularProductList(
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
  Title title;
  String shortDes;
  String price;
  int discount;
  String discountPrice;
  String image;
  int stock;
  double star;
  Remark remark;
  int categoryId;
  int brandId;
  DateTime createdAt;
  DateTime updatedAt;
  Brand? brand;
  Category? category;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: titleValues.map[json["title"]]!,
    shortDes: json["short_des"],
    price: json["price"],
    discount: json["discount"],
    discountPrice: json["discount_price"],
    image: json["image"],
    stock: json["stock"],
    star: json["star"]?.toDouble(),
    remark: remarkValues.map[json["remark"]]!,
    categoryId: json["category_id"],
    brandId: json["brand_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": titleValues.reverse[title],
    "short_des": shortDes,
    "price": price,
    "discount": discount,
    "discount_price": discountPrice,
    "image": image,
    "stock": stock,
    "star": star,
    "remark": remarkValues.reverse[remark],
    "category_id": categoryId,
    "brand_id": brandId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "brand": brand?.toJson(),
    "category": category?.toJson(),
  };
}

class Brand {
  Brand({
    required this.id,
    required this.brandName,
    required this.brandImg,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String brandName;
  String brandImg;
  DateTime createdAt;
  DateTime updatedAt;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    id: json["id"],
    brandName: json["brandName"],
    brandImg: json["brandImg"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "brandName": brandName,
    "brandImg": brandImg,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Category {
  Category({
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

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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

enum Remark { POPULAR }

final remarkValues = EnumValues({
  "popular": Remark.POPULAR
});

enum Title { NEW_YEAR_SPECIAL_SHOE }

final titleValues = EnumValues({
  "New Year Special Shoe": Title.NEW_YEAR_SPECIAL_SHOE
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
