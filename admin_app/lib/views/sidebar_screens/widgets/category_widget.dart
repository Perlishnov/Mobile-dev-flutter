import 'package:flutter/material.dart';

import '../../../controllers/category_controller.dart';
import '../../../models/category_model.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  late final Future<List<CategoryModel>> _categories;
  final CategoryController _categoryController = new CategoryController();
  @override
  void initState() {
    super.initState();
    _categories = _categoryController.loadCategory();
  }
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(future: _categories, builder:(context, snapshot) {
      if(snapshot.connectionState == ConnectionState.waiting){
        return Center(
          child: CircularProgressIndicator(),
        );
      }else if(!snapshot.hasData || snapshot.data!.isEmpty){
        return Center(
          child: Text("No categories Found"),
        );
      }else if (snapshot.hasError){
        return Center(
          child: Text("Error: ${snapshot.error}"),
        );
      }else{
        GridView.builder(shrinkWrap: true,
            itemCount: snapshot.data!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6, mainAxisSpacing: 6, crossAxisSpacing: 6),
            itemBuilder:
        (context, index) {
          Image.network(snapshot.data![index].image, width: 100, height: 100,);
          Text(snapshot.data![index].name);
        },);
      }
    });
  }
}
