import 'package:flutter/material.dart';

class Swiper1Page1 extends StatelessWidget {
  const Swiper1Page1 ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(11),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color:Colors.amber
          )
        )
      )
    );
  }
}