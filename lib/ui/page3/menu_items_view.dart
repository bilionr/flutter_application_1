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
      "image": "assets/dess_1.png",
      "name": "Ikan Bakar",
      "rate": "4.9",
      "rating": "124",
      "type": "Minute by tuk tuk",
      "food_type": "Ikan"
    },
    {
      "image": "assets/dess_2.png",
      "name": "Pepes Ikan",
      "rate": "4.9",
      "rating": "124",
      "type": "Cakes by Tella",
      "food_type": "Ikan"
    },
    {
      "image": "assets/dess_3.png",
      "name": "Ikan Kuah Kuning",
      "rate": "4.9",
      "rating": "124",
      "type": "Café Racer",
      "food_type": "Ikan"
    },
    {
      "image": "assets/dess_4.png",
      "name": "Sashimi",
      "rate": "4.9",
      "rating": "124",
      "type": "Minute by tuk tuk",
      "food_type": "Ikan"
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
                        child: Text('Menu',
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
