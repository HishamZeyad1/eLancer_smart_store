import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_store/api/controllers/favorite_api_controller.dart';
import 'package:smart_store/api/controllers/rate_api_controller.dart';
import 'package:smart_store/get/product_getx_controller.dart';
import 'package:smart_store/get/product_getx_controller.dart';
import 'package:smart_store/models/base_api.dart';
import 'package:smart_store/models/favorite.dart';
import 'package:smart_store/models/product.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';


class FavoriteGetxController extends GetxController {
  RxList<Favorite> favorite = <Favorite>[].obs;

  RxBool loading = false.obs;
  final FavoriteApiController _favoriteApiController = FavoriteApiController();

  static FavoriteGetxController get to => Get.find<FavoriteGetxController>();

  @override
  void onInit() {
    readFavorite();//ocurences between two users
    super.onInit();
  }

  Future<void> readFavorite() async {
    loading.value = true;
    favorite.value = await _favoriteApiController.getFavorite();
    loading.value = false;

    // notifyListeners();
    // upda//CRUD
  }
  // Future<void> readProducts() async {
  //   loading.value = true;
  //   favorite.value = await _favoriteApiController.getFavorite();
  //   loading.value = false;
  //   // notifyListeners();
  //   // upda//CRUD
  // }


  // Future<bool> RateProduct(int productId,double rate) async {
  //   BaseApi? newRowId = await RateApiController().RateProduct(productId, rate);
  //   if(newRowId!=null && newRowId!.status==true){
  //     Favorite f=favorite.firstWhere((p0) => p0.product.id==productId);
  //     f.product.productRate+=rate;
  //     f.product.overalRate+=rate;
  //     return true;
  //   }
  //   return false;
  // }

  // Future<bool> deleteFavorite(Product product) async {
  //   // int type=product.isFavorite==true?1:2;//before change
  //
  //   BaseApi? newRowId = await _favoriteApiController.favoriteProduct(product);
  //
  //   if (newRowId !=null) {
  //     print("=================Favorite================");
  //     Favorite favorite1 = Favorite();
  //     favorite1.product = product;
  //     favorite1.pivot =Pivot(userId: SharedPrefController().id, productId: product.id);
  //     product.isFavorite==false?favorite.add(favorite1):favorite.removeWhere((element) => favorite1.product.id==product.id);
  //     product.isFavorite==false?product.isFavorite=true:product.isFavorite=false;
  //     return true;
  //   }
  //   //   if (newRowId = true) {
  //   //     Favorite favorite1 = Favorite();
  //   //     favorite1.product = product;
  //   //     favorite1.pivot =
  //   //         Pivot(userId: SharedPrefController().id, productId: product.id);
  //   //     product.isFavorite ? favorite.add(favorite1) : favorite.map((element) {
  //   //       // if
  //   //       // (element.product.id==product.id)
  //   //       //   // favorite.product.remove(favorite.id))
  //   //       //   // favorite.removeWhere((element) => false)
  //   //       //   for(int i in favorite.value) {
  //   //       //     favorite.removeAt(i);
  //   //       //   }
  //   //     }
  //   //     }
  //   //   // favorite.map((p0){if(p0.product.id==id){favorite.add(p0);}});
  //   //   return
  //   //   true;
  //   // }
  //   // if (newRowId != 0) {
  //   //   contact.id = newRowId;
  //   //   contacts.add(contact);
  //   //   // notifyListeners();
  //   //   // update();
  //   // }
  //   return false;
  // }

  Future<BaseApi?> ChangeFavorite(Product product) async {
    // int type=product.isFavorite==true?1:2;//before change

    BaseApi? newRowId = await _favoriteApiController.favoriteProduct(product);
    if (newRowId !=null) {
      print("=================Favorite================");
          Favorite favorite1 = Favorite();
          favorite1.product = product;
          favorite1.pivot =Pivot(userId: SharedPrefController().id, productId: product.id);
          product.isFavorite==false?favorite.add(favorite1):favorite.removeWhere((element) => element.product.id==product.id);
          product.isFavorite==false?product.isFavorite=true:product.isFavorite=false;
          // ProductGetxController.to.ChangeProductFavorite(product);

      return newRowId;
    }
  //   if (newRowId = true) {
  //     Favorite favorite1 = Favorite();
  //     favorite1.product = product;
  //     favorite1.pivot =
  //         Pivot(userId: SharedPrefController().id, productId: product.id);
  //     product.isFavorite ? favorite.add(favorite1) : favorite.map((element) {
  //       // if
  //       // (element.product.id==product.id)
  //       //   // favorite.product.remove(favorite.id))
  //       //   // favorite.removeWhere((element) => false)
  //       //   for(int i in favorite.value) {
  //       //     favorite.removeAt(i);
  //       //   }
  //     }
  //     }
  //   // favorite.map((p0){if(p0.product.id==id){favorite.add(p0);}});
  //   return
  //   true;
  // }
    // if (newRowId != 0) {
    //   contact.id = newRowId;
    //   contacts.add(contact);
    //   // notifyListeners();
    //   // update();
    // }
    return null;
  }

  bool isFavorite(Product product){
    for(Favorite i in favorite.value){
      if(i.product.id==product.id){
        return true;
      }
    }
    return false;
  }

}