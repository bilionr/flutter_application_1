import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/main.dart';

import 'package:flutter_application_1/ui/page1/swiper1/Swiper1Page1.dart';
import 'package:flutter_application_1/ui/page1/swiper1/Swiper1Page2.dart';
import 'package:flutter_application_1/ui/page1/swiper1/Swiper1Page3.dart';
import 'package:flutter_application_1/ui/page1/swiper1/Swiper1Page4.dart';

import 'package:flutter_application_1/ui/page1/swiper.dart';
import 'package:flutter_application_1/login/welcome.dart';
import 'package:flutter_application_1/ui/MyHomePage.dart';

import 'package:flutter_application_1/ui/page1/page1.dart';
import 'package:flutter_application_1/ui/page2/page2.dart';
import 'package:flutter_application_1/ui/page3/page3.dart';
import 'package:flutter_application_1/ui/page4/page4.dart';
import 'package:flutter_application_1/ui/page5/page5.dart';

// Class
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final _controller = PageController();

  List<Widget> widgetList = [
    Page1(),
    Page2(),
    Page3(mObj: {}),
    Page4(),
    Page5(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(child: widgetList[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(        
        showUnselectedLabels: true,
        selectedItemColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 32, 155, 255),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          // 1
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.white,
          ),

          // 2
          BottomNavigationBarItem(
            icon: Icon(Icons.tips_and_updates_rounded),
            label: 'Tips',
            // backgroundColor:Colors.blue,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank_rounded),
            label: 'Food',
            // backgroundColor:Colors.blue,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin_rounded),

            label: 'Public',
            // backgroundColor:Colors.blue,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            // backgroundColor:Colors.blue,
          ),
        ],
      ),
    );
  }

  // widget build
} // class