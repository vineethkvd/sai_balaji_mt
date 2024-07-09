// To parse this JSON data, do
//
//     final subcategory = subcategoryFromJson(jsonString);

import 'dart:convert';

Subcategory subcategoryFromJson(String str) =>
    Subcategory.fromJson(json.decode(str));

String subcategoryToJson(Subcategory data) => json.encode(data.toJson());

class Subcategory {
  bool status;
  String msg;
  List<Datum> data;
  List<Product> products;

  Subcategory({
    required this.status,
    required this.msg,
    required this.data,
    required this.products,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
        status: json["status"],
        msg: json["msg"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Datum {
  String subCatId;
  String subCatName;
  String subCatDescription;
  DateTime subCatCreated;
  String subCatImage;

  Datum({
    required this.subCatId,
    required this.subCatName,
    required this.subCatDescription,
    required this.subCatCreated,
    required this.subCatImage,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        subCatId: json["sub_cat_id"],
        subCatName: json["sub_cat_name"],
        subCatDescription: json["sub_cat_description"],
        subCatCreated: DateTime.parse(json["sub_cat_created"]),
        subCatImage: json["sub_cat_image"],
      );

  Map<String, dynamic> toJson() => {
        "sub_cat_id": subCatId,
        "sub_cat_name": subCatName,
        "sub_cat_description": subCatDescription,
        "sub_cat_created": subCatCreated.toIso8601String(),
        "sub_cat_image": subCatImage,
      };
}

class Product {
  String proDetailsId;
  String proName;
  String proDescription;
  String proPrice;
  String proRetailPrice;
  String proWholesalePrice;
  String proImage1;
  String proImage2;
  String proImage3;
  String proImage4;
  String proImage5;
  DateTime proUpdatedDate;
  String catForId;
  String proQuantity;
  String url;
  String subcatForId;
  dynamic discountForId;
  String showPrice;

  Product({
    required this.proDetailsId,
    required this.proName,
    required this.proDescription,
    required this.proPrice,
    required this.proRetailPrice,
    required this.proWholesalePrice,
    required this.proImage1,
    required this.proImage2,
    required this.proImage3,
    required this.proImage4,
    required this.proImage5,
    required this.proUpdatedDate,
    required this.catForId,
    required this.proQuantity,
    required this.url,
    required this.subcatForId,
    this.discountForId,
    required this.showPrice,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        proDetailsId: json["pro_details_id"],
        proName: json["pro_name"],
        proDescription: json["pro_description"],
        proPrice: json["pro_price"] ?? '',
        proRetailPrice: json["pro_retail_price"],
        proWholesalePrice: json["pro_wholesale_price"],
        proImage1: json["pro_image1"],
        proImage2: json["pro_image2"],
        proImage3: json["pro_image3"],
        proImage4: json["pro_image4"],
        proImage5: json["pro_image5"],
        proUpdatedDate: DateTime.parse(json["pro_updated_date"]),
        catForId: json["cat_for_id"],
        proQuantity: json["Pro_quantity"],
        url: json["url"] ?? '',
        subcatForId: json["subcat_for_id"] ?? '',
        discountForId: json["discount_for_id"],
        showPrice: json["show_price"],
      );

  Map<String, dynamic> toJson() => {
        "pro_details_id": proDetailsId,
        "pro_name": proName,
        "pro_description": proDescription,
        "pro_price": proPrice,
        "pro_retail_price": proRetailPrice,
        "pro_wholesale_price": proWholesalePrice,
        "pro_image1": proImage1,
        "pro_image2": proImage2,
        "pro_image3": proImage3,
        "pro_image4": proImage4,
        "pro_image5": proImage5,
        "pro_updated_date": proUpdatedDate.toIso8601String(),
        "cat_for_id": catForId,
        "Pro_quantity": proQuantity,
        "url": url,
        "subcat_for_id": subcatForId,
        "discount_for_id": discountForId,
        "show_price": showPrice,
      };
}
