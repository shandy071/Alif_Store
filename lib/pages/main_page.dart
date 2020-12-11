import 'package:app_shoe_shop/core/const.dart';
import 'package:app_shoe_shop/core/flutter_icons.dart';
import 'package:app_shoe_shop/pages/about.dart';
import 'package:app_shoe_shop/pages/home_page.dart';
import 'package:flutter/material.dart';

class Main extends StatefulWidget {
  static String tag = 'main-page';
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  PageController _pageController;
  int _page = 0;
  List<Widget> _screens = [HomePage(), HomePage(), HomePage(), About()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 10,
            )
          ],
        ),
        child: BottomNavigationBar(
          selectedItemColor: AppColors.greenColor,
          unselectedItemColor: Colors.black26,
          currentIndex: _page,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(FlutterIcons.compass),
              ),
              title: Text("data"),
            ),
            BottomNavigationBarItem(
              icon: Icon(FlutterIcons.list),
              title: Text("data"),
            ),
            BottomNavigationBarItem(
              icon: Icon(FlutterIcons.bag),
              title: Text("data"),
            ),
            BottomNavigationBarItem(
              icon: Icon(FlutterIcons.person_outline),
              title: Text("data"),
            ),
          ],
          onTap: navigationTapped,
        ),
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
