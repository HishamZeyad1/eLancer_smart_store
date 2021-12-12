import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_store/models/user.dart';

enum PrefKeys {id, loggedIn, fullName,email, gender,cityId,token,language}

class SharedPrefController {
  static final SharedPrefController _instance = SharedPrefController._();

  SharedPrefController._();

  late SharedPreferences _sharedPreferences;

  factory SharedPrefController() {
    return _instance;
  }

  Future<void> initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> save({required User user}) async {
    await _sharedPreferences.setInt(PrefKeys.id.toString(), user.id);
    await _sharedPreferences.setBool(PrefKeys.loggedIn.toString(), true);
    await _sharedPreferences.setString(
        PrefKeys.fullName.toString(), user.name);
    await _sharedPreferences.setString(
        PrefKeys.email.toString(), user.mobile.toString());
    await _sharedPreferences.setString(
        PrefKeys.gender.toString(), user.gender);
    await _sharedPreferences.setInt(
        PrefKeys.cityId.toString(), user.city!.id);
    await _sharedPreferences.setString(
        PrefKeys.token.toString(), 'Bearer ' + user.token);
  }
  Future<void> changeLanguage(String lang) async {
    await _sharedPreferences.setString(
        PrefKeys.language.toString(), lang);
    print("==============_sharedPreferences=====================");
    print("lang:${SharedPrefController().language}");

  }

    Future<void> changeProfile({required String name,required String gender,required int cityId}) async {
    await _sharedPreferences.setString(
        PrefKeys.fullName.toString(), name);
    await _sharedPreferences.setString(
        PrefKeys.gender.toString(),gender);
    await _sharedPreferences.setInt(
        PrefKeys.cityId.toString(),cityId);
  }

  bool get loggedIn =>
      _sharedPreferences.getBool(PrefKeys.loggedIn.toString()) ?? false;
  String get fullName =>
      _sharedPreferences.getString(PrefKeys.fullName.toString()) ?? '';
  int get id =>
      _sharedPreferences.getInt(PrefKeys.id.toString()) ??0;
  String get gender =>
      _sharedPreferences.getString(PrefKeys.gender.toString()) ??"M";
  int get cityId =>
      _sharedPreferences.getInt(PrefKeys.cityId.toString()) ?? 0;
  String get token =>
      _sharedPreferences.getString(PrefKeys.token.toString()) ?? '';
  String get language =>
      _sharedPreferences.getString(PrefKeys.language.toString()) ?? 'ar';
  Future<void> clear() async {
    // return await _sharedPreferences.clear();
    await _sharedPreferences.remove(PrefKeys.loggedIn.toString());
    await _sharedPreferences.remove(PrefKeys.fullName.toString());
    await _sharedPreferences.remove(PrefKeys.id.toString());
    await _sharedPreferences.remove(PrefKeys.gender.toString());
    await _sharedPreferences.remove(PrefKeys.cityId.toString());
    await _sharedPreferences.remove(PrefKeys.token.toString());
    await _sharedPreferences.remove(PrefKeys.gender.toString());
  }
}
