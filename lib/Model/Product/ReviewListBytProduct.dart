// To parse this JSON data, do
//
//     final getReviewsByProduct = getReviewsByProductFromJson(jsonString);

import 'dart:convert';

GetReviewsByProduct getReviewsByProductFromJson(String str) => GetReviewsByProduct.fromJson(json.decode(str));

String getReviewsByProductToJson(GetReviewsByProduct data) => json.encode(data.toJson());

class GetReviewsByProduct {
  GetReviewsByProduct({
    required this.msg,
    required this.data,
  });

  String msg;
  List<Datum> data;

  factory GetReviewsByProduct.fromJson(Map<String, dynamic> json) => GetReviewsByProduct(
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
    required this.description,
    required this.email,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
    required this.profile,
  });

  int id;
  String description;
  String email;
  int productId;
  DateTime createdAt;
  DateTime updatedAt;
  Profile profile;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    description: json["description"],
    email: json["email"],
    productId: json["product_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    profile: Profile.fromJson(json["profile"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description,
    "email": email,
    "product_id": productId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "profile": profile.toJson(),
  };
}

class Profile {
  Profile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.mobile,
    required this.city,
    required this.shippingAddress,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String firstName;
  String lastName;
  String mobile;
  String city;
  String shippingAddress;
  String email;
  DateTime createdAt;
  DateTime updatedAt;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    mobile: json["mobile"],
    city: json["city"],
    shippingAddress: json["shippingAddress"],
    email: json["email"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "mobile": mobile,
    "city": city,
    "shippingAddress": shippingAddress,
    "email": email,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
