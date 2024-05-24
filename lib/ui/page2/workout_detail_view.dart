import 'package:flutter/material.dart';
import 'package:flutter_application_1/common_widget/tab_button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:flutter_application_1/common/colo_extension.dart';
import 'package:flutter_application_1/common_widget/response_row.dart';

class WorkoutDetailView extends StatefulWidget {
  const WorkoutDetailView({super.key});

  @override
  State<WorkoutDetailView> createState() => _WorkoutDetailViewState();
}

class _WorkoutDetailViewState extends State<WorkoutDetailView> {
  List workArr = [
    {"name": "Running", "image": "assets/pushup.jpg"},
    {"name": "Jumping", "image": "assets/pushup.jpg"},
    {
      "name": "Running",
      "image": "assets/pullup.jpg",
    },
    {
      "name": "Jumping",
      "image": "assets/situp.jpeg",
    },
  ];

  List responseArr = [
    {
      "name": "Billy Alexander1",
      "time": "09 days ago",
      "image": "assets/u2.png",
      "message": "Sangat bermanfaat!"
    },
    {
      "name": "Fadjar Restuadji",
      "time": "11 days ago",
      "image": "assets/u1.png",
      "message": "Menakjubkan!"
    },
    {
      "name": "Billy Alexander",
      "time": "12 days ago",
      "image": "assets/u2.png",
      "message": "Terima kasih telah memotivasi saya"
    },
    {
      "name": "Fadjar Restuadji",
      "time": "13 days ago",
      "image": "assets/u1.png",
      "message": "Saya setuju dengan informasi yang diberikan"
    }
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 82, 167, 248),
        centerTitle: true,
        elevation: 0.1,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              "assets/black_white.png",
              width: 25,
              height: 25,
            )),
        title: Text(
          "Pushup",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                "assets/node_music.png",
                width: 25,
                height: 25,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/pushup.jpg",
              width: media.width,
              height: media.width * 0.55,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  IgnorePointer(
                    ignoring: true,
                    child: RatingBar.builder(
                      initialRating: 4,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 25,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.red.shade100,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/like.png",
                        width: 20,
                        height: 20,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/share.png",
                        width: 20,
                        height: 20,
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Text(
                "Recommended",
                style: TextStyle(
                    color: Colors.red.shade100,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: media.width * 0.26,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: workArr.length,
                  itemBuilder: (context, index) {
                    var wObj = workArr[index] as Map? ?? {};
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      width: media.width * 0.28,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                wObj["image"].toString(),
                                width: media.width,
                                height: media.width * 0.15,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                width: media.width,
                                height: media.width * 0.15,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.5)),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 0),
                            child: Text(
                              wObj["name"],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "17 Responses",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              shrinkWrap: true,
              itemCount: responseArr.length,
              itemBuilder: ((context, index) {
                var rObj = responseArr[index] as Map? ?? {};
                return ResponsesRow(
                  rObj: rObj,
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
