import 'package:flutter/material.dart';
import 'category_detail_screen.dart';
import 'data.dart'; // Asegúrate de importar tu archivo con `dummyCategories`

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: dummyCategories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // dos columnas
        childAspectRatio: 3 / 4, // relación de aspecto para altura
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, index) {
        final category = dummyCategories[index];
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CategoryDetailScreen(category: category),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Imagen arriba con altura controlada
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                  child: SizedBox(
                    height: 140,
                    child: Image.asset(
                      category.imagen,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Texto centrado
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    category.nombre,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
