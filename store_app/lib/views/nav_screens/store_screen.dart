import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Store")),
      body: Center(
        child: Text(
          "Stores",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
