import 'package:smart_store/models/category.dart';
import 'package:smart_store/models/product.dart';
import 'package:smart_store/models/slider.dart';



class Home {
  late List<Sliders> sliders=<Sliders>[];
  late List<Category> categories=<Category>[];
  late List<Product> latestProducts=<Product>[];
  late List<Product> famousProducts=<Product>[];


  Home();
    // sliders=<Slider>[];
    // categories=<Category>[];
    // latestProducts=<Product>[];
    // famousProducts=<Product>[];

  Home.fromJson(Map<String, dynamic> json) {
    if (json['slider'] != null) {
      sliders = <Sliders>[];
      json['slider'].forEach((v) {
        sliders.add(Sliders.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Category>[];
      json['categories'].forEach((v) {
        categories.add(Category.fromJson(v));
      });
    }
    if (json['latest_products'] != null) {
      latestProducts = <Product>[];
      json['latest_products'].forEach((v) {
        latestProducts.add(Product.fromJson(v));
      });
    }
    if (json['famous_products'] != null) {
      famousProducts = <Product>[];
      json['famous_products'].forEach((v) {
        famousProducts.add(Product.fromJson(v));
      });
    }
  }
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.slider != null) {
  //     data['slider'] = this.slider.map((v) => v.toJson()).toList();
  //   }
  //   if (this.categories != null) {
  //     data['categories'] = this.categories.map((v) => v.toJson()).toList();
  //   }
  //   if (this.latestProducts != null) {
  //     data['latest_products'] =
  //         this.latestProducts.map((v) => v.toJson()).toList();
  //   }
  //   if (this.famousProducts != null) {
  //     data['famous_products'] =
  //         this.famousProducts.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}