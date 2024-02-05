import 'package:flutter/material.dart';
import 'package:new_project/News_App/view/categorey_screen/categorey_screen.dart';


import 'package:new_project/News_App/view/home_screen/home_screen.dart';
import 'package:new_project/News_App/view/search_screen/search_screen.dart';

class BottomNavController with ChangeNotifier {
  int selectedIndex = 0;

  void onItemTap(index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> myPages = [
    HomeScreen(),
    CategoryScreen(),
    SearchScreen()
  ];

// @override
// void notifyListeners() {
//   // TODO: implement notifyListeners
//   super.notifyListeners();
// }
}
