import 'package:flutter/material.dart';
import 'package:meal_app/components/categoryViewItemDescription.dart';
import 'package:meal_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart' as transLib;

class categoryViewItem extends StatelessWidget {
  const categoryViewItem({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => categoryViewItemDescription(
              mealData: meal,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Stack(
          children: [
            FadeInImage.memoryNetwork(
              placeholder: transLib.kTransparentImage,
              image: meal.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 250,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      meal.title,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.schedule, color: Colors.white),
                            const SizedBox(width: 5),
                            Text(
                              '${meal.duration} min',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.work, color: Colors.white),
                            const SizedBox(width: 5),
                            Text(
                              meal.complexity.toString().split('.').last,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.attach_money, color: Colors.white),
                            const SizedBox(width: 5),
                            Text(
                              meal.affordability.toString().split('.').last,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
