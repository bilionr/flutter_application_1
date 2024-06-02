import 'package:flutter/material.dart';
import '../../common/colo_extension.dart';
import '../../common_widget/round_textfield.dart';
import '../../common_widget/menu_item_row.dart';

class MenuItemsView2 extends StatefulWidget {
  final Map mObj;
  const MenuItemsView2({Key? key, required this.mObj});

  @override
  State<MenuItemsView2> createState() => _MenuItemsView2State();
}

class _MenuItemsView2State extends State<MenuItemsView2> {
  TextEditingController txtSearch = TextEditingController();

  List menuItemsArr = [
    {
      "image": "assets/daging_1.jpeg",
      "name": "Ayam Panggang Bumbu Rujak",
      "rate": "4.6",
      "calories": "40 kalori",
      "food_type": "Daging"
    },
    {
      "image": "assets/daging_2.jpeg",
      "name": "Sate Ayam",
      "rate": "4.8",
      "calories": "36 kalori",
      "food_type": "Daging"
    },
    {
      "image": "assets/daging_3.jpg",
      "name": "Sup Ayam Bening",
      "rate": "4.3",
      "calories": "41 kalori",
      "food_type": "Daging"
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
                        child: Text('Menu Daging',
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
