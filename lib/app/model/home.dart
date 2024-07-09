// To parse this JSON data, do
//
//     final home = homeFromJson(jsonString);

import 'dart:convert';

Home homeFromJson(String str) => Home.fromJson(json.decode(str));

String homeToJson(Home data) => json.encode(data.toJson());

class Home {
    bool status;
    String msg;
    List<Datum> data;

    Home({
        required this.status,
        required this.msg,
        required this.data,
    });

    factory Home.fromJson(Map<String, dynamic> json) => Home(
        status: json["status"],
        msg: json["msg"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    List<Category> categories;
    List<Banner> banners;
    List<GetProduct> getProducts;

    Datum({
        required this.categories,
        required this.banners,
        required this.getProducts,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
        banners: List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
        getProducts: List<GetProduct>.from(json["get_products"].map((x) => GetProduct.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
        "get_products": List<dynamic>.from(getProducts.map((x) => x.toJson())),
    };
}

class Banner {
    String banId;
    String banTitle;
    String banImg;

    Banner({
        required this.banId,
        required this.banTitle,
        required this.banImg,
    });

    factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        banId: json["ban_id"],
        banTitle: json["ban_title"],
        banImg: json["ban_img"],
    );

    Map<String, dynamic> toJson() => {
        "ban_id": banId,
        "ban_title": banTitle,
        "ban_img": banImg,
    };
}

class Category {
    String catId;
    String catImg;
    String catName;
    String catDescription;
    String isMpc;
    DateTime catAddDate;
    DateTime catUpdateDate;
    String catStatus;
    String catIsdeleted;

    Category({
        required this.catId,
        required this.catImg,
        required this.catName,
        required this.catDescription,
        required this.isMpc,
        required this.catAddDate,
        required this.catUpdateDate,
        required this.catStatus,
        required this.catIsdeleted,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        catId: json["cat_id"],
        catImg: json["cat_img"],
        catName: json["cat_name"],
        catDescription: json["cat_description"],
        isMpc: json["is_mpc"],
        catAddDate: DateTime.parse(json["cat_add_date"]),
        catUpdateDate: DateTime.parse(json["cat_update_date"]),
        catStatus: json["cat_status"],
        catIsdeleted: json["cat_isdeleted"],
    );

    Map<String, dynamic> toJson() => {
        "cat_id": catId,
        "cat_img": catImg,
        "cat_name": catName,
        "cat_description": catDescription,
        "is_mpc": isMpc,
        "cat_add_date": catAddDate.toIso8601String(),
        "cat_update_date": catUpdateDate.toIso8601String(),
        "cat_status": catStatus,
        "cat_isdeleted": catIsdeleted,
    };
}

class GetProduct {
    String proDetailsId;
    String proName;
    String gtinNo;
    String hsCode;
    String proDescription;
    dynamic proPrice;
    String proRetailPrice;
    String proWholesalePrice;
    dynamic proWholeMinQry;
    String proImage1;
    String proImage2;
    String proImage3;
    String proImage4;
    String proImage5;
    DateTime proUpdatedDate;
    String catForId;
    String proQuantity;
    dynamic url;
    String subcatForId;
    dynamic discountForId;
    String showPrice;

    GetProduct({
        required this.proDetailsId,
        required this.proName,
        required this.gtinNo,
        required this.hsCode,
        required this.proDescription,
        required this.proPrice,
        required this.proRetailPrice,
        required this.proWholesalePrice,
        required this.proWholeMinQry,
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
        required this.discountForId,
        required this.showPrice,
    });

    factory GetProduct.fromJson(Map<String, dynamic> json) => GetProduct(
        proDetailsId: json["pro_details_id"],
        proName: json["pro_name"],
        gtinNo: json["gtin_no"],
        hsCode: json["hs_code"],
        proDescription: json["pro_description"],
        proPrice: json["pro_price"],
        proRetailPrice: json["pro_retail_price"],
        proWholesalePrice: json["pro_wholesale_price"],
        proWholeMinQry: json["pro_whole_min_qry"],
        proImage1: json["pro_image1"],
        proImage2: json["pro_image2"],
        proImage3: json["pro_image3"],
        proImage4: json["pro_image4"],
        proImage5: json["pro_image5"],
        proUpdatedDate: DateTime.parse(json["pro_updated_date"]),
        catForId: json["cat_for_id"],
        proQuantity: json["Pro_quantity"],
        url: json["url"],
        subcatForId: json["subcat_for_id"] ?? '',
        discountForId: json["discount_for_id"],
        showPrice: json["show_price"],
    );

    Map<String, dynamic> toJson() => {
        "pro_details_id": proDetailsId,
        "pro_name": proName,
        "gtin_no": gtinNo,
        "hs_code": hsCode,
        "pro_description": proDescription,
        "pro_price": proPrice,
        "pro_retail_price": proRetailPrice,
        "pro_wholesale_price": proWholesalePrice,
        "pro_whole_min_qry": proWholeMinQry,
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
