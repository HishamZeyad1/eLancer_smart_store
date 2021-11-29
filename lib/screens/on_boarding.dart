import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_store/widgets/out_boarding_indicator.dart';

import '../models/page_model.dart';

// import 'package:flutter_svg/flutter_svg.dart';
class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late List<PageModel> pages;
  int currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    addPages();
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  void addPages() {
    pages = <PageModel>[];
    pages.add(PageModel(
        title1: 'Contains variety of',
        title2: 'CHOICES',
        image: 'images/background1.png'));
    pages.add(PageModel(
        title1: 'Update the latest ',
        title2: 'TRENDS',
        image: 'images/background2.png'));
    pages.add(PageModel(
        title1: 'Many ',
        title2: 'VOUCHERS ',
        title3: 'for newbie',
        image: 'images/background3.png'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(children: [
          Expanded(
            child: PageView.builder(
              itemBuilder: (context, index) => Container(
                // margin: EdgeInsets.only(bottom: 22.h),
                constraints: BoxConstraints(
                  minWidth: 0,
                  maxWidth: double.infinity,
                  minHeight: 0,
                  maxHeight: 617.h, //673.h,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage(
                        pages[index].image,
                      ),
                      colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(0.6), BlendMode.dstATop),
                      fit: BoxFit.cover),
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 24.w, right: 38.w),
                  constraints: BoxConstraints(
                    minWidth: 0,
                    maxWidth: 352.w,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Text(
                        //   "Contains variety of CHOICES",
                        //   style: TextStyle(fontFamily: 'Poppins', fontSize: 40.sp),
                        // ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                // fontWeight: FontWeight.w700,
                                fontFamily: 'Poppins',
                                fontSize: 40.sp,
                                color: Color.fromRGBO(49, 49, 49, 1)),
                            children: [
                              TextSpan(
                                text: pages[index]
                                    .title1, /*'Contains variety of'*/
                              ),
                              // TextSpan(text: '   of '),
                              TextSpan(
                                  text: pages[index].title2 /*'CHOICES'*/,
                                  style: TextStyle(
                                      color: Color.fromRGBO(229, 69, 0, 0.81))),
                              TextSpan(
                                text: pages[index].title3 != null
                                    ? pages[index].title3
                                    : '',
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
              onPageChanged: (int value) => setState(() {
                currentIndex = value;
              }),
              controller: _pageController,
              itemCount: pages.length,
            ),
          ),
          Container(
            height: 56.h,
            margin: EdgeInsets.only(left: 26.w, right: 113.w),
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontFamily: 'Poppins',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(151, 151, 151, 1)),
                children: [
                  TextSpan(text: 'Confused about your outfit?'),
                  TextSpan(text: '      '),
                  TextSpan(text: 'Don’t worry! Find the best here'),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 42.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutBoardingIndicator(
                selected: currentIndex == 0,
                marginEnd: 16.w,
              ),
              OutBoardingIndicator(
                selected: currentIndex == 1,
                marginEnd: 16.w,
              ),
              OutBoardingIndicator(
                selected: currentIndex == 2,
                marginEnd: 16.w,
              ),
            ],
          ),
          SizedBox(
            height: 52.h,
          ),
          Container(
            margin: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 43.h),
            child: Visibility(
              // visible: currentIndex!=0,
              maintainAnimation: true,
              maintainSize: true,
              maintainState: true,
              child: currentIndex != pages.length-1
                  ? Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _pageController.animateToPage(pages.length,
                                duration: Duration(seconds: 1),
                                curve: Curves.easeInOut);
                          },
                          child: Text(
                            "Skip",
                            style: TextStyle(
                                color: Color.fromRGBO(254, 120, 37, 1)),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              minimumSize: Size(177.w, 64.h),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _pageController.nextPage(
                                duration: Duration(seconds: 1),
                                curve: Curves.easeIn);
                          },
                          child: Text("Next"),
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(255, 92, 0, 0.79),
                              minimumSize: Size(177.w, 64.h),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ],
                    )
                  : ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                        // _pageController.animateToPage(pages.length,duration: Duration(seconds: 1), curve: Curves.easeInOut);
                      },
                      child: Text(
                        "Get Started",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(229, 69, 0, 0.81),
                          minimumSize: Size(double.infinity, 64.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
            ),
          ),

          // Visibility(
          //   visible: currentIndex!=2,
          //   child: Text("hh"),
          //   replacement: Text("data"),
          // )
        ]),
        Positioned(
          width: 82.w,
          height: 82.h,
          top: 56.h,
          left: 40.w,
          child: Image.asset(
            'images/logo.png',
            fit: BoxFit.cover,
          ),
          // child: SvgPicture.asset('images/logo.svg'),
        ),
      ]),
    );
  }
}
//image,title,content,

//
// class OutBoardingIndicator extends StatelessWidget {
//   const OutBording({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         //254, 120, 37, 1
//         decoration: BoxDecoration(
//             color: Color.fromRGBO(255, 205, 144, 1),
//             borderRadius: BorderRadius.circular(10)),
//         child: SizedBox(
//           width: 10.w,
//           height: 10.h,
//         ));
//   }
// }

// Positioned(width: 82.w,height: 82.h,top: 56.h,left: 40.w,
// child: Image.asset(
// 'images/logo.png',
// fit: BoxFit.cover,
// ),
// ),

// SvgPicture.asset(
//   'images/logo.svg',
//   fit: BoxFit.cover,//color: Colors.orange.shade50,
// ),
