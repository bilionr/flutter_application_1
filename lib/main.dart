import 'dart:ffi';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/login/home.dart';
import 'package:flutter_application_1/login/welcome.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  Platform.isAndroid 
  ? await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAjTRX6CnOD3iMn0xqFUfX9Xss2AmXlEU0", 
      appId: "1:301902475407:android:a8f8f820592e1f3d87c0fa", 
      messagingSenderId: "301902475407", 
      projectId: "my-firebase-project-339cb"
    )
  )
  : await Firebase.initializeApp();
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
