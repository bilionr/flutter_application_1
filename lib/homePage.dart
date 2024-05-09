import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final Shader iphoneShader =
      LinearGradient(colors: [Color(0xff070D14), Color(0xff85D1EE)])
          .createShader(Rect.fromLTWH(0, 100, 50, 2));

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Color(0xFF05182D),
              Color(0xFF092A45),
              Color(0xFF0D2339)
            ])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 40),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Fit Daily',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text('Home', style: TextStyle(color: Colors.white)),
                        SizedBox(width: 40),
                        Text('Contact Us',
                            style: TextStyle(color: Color(0xFF6F92B6))),
                        SizedBox(width: 40),
                        Text('Support',
                            style: TextStyle(color: Color(0xFF6F92B6))),
                        SizedBox(width: 40),
                        Icon(Icons.search, color: Colors.white),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 100),
                        Text('#1 your daily fitness tracker',
                            style: TextStyle(
                                color: Color(0xFFE6949B), fontSize: 18)),
                        SizedBox(height: 20),
                        Text(
                          'Reach Your Goals',
                          style: TextStyle(
                              fontSize: 100,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()..shader = iphoneShader,
                              shadows: [
                                Shadow(
                                    offset: Offset(10, 10),
                                    blurRadius: 20,
                                    color: Colors.black),
                                Shadow(
                                    offset: Offset(10, 10),
                                    blurRadius: 20,
                                    color: Colors.black12),
                              ]),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: 450,
                          child: Text(
                            'Build healthy habits with the all-in-one food, exercise, and calorie tracker.',
                            style: TextStyle(
                                color: Color(0xFF4481A6), fontSize: 20),
                          ),
                        ),
                        Image.asset(
                          'images/iPhone.png',
                          width: 600,
                        ),
                        SizedBox(height: 50),
                        Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF21A3E2)),
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.download,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'FREE DOWNLOAD',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
