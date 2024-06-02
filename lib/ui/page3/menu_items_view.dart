import 'package:flutter/material.dart';
import '../../common/colo_extension.dart';
import '../../common_widget/round_textfield.dart';
import '../../common_widget/menu_item_row.dart';

class MenuItemsView4 extends StatefulWidget {
  final Map mObj;
  const MenuItemsView4({Key? key, required this.mObj});

  @override
  State<MenuItemsView4> createState() => _MenuItemsView4State();
}

class _MenuItemsView4State extends State<MenuItemsView4> {
  TextEditingController txtSearch = TextEditingController();

  List menuItemsArr = [
    {
      "image": "assets/buah_1.jpg",
      "name": "Salad Buah",
      "rate": "4.5",
      "calories": "20 kalori",
      "food_type": "Buah"
    },
    {
      "image": "assets/buah_2.jpg",
      "name": "Jus Buah",
      "rate": "4.3",
      "calories": "14 kalori",
      "food_type": "Buah"
    },
    {
      "image": "assets/buah_3.jpg",
      "name": "Puding Buah",
      "rate": "4.2",
      "calories": "12 kalori",
      "food_type": "Buah"
    },
    {
      "image": "assets/buah_4.jpg",
      "name": "Rujak Buah",
      "rate": "4.4",
      "calories": "17 kalori",
      "food_type": "Buah"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Image.asset(
                        "assets/btn_back.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Center(
                        child: Text('Menu Buah',
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center)),
                    Expanded(
                      child: Text(
                        widget.mObj["name"].toString(),
                        style: TextStyle(
                          color: TColor.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 15,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: menuItemsArr.length,
                itemBuilder: ((context, index) {
                  var mObj = menuItemsArr[index] as Map? ?? {};
                  return MenuItemRow(
                    mObj: mObj,
                    onTap: () {},
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
