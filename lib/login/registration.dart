
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/common_widget/form_container_widget.dart';
import 'package:flutter_application_1/common_widget/round_button.dart';
import 'package:flutter_application_1/common_widget/round_textfield.dart';
import 'package:flutter_application_1/login/home.dart';
import 'package:flutter_application_1/login/pengguna.dart';
import 'package:flutter_application_1/user_auth/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../common_widget/theformfield.dart';
import 'complete_profile_view.dart';



class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

  String email = "", password = "", name = "";
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  TextEditingController mailcontroller = new TextEditingController();
  TextEditingController confirmPass = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  final db_users = FirebaseFirestore.instance;

  registration() async {
    if (password != null&& namecontroller.text!=""&& mailcontroller.text!="") {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "Registered Successfully",
          style: TextStyle(fontSize: 20.0),
        )));
        // ignore: use_build_context_synchronously
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CompleteProfileView()));
        

        // menambahkan ke database
        final pengguna = Pengguna(
          name : namecontroller.text,
          email : mailcontroller.text
        );

        final penggunaRef = 
        db_users
          .collection("MyUsers")
          .withConverter(
            fromFirestore: Pengguna.fromFirestore,
            toFirestore: (Pengguna pengguna, options) => pengguna.toFirestore(),)
          .doc('${mailcontroller.text}');
        await penggunaRef.set(pengguna);
          



      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Password Provided is too Weak",
                style: TextStyle(fontSize: 18.0),
              )));
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account Already exists",
                style: TextStyle(fontSize: 18.0),
              )));
        }
      }
    }
  }

  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: media.width * 0.05,),
                Text(
                  "Hey there,",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                
                Text(
                  "Create an Account",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),

                SizedBox(height: media.width * 0.1,),
                
                Form(
                key: _formkey,
                child: Column(
                  children: [
                    TheFormField(
                      controller: namecontroller,
                      hitText: "Name",
                      icon: "assets/lock.png"
                    ),
                    SizedBox(height: media.width * 0.04,),
                    TheFormField(
                      controller: mailcontroller,
                      hitText: "Mail",
                      icon: "assets/lock.png"
                    ),

                    SizedBox(height: media.width * 0.04,),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[50], borderRadius: BorderRadius.circular(15)),
                        child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Yang Benar';
                          }
                          else if(value.length<6){return 'Password Minimum 6 characters';}
                          return null;
                        },
                        controller: passwordcontroller,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: "Password",
                          prefixIcon: Container(
                              alignment: Alignment.center,
                              width: 20,
                              height: 20,
                              child: Image.asset(
                              "assets/lock.png",
                                width: 20,
                                height: 20,
                                fit: BoxFit.contain,
                                color: Colors.black,
                              )),
                          hintStyle: TextStyle(color: Colors.grey[500], fontSize: 12)),
                      ),
                    ),

                    SizedBox(height: media.width * 0.04,),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[50], borderRadius: BorderRadius.circular(15)),
                        child: TextFormField(
                        validator: (value) {
                          if (value != passwordcontroller.text) {
                            return 'Please Enter Yang Benar';
                          }
                          return null;
                        },
                        
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: "Password Confirm",
                          prefixIcon: Container(
                              alignment: Alignment.center,
                              width: 20,
                              height: 20,
                              child: Image.asset(
                              "assets/lock.png",
                                width: 20,
                                height: 20,
                                fit: BoxFit.contain,
                                color: Colors.black,
                              )),
                          hintStyle: TextStyle(color: Colors.grey[500], fontSize: 12)),
                      ),
                    )
    
                  ],
                ),
              ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isCheck = !isCheck;
                        });
                      },
                      icon: Icon(
                        isCheck
                            ? Icons.check_box_outlined
                            : Icons.check_box_outline_blank_outlined,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child:  Text(
                          "By continuing you accept our Privacy Policy and\nTerm of Use",
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                     
                    )
                  ],
                ),
                SizedBox(
                  height: media.width * 0.2,
                ),
                GestureDetector(
                      onTap: (){
                        if(_formkey.currentState!.validate()){
                          setState(() {
                            email=mailcontroller.text;
                            name= namecontroller.text;
                            password=passwordcontroller.text;
                          });
                        }
                        registration();

                      },
                      child: Container(
                    width: double.infinity,
                    height:45, 
                    decoration:BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text("Login", style: TextStyle(color: Colors.white)))
                  )
                    ),
                
                SizedBox(
                  height: media.width * 0.04,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 1,
                      color: Colors.grey.withOpacity(0.5),
                    )),
                    Text(
                      "  Or  ",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    Expanded(
                        child: Container(
                      height: 1,
                      color: Colors.grey.withOpacity(0.5),
                    )),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 1,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(
                          "assets/google.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),

                     SizedBox(
                      width: media.width * 0.04,
                    ),

                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 1,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(
                          "assets/facebook.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                TextButton(
                  onPressed: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Home()));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
