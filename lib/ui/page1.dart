import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/swiper.dart';


class Page1 extends StatelessWidget {
  const Page1 ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child:
              Column(
                children: [
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text("Today", style: TextStyle(color: Colors.black, fontSize:32, fontWeight: FontWeight.bold ),)
                    ),
                    Container(
                      child: TextButton(onPressed: () {
                        print("You Pressed");
                      },
                      child: Text("Edit")
                      )
                    ),
                  ],
                ),
                Container(
                    height: 200,
                    width: 400,
                    child: Swiper()
                  ),
                  
                  
                  
                  
                  ],
              )
          ),
    );
  }
}