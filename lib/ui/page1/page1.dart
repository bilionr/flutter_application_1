import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/ui/page1/swiper1/Swiper1Page1.dart';
import 'package:flutter_application_1/ui/page1/swiper1/Swiper1Page2.dart';
import 'package:flutter_application_1/ui/page1/swiper1/Swiper1Page3.dart';
import 'package:flutter_application_1/ui/page1/swiper1/Swiper1Page4.dart';
import '../../common_widget/popupmen.dart';


class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1();
}

class _Page1 extends State<Page1> {

  String _name = "";

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    carasouelTmer = getTimer();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        showBtmAppBr = false;
        setState(() {});
      } else {
        showBtmAppBr = true;
        setState(() {});
      }
    });
    
    getData();
    
  }

  void getData() async{
    final DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection("MyUsers").doc('${FirebaseAuth.instance.currentUser?.email}').get();
    _name = userDoc.get('name');
    setState(() {});
  }

  final List<Widget> listis = [
    Swiper1Page1(),
    Swiper1Page2(),
    Swiper1Page3(),
    Swiper1Page4()
  ];

  late final PageController pageController;
  ScrollController _scrollController = ScrollController();
  int pageNo = 0;

  Timer? carasouelTmer;

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageNo == 4) {
        pageNo = 0;
      }
      pageController.animateToPage(
        pageNo,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCirc,
      );
      pageNo++;
    });
  }
  
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  bool showBtmAppBr = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              const SizedBox(
                height: 25.0,
              ),
              const Text(
                "FitDaily",
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: 'Roboto',
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: ListTile(
                  onTap: () {},
                  selected: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                  ),
                  selectedTileColor: Colors.indigoAccent.shade100,

                  title: Text(
                    "Welcome Back $_name",


                    style: Theme.of(context).textTheme.titleMedium!.merge(
                          const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18.0,
                          ),
                        ),
                  ),
                  subtitle: Text(
                    "A Greet welcome to you all.",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  trailing: PopUpMen(
                    menuList: const [
                      PopupMenuItem(
                        child: ListTile(
                          leading: Icon(
                            CupertinoIcons.person,
                          ),
                          title: Text("My Profile"),
                        ),
                      ),
                      PopupMenuItem(
                        child: ListTile(
                          leading: Icon(
                            CupertinoIcons.bag,
                          ),
                          title: Text("My Bag"),
                        ),
                      ),
                      PopupMenuDivider(),
                      PopupMenuItem(
                        child: Text("Settings"),
                      ),
                      PopupMenuItem(
                        child: Text("About Us"),
                      ),
                      PopupMenuDivider(),
                      PopupMenuItem(
                        child: ListTile(
                          leading: Icon(
                            Icons.logout,
                          ),
                          title: Text("Log Out"),
                        ),
                      ),
                    ],
                    icon: CircleAvatar(
                      backgroundImage: const NetworkImage(
                        'https://images.unsplash.com/photo-1644982647869-e1337f992828?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80',
                      ),
                      child: Container(),
                    ),
                  ),
                ),
              ),


              SizedBox(
                height: 200,
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (index) {
                    pageNo = index;
                    setState(() {});
                  },
                  itemBuilder: (_, index) {
                    return AnimatedBuilder(
                      animation: pageController,
                      builder: (ctx, child) {
                        return listis[index];
                      },
                      child: GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text("Hello you tapped at ${index + 1} "),
                            ),
                          );
                        },
                        onPanDown: (d) {
                          carasouelTmer?.cancel();
                          carasouelTmer = null;
                        },
                        onPanCancel: () {
                          carasouelTmer = getTimer();
                        },
                      ),
                    );
                  },
                  itemCount: 4,
                ),
              ),
              
              
              const SizedBox(
                height: 12.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                  (index) => GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.all(2.0),
                      child: Icon(
                        Icons.circle,
                        size: 12.0,
                        color: pageNo == index
                            ? Colors.indigoAccent
                            : Colors.grey.shade300,
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(24.0),
                child: GridB(),
              ),
            ],
          ),
        ),
      ),
      
    );
  }
}


class GridB extends StatefulWidget {
  const GridB({Key? key}) : super(key: key);

  
  State<GridB> createState() => _GridBState();
}

class _GridBState extends State<GridB> {
  final List<Map<String, dynamic>> gridMap = [
    {
      "title": "Sleep",
      "price": "Sleep Description",
      "images":
          "assets/sleep.jpg",
    },
    {
      "title": "Workout",
      "price": "Workout Description",
      "images":
          "assets/work.jpg",
    },
    {
      "title": "Recipes",
      "price": "Recipes Description",
      "images":
          "assets/recipes.jpg",
    },
    {
      "title": "Community",
      "price": "Community Description",
      "images":
          "assets/community.jpg",
    },
  ];

  
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        mainAxisExtent: 300,
      ),
      itemCount: gridMap.length,
      itemBuilder: (_, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              16.0,
            ),
            color: Colors.amberAccent.shade100,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                child: Image.asset(
                  "${gridMap.elementAt(index)['images']}",
                  height: 170,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${gridMap.elementAt(index)['title']}",
                      style: Theme.of(context).textTheme.titleMedium!.merge(
                            const TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "${gridMap.elementAt(index)['price']}",
                      style: Theme.of(context).textTheme.titleSmall!.merge(
                            TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.grey.shade500,
                            ),
                          ),
                    ),
                    
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}