import 'package:smart_store/models/product.dart';

class Favorite {
  // late int id;
  // late String nameEn;
  // late String nameAr;
  // late String infoEn;
  // late String infoAr;
  // late int price;
  // late int quantity;
  // late int overalRate;
  // late int subCategoryId;
  // late int productRate;
  // double? offerPrice;
  // late bool isFavorite;
  // late String imageUrl;
  late Product product;
  late Pivot pivot;
  Favorite();
  Favorite.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    // nameEn = json['name_en'];
    // nameAr = json['name_ar'];
    // infoEn = json['info_en'];
    // infoAr = json['info_ar'];
    // price = json['price'];
    // quantity = json['quantity'];
    // overalRate = json['overal_rate'];
    // subCategoryId = json['sub_category_id'];
    // productRate = json['product_rate'];
    // offerPrice = json['offer_price'];
    // isFavorite = json['is_favorite'];
    // imageUrl = json['image_url'];
    product=Product.fromJson(json);
    pivot = Pivot.fromJson(json['pivot']);
  }
}
class Pivot {
  late int userId;
  late int productId;

  Pivot({required this.userId,required  this.productId});

  Pivot.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    productId = json['product_id'];
  }
}