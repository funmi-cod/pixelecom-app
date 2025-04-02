// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  List<Product>? products;

  ProductModel({this.products});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    products:
        json["products"] == null
            ? []
            : List<Product>.from(
              json["products"]!.map((x) => Product.fromJson(x)),
            ),
  );

  Map<String, dynamic> toJson() => {
    "products":
        products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
  };
}

class Product {
  int? id;
  String? name;
  String? description;
  int? productSold;
  int? totalProduct;
  String? country;
  String? type;
  String? ageStatement;
  String? bottled;
  String? caskNumber;
  String? abv;
  String? size;
  bool? finish;

  Product({
    this.id,
    this.name,
    this.description,
    this.productSold,
    this.totalProduct,
    this.country,
    this.type,
    this.ageStatement,
    this.bottled,
    this.caskNumber,
    this.abv,
    this.size,
    this.finish,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    productSold: json["productSold"],
    totalProduct: json["totalProduct"],
    country: json["country"],
    type: json["type"],
    ageStatement: json["ageStatement"],
    bottled: json["Bottled"],
    caskNumber: json["caskNumber"],
    abv: json["abv"],
    size: json["size"],
    finish: json["finish"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "productSold": productSold,
    "totalProduct": totalProduct,
    "country": country,
    "type": type,
    "ageStatement": ageStatement,
    "Bottled": bottled,
    "caskNumber": caskNumber,
    "abv": abv,
    "size": size,
    "finish": finish,
  };
}
