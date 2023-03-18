// To parse this JSON data, do
//
//     final productDetails = productDetailsFromJson(jsonString);

import 'dart:convert';

ProductDetails productDetailsFromJson(String str) => ProductDetails.fromJson(json.decode(str));

String productDetailsToJson(ProductDetails data) => json.encode(data.toJson());

class ProductDetails {
  ProductDetails({
    required this.msg,
    required this.data,
  });

  String msg;
  List<Datum> data;

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
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
    required this.img1,
    required this.img2,
    required this.img3,
    required this.img4,
    required this.des,
    required this.color,
    required this.size,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
    required this.product,
  });

  int id;
  String img1;
  String img2;
  String img3;
  String img4;
  String des;
  String color;
  String size;
  int productId;
  DateTime createdAt;
  DateTime updatedAt;
  Product product;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    img1: json["img1"],
    img2: json["img2"],
    img3: json["img3"],
    img4: json["img4"],
    des: json["des"],
    color: json["color"],
    size: json["size"],
    productId: json["product_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    product: Product.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "img1": img1,
    "img2": img2,
    "img3": img3,
    "img4": img4,
    "des": des,
    "color": color,
    "size": size,
    "product_id": productId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "product": product.toJson(),
  };
}

class Product {
  Product({
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

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
