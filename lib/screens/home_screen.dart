import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_store/api/controllers/auth_api_controller.dart';
import 'package:smart_store/models/category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Category> _categories = [];
  int selectedCategory = 1;
  int _currentIndex = 0;

  void addCategories() {
    _categories.add(Category(id: 1, name: "Women"));
    _categories.add(Category(id: 2, name: "Men"));
    _categories.add(Category(id: 3, name: "Kid"));
    _categories.add(Category(id: 4, name: "Home"));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addCategories();
  }

  @override
  Widget build(BuildContext context) {
    // addCategories();
    return Scaffold(
      drawer: Container(
        color: Colors.white,
        width: 300.w,
        margin:
            EdgeInsets.only(left: 24.w, top: 60.h, bottom: 39.h, right: 70.w),
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
                    "Eleanor Pena",
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
                ), //68.h
                ListTile(
                  title: Text("My Order"),
                  leading: Icon(Icons.card_giftcard_outlined),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                SizedBox(
                  height: 8.h,
                ),
                ListTile(
                  title: Text("My returns"),
                  leading: Icon(Icons.assignment_return_outlined),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                SizedBox(
                  height: 8.h,
                ),

                ListTile(
                  title: Text("Personal details"),
                  leading: Icon(Icons.perm_device_information),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                SizedBox(
                  height: 8.h,
                ),
                ListTile(
                  title: Text("Payment methods"),
                  leading: Icon(Icons.account_balance_wallet_outlined),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                SizedBox(
                  height: 8.h,
                ),

                ListTile(
                  title: Text("Newsletter"),
                  leading: Icon(Icons.article_outlined),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                SizedBox(
                  height: 8.h,
                ),

                ListTile(
                  title: Text("Chat"),
                  leading: Icon(Icons.chat_outlined),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                SizedBox(
                  height: 8.h,
                ),
                IconButton(
                  icon: ListTile(
                    title: Text("Log out"),
                    leading: Icon(Icons.logout),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  onPressed: () =>logout(context) ,
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
        backgroundColor: Colors.transparent,
        elevation: 0.01,
        // leading: IconButton(
        //     onPressed: () {}, icon: SvgPicture.asset('images/personlogo.svg')),
        titleSpacing: 80,
        // leadingWidth: 1,
        // title:Text("dlldl "),

        title: Theme(
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
                isExpanded: true,
                value: selectedCategory,
                onChanged: (int? value) => setState(() {
                      if (value != null) selectedCategory = value;
                    }),
                items: _categories
                    .map((e) =>
                        DropdownMenuItem(value: e.id, child: Text(e.name)))
                    .toList()),
          ),
          data: ThemeData.light(),
        ),
        actions: [
          // Center(
          //   child: DropdownButton(isExpanded: false,
          //       items:
          //       _categories.map((e) => DropdownMenuItem(value:e.id ,child: Text(e.name))).toList()),
          // ),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('images/settinglogo.svg')),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        clipBehavior:Clip.antiAlias ,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.vertical(top: Radius.circular(20))
        ),
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
                label: "Home"),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.category,
                  size: 40.h,
                ),
                icon: Icon(
                  Icons.category_outlined,
                  size: 25.h,
                ),
                label: "Category"),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.favorite,
                size: 40.h,
              ),
              icon: Icon(
                Icons.favorite_outline,
                size: 30.h,
              ),
              label: "Favorit",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.shopping_bag,
                size: 40.h,
              ),
              icon: Icon(
                Icons.shopping_bag_outlined,
                size: 30.h,
              ),
              label: "setting",
            ),
          ],
        ),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.deepOrange,
                      ),
                      hintText: 'Search',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 16.h, horizontal: 20.w),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Container(
                    child: Icon(
                      Icons.filter_list_rounded,
                      color: Colors.deepOrange,
                      size: 40.sp,
                    ),
                    decoration: BoxDecoration(
                        //color: Colors.red,
                        border: Border.all(width: 2, color: Colors.white))),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Container(
                width: double.infinity,
                height: 148,
                child: Image.asset('images/banner.png')),
            SizedBox(
              height: 24.h,
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  "New Arrival",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                )),
                Text("see all",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(229, 69, 0, 0.81)))
              ],
            ),
            SizedBox(
              height: 18.h,
            ),
            GridView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 175 / 272),
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.black,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                  ),
                  Container(width: 50, height: 50, color: Colors.green)
                ]),
          ],
        ),
      ),
    );
  }
  Future<void> logout(BuildContext context) async {
    bool loggedOut = await AuthApiController().logout();
    if (loggedOut) Navigator.pushReplacementNamed(context, '/login');
  }
}
