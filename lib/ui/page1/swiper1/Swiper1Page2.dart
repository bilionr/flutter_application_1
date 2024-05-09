import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Swiper1Page2 extends StatelessWidget {
  const Swiper1Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
        padding: const EdgeInsets.all(11),
          child: Container(
            width: 400,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 4,
                style: BorderStyle.solid
              ),
              borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
              boxShadow: [
                BoxShadow(
                      color: Colors.grey,
                      offset: const Offset(
                        2.0,
                        2.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
              vertical: 15, horizontal: 20),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Workout",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                
                ]
            ),


            // Decoration
            
          )
        
      )
    ));
                
              
  }
}
