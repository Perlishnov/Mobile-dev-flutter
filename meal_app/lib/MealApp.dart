import 'package:flutter/material.dart';
import "package:meal_app/data/dummy_data.dart" as data;
import "package:meal_app/components/categoryViewList.dart";
import "package:meal_app/models/meal.dart";

class MealApp extends StatefulWidget {
  const MealApp({super.key});

  @override
  State<MealApp> createState() => _MealAppState();
}

class _MealAppState extends State<MealApp> {
  var selectedCategory = "";
  List<Meal> selectCategory(String selectedCategory) {
    return data.dummyMeals.where((meal) {
      return meal.categories.contains(selectedCategory);
    }).toList();
  }
  String? getCategoryNameById(int id, List<Map<String, dynamic>> categories) {
    for (var category in categories) {
      if (category['id'] == id) {
        return category['name'] as String;
      }
    }
    return null; // Return null if no matching category is found
  }
  @override
  void initState() {
    super.initState();
    if(selectedCategory == "") {
      selectedCategory = data.availableCategories[0].id;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pick your Category"),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 20,
        ), itemCount: data.availableCategories.length
            ,itemBuilder: (context, index) {
              return GridTile(child:GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategory = data.availableCategories[index].id;
                  });
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => categoryViewList(
                        title: data.availableCategories[index].title,
                        meals: selectCategory(selectedCategory)
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: data.availableCategories[index].color,

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text(data.availableCategories[index].title,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                  ),
              )));
            },),
      ),
    );
  }
}
