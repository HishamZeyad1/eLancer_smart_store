class Product {
 late int id;
 late String nameEn;
 late String nameAr;
 late String infoEn;
 late String infoAr;
 late int price;
 late int quantity;
 late double overalRate;
 late int subCategoryId;
 late double productRate;
 double? offerPrice;
 late bool isFavorite;
 late String imageUrl;

 // Product();

  // Product(
  //     {required this.id,
  //      required  this.nameEn,
  //      required  this.nameAr,
  //      required  this.infoEn,
  //      required  this.infoAr,
  //      required  this.price,
  //      required  this.quantity,
  //      required  this.overalRate,
  //      required  this.subCategoryId,
  //      required  this.productRate,
  //      required  this.offerPrice,
  //      required  this.isFavorite,
  //      required  this.imageUrl});

 Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    infoEn = json['info_en'];
    infoAr = json['info_ar'];
    price = json['price'];
    quantity = json['quantity'];
    overalRate = json['overal_rate']+0.0;
    subCategoryId = json['sub_category_id'];
    productRate = json['product_rate']+0.0;
    offerPrice = json['offer_price'];
    isFavorite = json['is_favorite'];
    imageUrl = json['image_url'];
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
  //   return data;
  // }
}