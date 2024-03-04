import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/ui/home.dart';
import 'package:flutter_application_1/ui/welcome.dart';

void main() {
  runApp(const MyApp());
}

// Class
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Welcome(),
      debugShowCheckedModeBanner: false,
    );
  }
}


