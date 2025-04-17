import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const CircleButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0,
      fillColor: const Color(0xFF4C4F5E),
      shape: const CircleBorder(),
      constraints: const BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}