import 'dart:ffi';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/login/welcome.dart';
import 'package:flutter_application_1/ui/MyHomePage.dart';

import 'auth_provider.dart';
import 'auth_service.dart';


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
  runApp(MyApp());
}


// Class
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      
      auth: AuthService(),
      child: MaterialApp(
        home: HomeController(),
        debugShowCheckedModeBanner: false,
      )
    );
  }
}

class HomeController extends StatelessWidget {
  const HomeController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of(context)!.auth;

    return StreamBuilder(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          return signedIn ? MyHomePage() : Welcome();
        }
        return Container(
          color: Colors.black,
        );
      },
    );
  }
}