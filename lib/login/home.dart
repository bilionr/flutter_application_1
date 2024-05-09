import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/login/registration.dart';
import 'package:flutter_application_1/login/welcome.dart';
import 'package:flutter_application_1/ui/MyHomePage.dart';
import 'package:flutter_application_1/user_auth/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home>{

  String email = "", password = "";

  TextEditingController mailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "No User Found for that Email",
              style: TextStyle(fontSize: 18.0),
            )));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Wrong Password Provided by User",
              style: TextStyle(fontSize: 18.0),
            )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xfff0f1f5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(18),
            height: size.height * 0.95,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150,
                  child: RichText(
                    text: const TextSpan(
                      text: 'Your',
                      style: TextStyle(
                        fontSize: 32,
                        color: Color.fromARGB(255, 54, 133, 218),
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' workout partner',
                          style: TextStyle(
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 170,
                  width: 350,
                  child: Image.asset(
                    'assets/workout.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: size.height * .35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.2),
                        spreadRadius: 2,
                        blurRadius: 20,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Positioned(
                        top: 10,
                        left: 20,
                        child: Text(
                          'Login Here',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 20,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.mail_outline,
                                  color: Colors.grey,
                                ),
                                Container(
                                  
                                  padding: const EdgeInsets.only(left: 10),
                                  width: 300,
                                  child: TextFormField(
                                      validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter E-mail';
                                      }
                                      return null;
                                    },
                                    controller: mailcontroller,
                                    cursorColor: Colors.grey,
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'youremail@gmail.com',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: size.width * .8,
                              child: const Divider(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 120,
                        left: 20,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.mail_outline,
                                  color: Colors.grey,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 10),
                                  width: 300,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Password';
                                      }
                                      return null;
                                    },
                                    controller: passwordcontroller,
                                    obscureText: true,
                                    cursorColor: Colors.grey,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 15,
                                      letterSpacing: 0,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'password',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: size.width * .8,
                              child: const Divider(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 180,
                        left: 20,
                        child: SizedBox(
                          width: size.width * .8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) {
                                      return const SignUpView();
                                    },
                                  ));
                                },
                                child: Text(
                                  'Create Account',
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              Text(
                                'Forgot Details',
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Form(
                        key: _formkey,
                        child: Positioned(
                        bottom: 70,
                        right: 10,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          height: 80,
                          width: 80,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 57, 77, 110),
                                Color.fromARGB(255, 83, 193, 230),
                              ],
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                               if(_formkey.currentState!.validate()){
                                setState(() {
                                  email= mailcontroller.text;
                                  password=passwordcontroller.text;
                                });
                              }
                              userLogin();
                            },
                            child: Image.asset('assets/right-arrow.png'),
                          ),
                        ),
                      ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

