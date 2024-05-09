
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../common/colo_extension.dart';


class xCard extends StatelessWidget {
  final String hitText;
  final String subText;
  final String? icon;
  const xCard({super.key, required this.hitText, required this.subText, this.icon, });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: media.width * 0.5,
                  decoration: BoxDecoration(
                    color: TColor.gray,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    children: [
                      // Image.asset(
                      //   wObj["image"].toString(),
                      //   width: media.width,
                      //   height: media.width * 0.5,
                      //   fit: BoxFit.cover,
                      // ),
                      Container(
                        width: media.width,
                        height: media.width * 0.5,
                        decoration: BoxDecoration(
                          // color: index % 2 == 0
                          //     ? Colors.black.withOpacity(0.7)
                          //     : TColor.gray.withOpacity(0.35),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              hitText,
                              style: TextStyle(
                                color: Colors.blue.shade50,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            
                            Text(
                              subText,
                              style: TextStyle(
                                color: TColor.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 75,
                                  height: 75,
                                  child: 
                                  Image.asset(
                                    'assets/u2.png',
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                
                                const Spacer(),

                                Column(
                                  children: [
                                  Text(
                                  "Billy Alexander",
                                  style: TextStyle(
                                    color: TColor.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  ),

                                  Container(
                                    width: 200,
                                    child:RatingBar.builder(
                                    initialRating: 3,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 30,
                                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  )
                                
                                ]
                                )

                              





                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );


  }
}