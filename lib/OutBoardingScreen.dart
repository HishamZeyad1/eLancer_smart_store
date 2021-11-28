import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_store/widgets/out_boarding_content.dart';
import 'package:smart_store/widgets/out_boarding_indicator.dart';
// import 'package:lancer_ui_app/widgets/out_boarding_content.dart';
// import 'package:lancer_ui_app/widgets/out_boarding_indicator.dart';

class OutBoardingScreen extends StatefulWidget {
  const OutBoardingScreen({Key? key}) : super(key: key);

  @override
  _OutBoardingScreenState createState() => _OutBoardingScreenState();
}

class _OutBoardingScreenState extends State<OutBoardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Visibility(
              visible: _currentPage < 2,
              replacement: TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/login_screen'),
                child: Text('START'),
              ),
              child: TextButton(
                onPressed: () => _pageController.animateToPage(
                  2,
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOut,
                ),
                child: Text('SKIP'),
              ),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
                minWidth: 0,
                maxWidth: double.infinity,
                minHeight: 0,
                maxHeight: 400),
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) {
                setState(() {
                  _currentPage = value;
                });
              },
              children: [
                OutBoardingContent(),
                OutBoardingContent(),
                OutBoardingContent(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  _pageController.previousPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: _currentPage > 0 ? Colors.black : Colors.grey,
                ),
              ),
              Visibility(
                visible: _currentPage < 2,
                maintainAnimation: true,
                maintainState: true,
                maintainSize: true,
                child: IconButton(
                  onPressed: () {
                    _pageController.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeIn);
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutBoardingIndicator(marginEnd: 10, selected: _currentPage == 0),
              OutBoardingIndicator(marginEnd: 10, selected: _currentPage == 1),
              OutBoardingIndicator(selected: _currentPage == 2),
            ],
          ),
          const SizedBox(height: 20),
          Visibility(
            visible: _currentPage == 2,
            maintainAnimation: true,
            maintainState: true,
            maintainSize: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/login_screen'),
                child: const Text('START'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
