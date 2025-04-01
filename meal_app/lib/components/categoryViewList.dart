import 'package:flutter/material.dart';
import '../models/meal.dart';
import 'categoryViewItem.dart';
class categoryViewList extends StatelessWidget {
  categoryViewList({super.key,required this.title,required this.meals});
  String title ="";
  List<Meal> meals = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Scaffold(
        appBar: AppBar(title: Text(title),actions: [
        ],),
        body: ListView.builder(
          itemCount: meals.length,
          itemBuilder: (context, index) {
            return categoryViewItem(meal: meals[index]);
          },)
      ),
    );
  }
}

