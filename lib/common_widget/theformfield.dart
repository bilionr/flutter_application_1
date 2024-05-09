
import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class TheFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String hitText;
  final String icon;
  final Widget? rigtIcon;
  final bool obscureText;
  final EdgeInsets? margin;
  final Validators? validator;
  const TheFormField({super.key, required this.hitText, required this.icon, this.controller, this.margin, this.keyboardType, this.obscureText = false , this.rigtIcon, this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
                      margin: margin,
                      decoration: BoxDecoration(
                        color: Colors.grey[50], borderRadius: BorderRadius.circular(15)),
                      child: TextFormField(
                        keyboardType: keyboardType,
                        obscureText: obscureText,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter '+hitText;
                          }
                          return null;
                        },
                        controller: controller,
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