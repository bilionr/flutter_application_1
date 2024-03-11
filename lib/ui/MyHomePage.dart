import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/main.dart';

import 'package:flutter_application_1/ui/swiper1/Swiper1Page1.dart';
import 'package:flutter_application_1/ui/swiper1/Swiper1Page2.dart';
import 'package:flutter_application_1/ui/swiper1/Swiper1Page3.dart';
import 'package:flutter_application_1/ui/swiper1/Swiper1Page4.dart';

import 'package:flutter_application_1/ui/swiper.dart';
import 'package:flutter_application_1/ui/welcome.dart';
import 'package:flutter_application_1/ui/MyHomePage.dart';

import 'package:flutter_application_1/ui/page1.dart';

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


    Text("Music", style: TextStyle(fontSize: 40)),


    Text("News", style: TextStyle(fontSize: 40)),

    Text("News", style: TextStyle(fontSize: 40)),
    Text("News", style: TextStyle(fontSize: 40)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "FitDaily",
            style: TextStyle(
              color: Colors.blue,
              fontFamily: 'Roboto',
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ), 

        body: Center(
          child: widgetList[_currentIndex]
        ),


        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          selectedItemColor: Colors.white,
          backgroundColor: Colors.blue,
          
          onTap: (index){
            setState((){
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
            icon: Icon(Icons.person),
            label: 'Profile',
            // backgroundColor:Colors.blue,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'cart',
            // backgroundColor:Colors.blue,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            
            label: 'bell',
            // backgroundColor:Colors.blue,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'bell',
            // backgroundColor:Colors.blue,
          ),
        ],
        
        ),

        
            );
  }

  // widget build
} // class