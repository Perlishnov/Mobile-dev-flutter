import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.obscureText,
    required this.hintText,
    required this.labelText,
    required this.prefixIcon,
  });

  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final String hintText;
  final String labelText;
  final IconData prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value){
        if(value!.isEmpty) {
          return "Field must be complete";
        }
        else{
          return null;
        }
      },
      keyboardType: keyboardType,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Icon(prefixIcon),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          )),
    );
  }
}
