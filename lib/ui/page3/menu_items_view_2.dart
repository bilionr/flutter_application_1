import 'package:flutter/material.dart';
import '../../common/colo_extension.dart';
import '../../common_widget/round_textfield.dart';
import '../../common_widget/menu_item_row.dart';

class MenuItemsView extends StatefulWidget {
  final Map mObj;
  const MenuItemsView({Key? key, required this.mObj});

  @override
  State<MenuItemsView> createState() => _MenuItemsViewState();
}

class _MenuItemsViewState extends State<MenuItemsView> {
  TextEditingController txtSearch = TextEditingController();

  List menuItemsArr = [
    {
      "image": "assets/sayur_1.jpg",
      "name": "Capcay",
      "rate": "4.3",
      "calories": "25 kalori",
      "food_type": "Sayur"
    },
    {
      "image": "assets/sayur_2.jpg",
      "name": "Gado Gado",
      "rate": "4.5",
      "calories": "35 kalori",
      "food_type": "Sayur"
    },
    {
      "image": "assets/sayur_3.jpg",
      "name": "Sayur Asam",
      "rate": "4.3",
      "calories": "33 kalori",
      "food_type": "Sayur"
    },
    {
      "image": "assets/sayur_4.jpeg",
      "name": "Salad Sayur",
      "rate": "4.8",
      "calories": "25 kalori",
      "food_type": "Sayur"
    },
    {
      "image": "assets/sayur_5.jpg",
      "name": "Sayur Lodeh",
      "rate": "4.1",
      "calories": "42 kalori",
      "food_type": "Sayur"
    },
    {
      "image": "assets/sayur_6.jpg",
      "name": "Sayur Bening",
      "rate": "4.2",
      "calories": "32 kalori",
      "food_type": "Sayur"
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
                        child: Text('Menu Sayur',
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
                  var mObj = menuItemsArr[index];
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
