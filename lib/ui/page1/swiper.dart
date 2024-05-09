import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:flutter_application_1/ui/page1/swiper1/Swiper1Page1.dart';
import 'package:flutter_application_1/ui/page1/swiper1/Swiper1Page2.dart';
import 'package:flutter_application_1/ui/page1/swiper1/Swiper1Page3.dart';
import 'package:flutter_application_1/ui/page1/swiper1/Swiper1Page4.dart';

class Swiper extends StatelessWidget {

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
                height:175,
                child: PageView(
                  controller: _controller,
                  children: [
                    Swiper1Page1(),
                    Swiper1Page2(),
                    Swiper1Page3(),
                    Swiper1Page4(),
                  ]
                )
              ),

              // SmoothPageIndicator(
              //   controller: _controller,
              //   count: 4,
              //   effect: SlideEffect(
              //     activeDotColor: Colors.blue,
              //     dotColor: Colors.grey,
              //     dotHeight:10,
              //     dotWidth: 10,
              //   ),
              // )

        ]
      )





    );
  }
}