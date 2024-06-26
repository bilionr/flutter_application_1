
import 'package:flutter/material.dart';

class RoundTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String hitText;
  final String icon;
  final Widget? rigtIcon;
  final bool obscureText;
  final EdgeInsets? margin;
  const RoundTextField({super.key, required this.hitText, required this.icon, this.controller, this.margin, this.keyboardType, this.obscureText = false , this.rigtIcon });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
          color: Colors.grey[50], borderRadius: BorderRadius.circular(15)),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please Enter Yang Benar';
          }
          else if(value is int){return 'Integer only';}
          return null;
        },
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: hitText,
            suffixIcon: rigtIcon,
            prefixIcon: Container(
                alignment: Alignment.center,
                width: 20,
                height: 20,
                child: Image.asset(
                 icon,
                  width: 20,
                  height: 20,
                  fit: BoxFit.contain,
                  color: Colors.black,
                )),
            hintStyle: TextStyle(color: Colors.grey[500], fontSize: 12)),
      ),
    );
  }
}