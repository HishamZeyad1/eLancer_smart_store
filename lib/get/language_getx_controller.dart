import 'package:get/get.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';

class LanguageGetxController extends GetxController{
   // RxString language=SharedPrefController().language.obs;
   RxString language = 'en'.obs;

   static LanguageGetxController get to => Get.find<LanguageGetxController>();


  @override
  void onInit() {
    // language.value=SharedPrefController().language;
    language.value = SharedPrefController().language;
    super.onInit();
  }

   void changeLanguage() {
     language.value = language.value == 'en' ? 'ar' : 'en';
     SharedPrefController().changeLanguage(language.value);
     print("==============LanguageGetxController=====================");
     print("lang:${LanguageGetxController.to.language}");
   }
}