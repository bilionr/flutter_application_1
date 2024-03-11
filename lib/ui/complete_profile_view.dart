
// import 'package:flutter/material.dart';

// import '../../common_widget/round_button.dart';
// import '../../common_widget/round_textfield.dart';

// class CompleteProfileView extends StatefulWidget {
//   const CompleteProfileView({super.key});

//   @override
//   State<CompleteProfileView> createState() => _CompleteProfileViewState();
// }

// class _CompleteProfileViewState extends State<CompleteProfileView> {
//   TextEditingController txtDate = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     var media = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Column(
//               children: [
//                 Image.asset(
//                   "assets/img/complete_profile.png",
//                   width: media.width,
//                   fit: BoxFit.fitWidth,
//                 ),
//                 SizedBox(
//                   height: media.width * 0.05,
//                 ),
//                 Text(
//                   "Let’s complete your profile",
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 20,
//                       fontWeight: FontWeight.w700),
//                 ),
//                 Text(
//                   "It will help us to know more about you!",
//                   style: TextStyle(color: Colors.grey, fontSize: 12),
//                 ),
//                 SizedBox(
//                   height: media.width * 0.05,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                   child: Column(
//                     children: [
//                       Container(
//                           decoration: BoxDecoration(
//                               color: Colors.lightgrey,
//                               borderRadius: BorderRadius.circular(15)),
//                           child: Row(
//                             children: [
//                               Container(
//                                   alignment: Alignment.center,
//                                   width: 50,
//                                   height: 50,
//                                   padding: const EdgeInsets.symmetric(horizontal: 15),
                                  
//                                   child: Image.asset(
//                                     "assets/img/gender.png",
//                                     width: 20,
//                                     height: 20,
//                                     fit: BoxFit.contain,
//                                     color: Colors.grey,
//                                   )),
                            
//                               Expanded(
//                                 child: DropdownButtonHideUnderline(
//                                   child: DropdownButton(
//                                     items: ["Male", "Female"]
//                                         .map((name) => DropdownMenuItem(
//                                               value: name,
//                                               child: Text(
//                                                 name,
//                                                 style: TextStyle(
//                                                     color: Colors.grey,
//                                                     fontSize: 14),
//                                               ),
//                                             ))
//                                         .toList(),
//                                     onChanged: (value) {},
//                                     isExpanded: true,
//                                     hint: Text(
//                                       "Choose Gender",
//                                       style: TextStyle(
//                                           color: Colors.grey, fontSize: 12),
//                                     ),
//                                   ),
//                                 ),
//                               ),

//                              const SizedBox(width: 8,)

//                             ],
//                           ),),
//                       SizedBox(
//                         height: media.width * 0.04,
//                       ),
//                       RoundTextField(
//                         controller: txtDate,
//                         hitText: "Date of Birth",
//                         icon: "assets/img/date.png",
//                       ),
//                       SizedBox(
//                         height: media.width * 0.04,
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: RoundTextField(
//                               controller: txtDate,
//                               hitText: "Your Weight",
//                               icon: "assets/img/weight.png",
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 8,
//                           ),
//                           Container(
//                             width: 50,
//                             height: 50,
//                             alignment: Alignment.center,
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 colors: Colors.secondaryG,
//                               ),
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: Text(
//                               "KG",
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 12),
//                             ),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: media.width * 0.04,
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: RoundTextField(
//                               controller: txtDate,
//                               hitText: "Your Height",
//                               icon: "assets/img/hight.png",
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 8,
//                           ),
//                           Container(
//                             width: 50,
//                             height: 50,
//                             alignment: Alignment.center,
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 colors: Colors.secondaryG,
//                               ),
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: Text(
//                               "CM",
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 12),
//                             ),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: media.width * 0.07,
//                       ),
//                       RoundButton(
//                           title: "Next >",
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 // MaterialPageRoute(
//                                 //     builder: (context) =>
//                                 //         const WhatYourGoalView()));
//                           }),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }