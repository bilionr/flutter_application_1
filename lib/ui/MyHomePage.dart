import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/ui/page1.dart';
import 'package:flutter_application_1/ui/page2.dart';
import 'package:flutter_application_1/ui/page3.dart';
import 'package:flutter_application_1/ui/page4.dart';
import 'package:flutter_application_1/ui/swiper.dart';


import 'package:flutter_application_1/ui/welcome.dart';
import 'package:flutter_application_1/ui/MyHomePage.dart';

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
    SingleChildScrollView(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 0),
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Today",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 32,
                                fontWeight: FontWeight.bold)),
                      ),
                      Spacer(),
                      Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {
                                print("You Pressed");
                              },
                              child: Text("Edit")))
                    ],
                  )),

                  Container(
                    height: 400,
                    width: 400,
                    child: Swiper()),
              



              // GridView.count(
              //     crossAxisCount: 2,
              //     crossAxisSpacing: 10,
              //     mainAxisSpacing: 10,
              //     shrinkWrap: true,
              //     children: List.generate(20, (index) {
              //       return Padding(
              //           padding: const EdgeInsets.all(5),
              //           child: Container(
              //             margin: EdgeInsets.all(8),
              //             decoration: BoxDecoration(
              //               color: Colors.white,
              //               border: Border.all(
              //                 color: Colors.black12,
              //                 width: 3,
              //               ),
              //               borderRadius: BorderRadius.circular(20),
              //               boxShadow: [BoxShadow(blurRadius: 10)],
              //             ),
              //             width: 300,
              //             child: const Center(
              //                 child: Text(
              //               'Item 1',
              //               style: TextStyle(fontSize: 18, color: Colors.white),
              //             )),
              //           ));
              //     }))
            ])
          ),


    Text("Music", style: TextStyle(fontSize: 40)),


    Text("News", style: TextStyle(fontSize: 40)),

    Text("News", style: TextStyle(fontSize: 40)),
    Text("News", style: TextStyle(fontSize: 40)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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