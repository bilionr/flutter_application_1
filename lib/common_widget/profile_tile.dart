
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../common/colo_extension.dart';


class ProfileTile extends StatelessWidget {
  final String my_title;
  final IconData my_icon;
  final VoidCallback? onMyTap;
  const ProfileTile({super.key, required this.my_title, required this.my_icon, this.onMyTap});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          child: ListTile(
            onTap: onMyTap,
            leading: Icon(my_icon),
            title: Text(
              my_title,
              textScaleFactor: 1.5,
            ),
          ),
        ),
      );


  }
}