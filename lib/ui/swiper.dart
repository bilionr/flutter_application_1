import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:flutter_application_1/ui/page1.dart';
import 'package:flutter_application_1/ui/page2.dart';
import 'package:flutter_application_1/ui/page3.dart';
import 'package:flutter_application_1/ui/page4.dart';

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
                    Page1(),
                    Page2(),
                    Page3(),
                    Page4(),
                  ]
                )
              ),

              SmoothPageIndicator(
                controller: _controller,
                count: 4,
                effect: SlideEffect(
                  activeDotColor: Colors.blue,
                  dotColor: Colors.grey,
                  dotHeight:10,
                  dotWidth: 10,
                ),
              )

        ]
      )





    );
  }
}