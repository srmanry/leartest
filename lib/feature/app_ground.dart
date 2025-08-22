import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:preisslerslunch/feature/order/persentation/view/orders_screen_view.dart';
import 'package:preisslerslunch/feature/selection/presentation/view/selection_screen.dart';
import 'package:preisslerslunch/feature/setting/presentation/view/setting_screen_view.dart';

import 'home/view/home_sereen_view.dart';

class AppGroundView extends StatefulWidget {
  const AppGroundView({super.key});

  @override
  State<AppGroundView> createState() => _AppGroundViewState();
}

class _AppGroundViewState extends State<AppGroundView> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreenView(),
    OrdersScreenView(),
    SelectionScreenView(),
    SettingScreenView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.red, // Status bar background
          statusBarIconBrightness: Brightness.light, // Android icons
          statusBarBrightness: Brightness.dark, // iOS icons
        ),
        automaticallyImplyLeading: false,toolbarHeight: 0,),
      body: _pages[_currentIndex],
      bottomNavigationBar: SizedBox(

        child: BottomNavigationBar(
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),

          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Color(0xFFCCC2B9),
          selectedItemColor: Colors.white,
          backgroundColor: Color(0xFFFF4B3E),
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Icon(Icons.home_outlined),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Icon(Icons.list_alt),
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Icon(Icons.add_shopping_cart_rounded),
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Icon(Icons.settings_outlined),
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
