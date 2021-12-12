import 'package:smart_store/screens/Auth/change_password.dart';

class ApiSettings {
static const Store_API_Key="e72e2aaf-df61-485a-aac6-f2e0ecbd3335";

static const _baseUrl = "https://smart-store.mr-dev.tech/";
static const _apiUrl = _baseUrl + "api/";
static const register = _apiUrl + 'auth/register';

static const activate = _apiUrl + 'auth/activate';
static const login = _apiUrl + 'auth/login';
static const cities = _apiUrl + 'cities';


static const logout = _apiUrl + 'auth/logout';
static const forgetPassword = _apiUrl + 'auth/forget-password';
static const resetPassword = _apiUrl + 'auth/reset-password';

static const home = _apiUrl + 'home';
static const categories = _apiUrl + 'categories';
static const subCategories = _apiUrl + 'categories/';
static const products = _apiUrl + 'sub-categories/';
static const productDetails = _apiUrl + 'products/';


static const favorite = _apiUrl + 'favorite-products';
static const rating = _apiUrl + 'products/rate';

static const changePassword = _apiUrl + 'auth/change-password';
static const changeProfile = _apiUrl + 'auth/update-profile';

static const faqs = _apiUrl + 'faqs';
static const contact = _apiUrl + 'contact-requests';

}
