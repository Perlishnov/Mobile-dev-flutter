import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.buttonText, this.OnPressed});

  final String buttonText;
  final void Function()? OnPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        shape: Border.all(color: Colors.black),
        onPressed: OnPressed,
      child: Text(buttonText),
      color: Theme.of(context).primaryColor,
    );
  }
}
