import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smart_store/api/controllers/auth_api_controller.dart';
import 'package:smart_store/api/controllers/home_api_controller.dart';
import 'package:smart_store/get/favorite_getx_controller.dart';
import 'package:smart_store/get/product_getx_controller.dart';
import 'package:smart_store/models/category.dart';
import 'package:smart_store/models/category_type.dart';
import 'package:smart_store/models/home.dart';
import 'package:smart_store/models/product.dart';
import 'package:smart_store/models/selected_widget.dart';
import 'package:smart_store/models/slider.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';
import 'package:smart_store/screens/Home/categories.dart';
import 'package:smart_store/screens/Home/image_slider.dart';
import 'package:smart_store/screens/category_screen.dart';
import 'package:smart_store/screens/main_index_widget/category_widget.dart';
import 'package:smart_store/screens/main_index_widget/favorite_widget.dart';
import 'package:smart_store/screens/main_index_widget/home_widget.dart';
import 'package:smart_store/screens/main_index_widget/profile_widget.dart';
import 'package:smart_store/widgets/AppListTile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<CategoryType> _categoriesType = [];
  int selectedCategory = 1;
  int _currentIndex = 0;

  List<SelectedWidget> _selectedWidget=[] ;
  late Future<Home?> _future;
  Home _homes = Home();
  List<Sliders> sliders = <Sliders>[];
  List<Category> categories = <Category>[];
  List<Product> latestProducts = <Product>[];
  List<Product> famousProducts = <Product>[];

  void addCategories() {
    _categoriesType.add(CategoryType(id: 1, name: "Women"));
    _categoriesType.add(CategoryType(id: 2, name: "Men"));
    _categoriesType.add(CategoryType(id: 3, name: "Kid"));
    _categoriesType.add(CategoryType(id: 4, name: "Home"));
  }

  final FavoriteGetxController controller =
  Get.put<FavoriteGetxController>(FavoriteGetxController());


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addCategories();
    _future = HomeApiController().getHome();
  }
  @override
  Widget build(BuildContext context) {
    _selectedWidget = [
      SelectedWidget(title:AppLocalizations.of(context)!.home, widget: HomeWidget()),
      SelectedWidget(title:AppLocalizations.of(context)!.categories, widget: CategoryWidget()),
      SelectedWidget(title:AppLocalizations.of(context)!.favorite, widget: FavoriteWidget()),
      // SelectedWidget(title: "Profile", widget: ProfileWidget()),
    ];
    return Scaffold(
      drawer: Container(
          color: Colors.white,
          width: 300.w,
          margin:
          EdgeInsets.only(left: 24.w, top: 60.h, bottom: 60.h, right: 70.w),
          child: Column(
            children: [
            SizedBox(
            height: 28.h,
          ),
          Container(
            padding: EdgeInsets.only(left: 32.w, right: 24.w),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: ExactAssetImage('images/logo-login.png'),
                  radius: 33.sp,
                ),
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  // AppLocalizations.of(context)!.usersname,
                  SharedPrefController().fullName,
                  // "Eleanor Pena",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(49, 49, 49, 1)),
                ),
              ],
            ),
          ),
          ListView(
            padding: EdgeInsets.only(left: 24.w, right: 24.w),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
            SizedBox(
            height: 33.h,
          ),
          //68.h
          AppListTile(
            title: AppLocalizations.of(context)!.changeprofile,//"change profile", //"My Order",
            leading: Icons.card_giftcard_outlined,
            trailing: Icons.arrow_forward_ios,
            onclick: () {
              Navigator.pushNamed(context, '/change_profile');
            },
          ),
          SizedBox(
            height: 8.h,
          ),
          AppListTile(
            title: AppLocalizations.of(context)!.changepassword,//"change password", //"My returns",
            leading: Icons.assignment_return_outlined,
            trailing: Icons.arrow_forward_ios,
            onclick: () {
              Navigator.pushNamed(context, '/change_password');
            },
          ),
          SizedBox(
            height: 8.h,
          ),
          AppListTile(
            title: AppLocalizations.of(context)!.changelanguage,//'change language', //"Personal details",
            leading: Icons.perm_device_information,
            trailing: Icons.arrow_forward_ios,
            onclick: () {
              Navigator.pushNamed(context, '/setting');
            },
          ),
          SizedBox(
            height: 8.h,
          ),
          SizedBox(
            height: 8.h,
          ),
          AppListTile(
            title: AppLocalizations.of(context)!.aboutapp,//'About App', //"Payment methods",
            leading: Icons.account_balance_wallet_outlined,
            trailing: Icons.arrow_forward_ios,
            onclick: () {
              Navigator.pushNamed(context, '/setting');
            },
          ),
          SizedBox(
            height: 8.h,
          ),
          // AppListTile(
          //   title: 'About Developer', //"Newsletter",
          //   leading: Icons.article_outlined,
          //   trailing: Icons.arrow_forward_ios,
          //   onclick: () {
          //     Navigator.pushNamed(context, '/setting');
          //   },
          // ),
          // SizedBox(
          //   height: 8.h,
          // ),
      AppListTile(
      title: AppLocalizations.of(context)!.contact1,//"Contact",
      leading: Icons.chat_outlined,
      trailing: Icons.arrow_forward_ios,
          onclick: (){
            Navigator.pushNamed(context, '/contact');
          },
    ),
    SizedBox(
    height: 8.h,
    ),
    AppListTile(
    title: AppLocalizations.of(context)!.faqs,//"FAQS",
    leading: Icons.chat_outlined,
    trailing: Icons.arrow_forward_ios,
    onclick: () {
      Navigator.pushNamed(context, '/faqs');
    },
    ),
    SizedBox(
    height: 8.h,
    ),
    AppListTile(
    title: AppLocalizations.of(context)!.logout,//"Log out",
    leading: Icons.logout,
    trailing: Icons.arrow_forward_ios,
    onclick: () {
    logout(context);
    },
    ),
    SizedBox(
    height: 8.h,
    ),
    ],
    )
    ],
    ),
    ),
    backgroundColor: Color.fromRGBO(242, 242, 243, 1),
    appBar: AppBar(
    // backgroundColor: Colors.grey.shade900,
    backgroundColor: Color.fromRGBO(229, 69, 0, 0.81),
    // elevation: 0.01,
    // leading: IconButton(
    //     onPressed: () {}, icon: SvgPicture.asset('images/personlogo.svg')),
    // titleSpacing: 80,
    centerTitle: true,
    // leadingWidth: 1,
    title:Text(_selectedWidget[_currentIndex].title),

    // title: Theme(
    //   child: DropdownButtonHideUnderline(
    //     child: DropdownButton(
    //         isExpanded: true,
    //         value: selectedCategory,
    //         style: TextStyle(color: Colors.white),
    //         // dropdownColor: Colors.black,
    //         dropdownColor: Color.fromRGBO(229, 69, 0, 0.81),
    //         onChanged: (int? value) => setState(() {
    //               if (value != null) selectedCategory = value;
    //             }),
    //         items: _categoriesType
    //             .map((e) => DropdownMenuItem(
    //                 value: e.id,
    //                 child: Text(
    //                   e.name, /*style: TextStyle(color: Colors.black),*/
    //                 )))
    //             .toList()),
    //   ),
    //   data: ThemeData.light(),
    // ),
    // actions: [
    // IconButton(
    // onPressed: () {},
    // icon: SvgPicture.asset('images/settinglogo.svg')),
    // ],
    ),
    bottomNavigationBar: Container(
    margin: EdgeInsets.symmetric(horizontal: 24.w),
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
    borderRadius:
    BorderRadiusDirectional.vertical(top: Radius.circular(20))),
    child: BottomNavigationBar(
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    //fixedColor: Colors.green,
    selectedItemColor: Color.fromRGBO(229, 69, 0, 0.81),
    unselectedItemColor: Colors.grey.shade200,
    // selectedFontSize: 35,
    showSelectedLabels: true,
    showUnselectedLabels: false,
    iconSize: 30,
    onTap: (int value) {
    setState(() {
    _currentIndex = value;
    print("$value");
    });
    },
    currentIndex: _currentIndex,
    items: [
    BottomNavigationBarItem(
    activeIcon: Icon(
    Icons.home,
    size: 40.h,
    ),
    icon: Icon(
    Icons.home_outlined,
    size: 30.h,
    ),
    label: AppLocalizations.of(context)!.home/*"Home"*/),
    BottomNavigationBarItem(
    activeIcon: Icon(
    Icons.category,
    size: 40.h,
    ),
    icon: Icon(
    Icons.category_outlined,
    size: 25.h,
    ),
    label:AppLocalizations.of(context)!.categories /*"Category"*/),
    BottomNavigationBarItem(
    activeIcon: Icon(
    Icons.favorite,
    size: 40.h,
    ),
    icon: Icon(
    Icons.favorite_outline,
    size: 30.h,
    ),
    label:AppLocalizations.of(context)!.favorite /*"Favorit"*/,
    ),
    // BottomNavigationBarItem(
    // activeIcon: Icon(
    // Icons.shopping_bag,
    // size: 40.h,
    // ),
    // icon: Icon(
    // Icons.shopping_bag_outlined,
    // size: 30.h,
    // ),
    // label: "setting",
    // ),
    ],
    ),
    ),
    body:_selectedWidget[_currentIndex].widget,
    );
  }

  Future<void> logout(BuildContext context) async {
    bool loggedOut = await AuthApiController().logout();
    if (loggedOut) Navigator.pushReplacementNamed(context, '/login');
  }
}
