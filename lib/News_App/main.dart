import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_project/News_App/view/bottom_nav/Main_page.dart';
import 'package:provider/provider.dart';
import 'controller/bottom_nav.dart';
import 'controller/categorey_controller.dart';
import 'controller/home_screen.dart';
import 'controller/search_sceen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(
            create: (context)=>HomeScreenController()
        ),
        ChangeNotifierProvider(
            create: (context)=>SearchScreenController()
        ),
        ChangeNotifierProvider(
            create: (context)=>BottomNavController()
        ),
        ChangeNotifierProvider(
            create: (context)=>CategoryController()
        ),

      ],
      child:  MaterialApp(
      debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );


  }
}

