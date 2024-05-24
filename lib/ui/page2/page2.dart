import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/page2/workout_detail_view.dart';
import 'package:flutter_application_1/ui/page2/workout_detail_view2.dart';
import 'package:flutter_application_1/ui/page2/workout_detail_view3.dart';
import 'package:flutter_application_1/ui/page2/workout_detail_view4.dart';
import '../../../common/colo_extension.dart';
import '../../../common_widget/round_button.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  List<Map<String, dynamic>> workArr = [
    {
      "name": "Push Up",
      "image": "assets/pushup.jpg",
      "title": "workout",
      "subtitle": "Personalized workouts will help\nyou gain strength",
    },
    {
      "name": "Sit Up",
      "image": "assets/situp.jpeg",
      "title": "workout",
      "subtitle": "Personalized workouts will help\nyou gain strength",
    },
    {
      "name": "Pull Up",
      "image": "assets/pullup.jpg",
      "title": "workout",
      "subtitle": "Personalized workouts will help\nyou gain strength",
    },
    {
      "name": "Back Up",
      "image": "assets/backup.jpg",
      "title": "workout",
      "subtitle": "Personalized workouts will help\nyou gain strength",
    },
  ];

  // Pisahkan rute ke dalam variabel terpisah
  final List<Widget> routes = [
    WorkoutDetailView(),
    WorkoutDetailView2(),
    WorkoutDetailView3(),
    WorkoutDetailView4(),
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            "assets/img/back.png",
            width: 25,
            height: 25,
          ),
        ),
        title: Text(
          "Exercise",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              children: workArr.map((workout) {
                int index = workArr.indexOf(workout);
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: media.width * 0.5,
                  decoration: BoxDecoration(
                    color: TColor.gray,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    children: [
                      Image.asset(
                        workout["image"]!,
                        width: media.width,
                        height: media.width * 0.5,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: media.width,
                        height: media.width * 0.5,
                        decoration: BoxDecoration(
                          color: index % 2 == 0
                              ? Colors.black.withOpacity(0.7)
                              : TColor.gray.withOpacity(0.35),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              workout["title"]!,
                              style: TextStyle(
                                color: Colors.blue.shade50,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              workout["name"]!,
                              style: TextStyle(
                                color: TColor.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              workout["subtitle"]!,
                              style: TextStyle(
                                color: TColor.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 100,
                                  height: 25,
                                  child: RoundButton(
                                    title: "see more",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    onPressed: () {
                                      // Gunakan rute yang dipisahkan
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => routes[index],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
