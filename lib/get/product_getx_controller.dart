
import 'package:get/get.dart';
import 'package:smart_store/api/controllers/category_api_controller.dart';
import 'package:smart_store/api/controllers/favorite_api_controller.dart';
import 'package:smart_store/models/base_api.dart';
import 'package:smart_store/models/favorite.dart';
import 'package:smart_store/models/product.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';

class ProductGetxController extends GetxController {


  late String id;
  RxList<Product> products = <Product>[].obs;
  RxBool loading = false.obs;
  // RxList<Favorite> favorite = <Favorite>[].obs;

  final CategoryApiController _categoryApiController = CategoryApiController();
  // final FavoriteApiController _favoriteApiController = FavoriteApiController();

  ProductGetxController(this.id);


  @override
  void onInit() {
    readProduct(this.id);
    super.onInit();
  }
  // Future<void> readFavorite() async {
  //   loading.value = true;
  //   favorite.value = await _favoriteApiController.getFavorite();
  //   loading.value = false;
  //   // notifyListeners();
  //   // upda//CRUD
  // }

  Future<void> readProduct(String id) async {
    loading.value = true;
    products.value = await _categoryApiController.products(id);
    loading.value = false;
    // notifyListeners();
    // upda//CRUD
  }
  Future<void> ChangeProductFavorite(Product product)async{
    // int type=product.isFavorite==true?1:2;//before change
    // BaseApi? newRowId = await _favoriteApiController.favoriteProduct(product);
    Future.delayed(Duration(seconds: 1),()async{
      await readProduct(this.id);
      products.value.firstWhere((element) => element.id==product.id).isFavorite=!product.isFavorite;
    });

    // if (newRowId !=null) {
    //   print("=================Favorite================");
    //   Favorite favorite1 = Favorite();
    //   favorite1.product = product;
    //   favorite1.pivot =Pivot(userId: SharedPrefController().id, productId: product.id);
    //   product.isFavorite==false?favorite.add(favorite1):favorite.removeWhere((element) => favorite1.product.id==product.id);
    //   product.isFavorite==false?product.isFavorite=true:product.isFavorite=false;
    //   return newRowId;
    // }
    // //   if (newRowId = true) {
    // //     Favorite favorite1 = Favorite();
    // //     favorite1.product = product;
    // //     favorite1.pivot =
    // //         Pivot(userId: SharedPrefController().id, productId: product.id);
    // //     product.isFavorite ? favorite.add(favorite1) : favorite.map((element) {
    // //       // if
    // //       // (element.product.id==product.id)
    // //       //   // favorite.product.remove(favorite.id))
    // //       //   // favorite.removeWhere((element) => false)
    // //       //   for(int i in favorite.value) {
    // //       //     favorite.removeAt(i);
    // //       //   }
    // //     }
    // //     }
    // //   // favorite.map((p0){if(p0.product.id==id){favorite.add(p0);}});
    // //   return
    // //   true;
    // // }
    // // if (newRowId != 0) {
    // //   contact.id = newRowId;
    // //   contacts.add(contact);
    // //   // notifyListeners();
    // //   // update();
    // // }
    // return null;
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
}
