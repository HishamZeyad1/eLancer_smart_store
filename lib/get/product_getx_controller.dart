
import 'package:get/get.dart';
import 'package:smart_store/api/controllers/category_api_controller.dart';
import 'package:smart_store/api/controllers/favorite_api_controller.dart';
import 'package:smart_store/models/base_api.dart';
import 'package:smart_store/models/favorite.dart';
import 'package:smart_store/models/product.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';

class ProductGetxController extends GetxController {


  RxInt id=0.obs;
  RxList<Product> products = <Product>[].obs;
  RxBool loading = false.obs;
  // RxList<Favorite> favorite = <Favorite>[].obs;
  static ProductGetxController get to => Get.find<ProductGetxController>();

  final CategoryApiController _categoryApiController = CategoryApiController();
  // final FavoriteApiController _favoriteApiController = FavoriteApiController();

  // ProductGetxController();


  @override
  void onInit() {
    // readProduct(this.id.value);
    super.onInit();
  }
  // Future<void> readFavorite() async {
  //   loading.value = true;
  //   favorite.value = await _favoriteApiController.getFavorite();
  //   loading.value = false;
  //   // notifyListeners();
  //   // upda//CRUD
  // }

  Future<void> readProduct(int id) async {
    this.id.value=id;
    loading.value = true;
    products.value = await _categoryApiController.products(this.id.toString());
    loading.value = false;
    update();
  }
  void ChangeId(int id){
    this.id.value=id;
  }
  // void ChangeProductFavorite(Product product)async{
  //   // int type=product.isFavorite==true?1:2;//before change
  //   // BaseApi? newRowId = await _favoriteApiController.favoriteProduct(product);
  //   // Future.delayed(Duration(seconds: 1),()async{
  //     print("===============ChangeProductFavorite==============");
  //     // await readProduct(/*this.id*/);
  //     // Product pr=products.value.firstWhere((element) => element.id==product.id);
  //     // print("product:${pr.id}");
  //     // pr.isFavorite=!product.isFavorite;
  //     // print(pr.isFavorite);
  //     print("before favorite:${product.isFavorite}");
  //     // readProduct(this.id.value);
  //     int index=products.indexWhere((element) => element.id==product.id);
  //     // product.isFavorite==false?product.isFavorite=true:product.isFavorite=false;
  //
  //     products.value[index].isFavorite=!product.isFavorite;
  //     // products.map((element) => print(element.nameEn));
  //     print("length of products: "+products.length.toString());
  //     // print(index);
  //     print("after favorite:${products.value[index].isFavorite}");
  //
  //     // print(products.value[index].isFavorite);
  //     // print(!product.isFavorite);
  //   // });
  //
  //   // if (newRowId !=null) {
  //   //   print("=================Favorite================");
  //   //   Favorite favorite1 = Favorite();
  //   //   favorite1.product = product;
  //   //   favorite1.pivot =Pivot(userId: SharedPrefController().id, productId: product.id);
  //   //   product.isFavorite==false?favorite.add(favorite1):favorite.removeWhere((element) => favorite1.product.id==product.id);
  //   //   product.isFavorite==false?product.isFavorite=true:product.isFavorite=false;
  //   //   return newRowId;
  //   // }
  //   // //   if (newRowId = true) {
  //   // //     Favorite favorite1 = Favorite();
  //   // //     favorite1.product = product;
  //   // //     favorite1.pivot =
  //   // //         Pivot(userId: SharedPrefController().id, productId: product.id);
  //   // //     product.isFavorite ? favorite.add(favorite1) : favorite.map((element) {
  //   // //       // if
  //   // //       // (element.product.id==product.id)
  //   // //       //   // favorite.product.remove(favorite.id))
  //   // //       //   // favorite.removeWhere((element) => false)
  //   // //       //   for(int i in favorite.value) {
  //   // //       //     favorite.removeAt(i);
  //   // //       //   }
  //   // //     }
  //   // //     }
  //   // //   // favorite.map((p0){if(p0.product.id==id){favorite.add(p0);}});
  //   // //   return
  //   // //   true;
  //   // // }
  //   // // if (newRowId != 0) {
  //   // //   contact.id = newRowId;
  //   // //   contacts.add(contact);
  //   // //   // notifyListeners();
  //   // //   // update();
  //   // // }
  //   // return null;
  // }
  void ChangeProductFavorite(Product product)async{
    print("===================print products===========================");
    print(products.value.length);
    print("================before=============");
    printData();
    for(Product i in products.value){
      if(i.id==product.id){
        // products.value.remove(i);
        i.isFavorite=product.isFavorite;
        // products.value.add(i);
      }
      print("================after============");
      printData();
    }
    // print(product.isFavorite);
    // print("===================print products===========================");
  }
   bool rateProduct(Product product){
    products.value.firstWhere((element) => element.id==product.id).productRate=product.productRate;
    products.value.firstWhere((element) => element.id==product.id).overalRate=product.overalRate;
    return true;
    //
    // loading.value = true;
    // products.value = await _categoryApiController.products(id);
    // loading.value = false;
    // notifyListeners();
    // upda//CRUD
  }
    void printData(){
      for(Product i in products.value){
          print(i.id);
          print(i.isFavorite);
      }
    }
}
