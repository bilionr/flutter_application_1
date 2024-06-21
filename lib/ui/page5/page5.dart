import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login/home.dart';
import 'package:flutter_application_1/ui/page1/swiper.dart';
import 'package:flutter_application_1/ui/page5/progress/add_Weight_page.dart';
import 'package:provider/provider.dart';

import '../../../common/colo_extension.dart';
import '../../../common_widget/round_button.dart';
import '../../../common_widget/title_subtitle_cell.dart';
import '../../../common_widget/profile_tile.dart';
import 'report_page.dart';
import 'goals_page.dart';
import 'nutrition_page.dart';
import 'food_page.dart';
import 'community_page.dart';
import 'friend_page.dart';
import 'setting_page.dart';
import 'progress/progressdashboard.dart';

import 'package:flutter_application_1/user_auth/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Page5 extends StatefulWidget {
  const Page5({super.key});

  @override
  State<Page5> createState() => _Page5();
}

class _Page5 extends State<Page5> {

  String _name="";
  int _height=0;
  int _weight=0;
  String _goal = "";
  Timestamp _bornday = Timestamp.now();
  

  int getAge(DateTime dt){
    
    Duration parse = dt.difference(DateTime.now()).abs();
    return parse.inDays~/360;

  }

  void initState(){
    getData();

  }

  Future<void> getData() async {
    final DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection("MyUsers").doc('${FirebaseAuth.instance.currentUser?.email}').get();
    

    _name = userDoc.get('name');
    _height = userDoc.get('height');
    _weight = userDoc.get('weight');
    _goal = userDoc.get('goal');
    _bornday = userDoc.get('bornday');

    setState(() {});
  }


  signOut() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
    Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => Home())
    );
  }
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
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        "assets/u2.png",
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _name,
                            style: TextStyle(
                              color: TColor.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "${_goal} Program",
                            style: TextStyle(
                              color: TColor.gray,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                    
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TitleSubtitleCell(
                        title: "${_height.toString()} cm",
                        subtitle: "Height",
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TitleSubtitleCell(
                        title: "${_weight.toString()} kg",
                        subtitle: "Weight",
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TitleSubtitleCell(
                        title: "${getAge(_bornday.toDate())} yo",
                        subtitle: "Age",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          ProfileTile(
            my_title: "Progress",
            my_icon: Icons.add,
            onMyTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProgressDashboard()),
              );},
          ),
          
          ProfileTile(
            my_title: "Report",
            my_icon: Icons.add,
            onMyTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportPage()),
              );},
          ),


          ProfileTile(
            my_title: "Goals",
            my_icon: Icons.add,
            onMyTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GoalsPage()),
              );
            },
          ),

          Padding(
            padding: const EdgeInsets.all(50),
            child: RoundButton(title: "Log Out", onPressed: () {signOut();}),
          ),
        ])));
  }
}
