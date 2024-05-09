import 'package:flutter/material.dart';
import '../../ui/page3/menu_items_view.dart';
import '../../common/colo_extension.dart';
import 'package:flutter_application_1/common_widget/round_textfield.dart';
import '../../common_widget/menu_item_row.dart';

class Page3 extends StatefulWidget {
  final Map<String, String> mObj; // Tambahkan deklarasi variabel mObj
  const Page3(
      {Key? key,
      required this.mObj}); // Tentukan mObj sebagai parameter yang diperlukan

  @override
  State<Page3> createState() => _MenuViewState();
}

class _MenuViewState extends State<Page3> {
  List menuArr = [
    {
      "name": "Food",
      "image": "assets/menu_1.png",
      "items_count": "120",
    },
    {
      "name": "Beverages",
      "image": "assets/menu_2.png",
      "items_count": "220",
    },
    {
      "name": "Desserts",
      "image": "assets/menu_3.png",
      "items_count": "155",
    },
    {
      "name": "Promotions",
      "image": "assets/menu_4.png",
      "items_count": "25",
    },
  ];
  TextEditingController txtSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 180),
            width: media.width * 0.30,
            height: media.height * 0.6,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 28, 103, 154),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(35),
                  bottomRight: Radius.circular(35)),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 46,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Menu",
                          style: TextStyle(
                              color: TColor.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w800),
                        ),
                        // Remove IconButton for MyOrderView
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 20),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: menuArr.length,
                    itemBuilder: ((context, index) {
                      var mObj = menuArr[index] as Map<String, String>;
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MenuItemsView(
                                mObj: menuArr[index],
                              ),
                            ),
                          );
                        },
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 8, bottom: 8, right: 20),
                              width: media.width - 100,
                              height: 90,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 143, 210, 255),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      bottomLeft: Radius.circular(25),
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromARGB(31, 0, 0, 0),
                                        blurRadius: 7,
                                        offset: Offset(0, 4))
                                  ]),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  mObj["image"]!,
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        mObj["name"]!,
                                        style: TextStyle(
                                            color: TColor.black,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "${mObj["items_count"]} items",
                                        style: TextStyle(
                                            color: TColor.black, fontSize: 11),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(17.5),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 4,
                                            offset: Offset(0, 2))
                                      ]),
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    "assets/btn_next.png",
                                    width: 15,
                                    height: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
