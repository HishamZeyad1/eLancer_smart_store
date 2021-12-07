class SubCategory {
  late int id;
  late String nameEn;
  late String nameAr;
  late int categoryId;
  late String image;
  int? productsCount;
  late String imageUrl;


  SubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    categoryId = json['category_id'];
    image = json['image'];
    productsCount = json['products_count'];
    imageUrl = json['image_url'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name_en'] = this.nameEn;
  //   data['name_ar'] = this.nameAr;
  //   data['category_id'] = this.categoryId;
  //   data['image'] = this.image;
  //   data['products_count'] = this.productsCount;
  //   data['image_url'] = this.imageUrl;
  //   return data;
  // }
}
