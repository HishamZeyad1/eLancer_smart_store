import 'package:smart_store/models/Image.dart';
import 'package:smart_store/models/sub-category.dart';

class ProductDetails {
  late int id;
  late String nameEn;
  late String nameAr;
  late String infoEn;
  late String infoAr;
  late int price;
  late int quantity;
  late int overalRate;//
  late int subCategoryId;
  late int productRate;
  late int? offerPrice;//
  late bool isFavorite;
  late String imageUrl;
  late List<Image> images;
  late SubCategory subCategory;
  // ProductDetails(){}

  ProductDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    infoEn = json['info_en'];
    infoAr = json['info_ar'];
    price = json['price'];
    quantity = json['quantity'];
    overalRate = json['overal_rate'];
    subCategoryId = json['sub_category_id'];
    productRate = json['product_rate'];
    offerPrice = json['offer_price'];
    isFavorite = json['is_favorite'];
    imageUrl = json['image_url'];
    if (json['images'] != null) {
      images = <Image>[];
      json['images'].forEach((v) {
        images.add(Image.fromJson(v));
      });
    }
    subCategory =SubCategory.fromJson(json['sub_category']);
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name_en'] = this.nameEn;
  //   data['name_ar'] = this.nameAr;
  //   data['info_en'] = this.infoEn;
  //   data['info_ar'] = this.infoAr;
  //   data['price'] = this.price;
  //   data['quantity'] = this.quantity;
  //   data['overal_rate'] = this.overalRate;
  //   data['sub_category_id'] = this.subCategoryId;
  //   data['product_rate'] = this.productRate;
  //   data['offer_price'] = this.offerPrice;
  //   data['is_favorite'] = this.isFavorite;
  //   data['image_url'] = this.imageUrl;
  //   if (this.images != null) {
  //     data['images'] = this.images.map((v) => v.toJson()).toList();
  //   }
  //   if (this.subCategory != null) {
  //     data['sub_category'] = this.subCategory.toJson();
  //   }
  //   return data;
  // }
}
