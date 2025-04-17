import 'package:flutter/material.dart';
import 'data.dart';

class CategoryDetailScreen extends StatelessWidget {
  final Category category;

  const CategoryDetailScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.nombre),
      ),
      body: SingleChildScrollView( // Para hacer que el contenido sea desplazable si es necesario
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Imagen del ejercicio
            Image.asset(
              category.imagen,
              height: 250,
              fit: BoxFit.cover,
            ),

            // Título con estrellas
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category.nombre,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue, // Título en color azul
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${category.nombre} @gmail.com', // Esto agrega el nombre seguido del símbolo '@'
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  // Estrellas
                  Row(
                    children: [
                      // Genera las estrellas
                      ...List.generate(3, (index) {
                        return Icon(
                          index < 2 ? Icons.star : Icons.star_border, // Dos estrellas brillantes, una apagada
                          color: index < 2 ? Colors.yellow : Colors.grey,
                        );
                      }),
                      // Espacio entre las estrellas y el número
                      const SizedBox(width: 8),
                      // Número al lado de las estrellas
                      const Text(
                        '12',
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                      ),
                    ],
                  )
                ]
              ),
            ),

            // Iconos de contacto: Llamar, Mensaje, Foto
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: const [
                      Icon(Icons.call, size: 30, color: Colors.blue,),
                      SizedBox(height: 4),
                      Text('Llamar'),
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(Icons.message, size: 30, color: Colors.blue,),
                      SizedBox(height: 4),
                      Text('Mensaje'),
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(Icons.photo, size: 30, color: Colors.blue,),
                      SizedBox(height: 4),
                      Text('Foto'),
                    ],
                  ),
                ],
              ),
            ),

            // Descripción del ejercicio
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                category.descripcion,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
