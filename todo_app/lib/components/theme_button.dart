import 'package:flutter/material.dart';

class themeButton extends StatelessWidget {
  const themeButton({super.key, required this.changeTheme});

  final Function(bool useLightMode) changeTheme;

  @override
  Widget build(BuildContext context) {
    bool isBright = Theme.of(context).brightness == Brightness.light;

    return MaterialButton(
      onPressed: ()=> changeTheme(!isBright),
      child: isBright ? Icon(Icons.dark_mode_outlined): Icon(Icons.light_mode_outlined),
    );
  }
}
