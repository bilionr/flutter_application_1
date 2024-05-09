import 'package:flutter/material.dart';
import 'package:flutter_application_1/login/home.dart';
import 'package:flutter_application_1/ui/page1/swiper.dart';

import '../../../common/colo_extension.dart';
import '../../../common_widget/round_button.dart';
import '../../../common_widget/title_subtitle_cell.dart';
import '../../../common_widget/profile_tile.dart';
import 'progress_page.dart';
import 'report_page.dart';
import 'goals_page.dart';
import 'nutrition_page.dart';
import 'food_page.dart';
import 'community_page.dart';
import 'friend_page.dart';
import 'setting_page.dart';

import 'package:flutter_application_1/user_auth/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Page5 extends StatefulWidget {
  const Page5({super.key});

  @override
  State<Page5> createState() => _Page5();
}

class _Page5 extends State<Page5> {

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
                            "Fadjar Restuadji",
                            style: TextStyle(
                              color: TColor.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Lose a Fat Program",
                            style: TextStyle(
                              color: TColor.gray,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 70,
                      height: 25,
                      child: RoundButton(
                        title: "Edit",
                        type: RoundButtonType.bgGradient,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  children: [
                    Expanded(
                      child: TitleSubtitleCell(
                        title: "182cm",
                        subtitle: "Height",
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TitleSubtitleCell(
                        title: "56kg",
                        subtitle: "Weight",
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TitleSubtitleCell(
                        title: "19yo",
                        subtitle: "Age",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProgressPage()),
              );
            },
            leading: Icon(Icons.add),
            title: Text(
              "Progress",
              textScaleFactor: 1.5,
            ),
          ),
        ),
      ),
          // Kalo nambahin nambahin diatasnya aja
          ProfileTile(
            my_title: "Progress",
            my_icon: Icons.add,
            // onMyTap: 
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => ProgressPage()),
            //   )
          ),

Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportPage()),
              );
            },
            leading: Icon(Icons.add),
            title: Text(
              "Report",
              textScaleFactor: 1.5,
            ),
          ),
        ),
      ),

          ProfileTile(
            my_title: "Report",
            my_icon: Icons.add,
            // onMyTap:
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => ReportPage()),
            //   )
          ),

          Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GoalsPage()),
              );
            },
            leading: Icon(Icons.add),
            title: Text(
              "Goals",
              textScaleFactor: 1.5,
            ),
          ),
        ),
      ),


          ProfileTile(
            my_title: "Goals",
            my_icon: Icons.add,
            // onMyTap:
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => GoalsPage()),
            //   )
          ),

Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NutritionPage()),
              );
            },
            leading: Icon(Icons.add),
            title: Text(
              "Nutrition",
              textScaleFactor: 1.5,
            ),
          ),
        ),
      ),

          ProfileTile(
            my_title: "Nutrition",
            my_icon: Icons.add,
            // onMyTap: 
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => NutritionPage()),
            //   )
          ),

Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FoodPage()),
              );
            },
            leading: Icon(Icons.add),
            title: Text(
              "Food",
              textScaleFactor: 1.5,
            ),
          ),
        ),
      ),


          ProfileTile(
            my_title: "Food",
            my_icon: Icons.add,
            // onMyTap:
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => FoodPage()),
            //   )
          ),

Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CommunityPage()),
              );
            },
            leading: Icon(Icons.add),
            title: Text(
              "Comunity",
              textScaleFactor: 1.5,
            ),
          ),
        ),
      ),

          ProfileTile(
            my_title: "Community",
            my_icon: Icons.add,
            // onMyTap:
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => CommunityPage()),
            //   )
          ),

Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FriendPage()),
              );
            },
            leading: Icon(Icons.add),
            title: Text(
              "Friend",
              textScaleFactor: 1.5,
            ),
          ),
        ),
      ),

          ProfileTile(
            my_title: "Friend",
            my_icon: Icons.add,
            // onMyTap:
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => FriendPage()),
            //   )
          ),

Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingPage()),
              );
            },
            leading: Icon(Icons.add),
            title: Text(
              "Setting",
              textScaleFactor: 1.5,
            ),
          ),
        ),
      ),


          ProfileTile(
            my_title: "Setting",
            my_icon: Icons.add,
            // onMyTap:
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => SettingPage()),
            //   )
          ),

          Padding(
            padding: const EdgeInsets.all(50),
            child: RoundButton(title: "Log Out", onPressed: () {signOut();}),
          ),
        ])));
  }
}
