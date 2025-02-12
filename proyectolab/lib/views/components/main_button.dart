import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key, required this.buttonText, this.onTap});

  final String buttonText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(colors: [
            Color(0xff08065c),
            Color(0xff130fba),
          ],
          begin: Alignment.topLeft,
            end: Alignment.bottomLeft,)
        ),
        child: Center(
          child: Text('login', style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),),
        ),
      ),
    );
  }
}
