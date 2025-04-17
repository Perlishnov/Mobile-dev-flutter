import 'package:flutter/material.dart';
// Asegúrate de importar o definir la pantalla CalculadoraIMC en tu proyecto.
import 'calculadora_imc.dart';
import 'category_grid.dart';
import 'nosotros.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fitness 2025 Copyright'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.yellow,
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Imagen de fondo
                  Image.asset(
                    'assets/img/estiramiento.jpg',
                    fit: BoxFit.cover,
                  ),
                  // Capa semi-transparente para mejorar visibilidad del texto
                  Container(
                    color: Colors.black.withOpacity(0.4),
                  ),
                  // Texto centrado
                  const Center(
                    child: Text(
                      'Ejercicios',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Calculadora IMC
            ListTile(
              title: const Text("Calculadora IMC"),
              trailing: const Icon(Icons.fitness_center),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CalculatorHome(),
                ),
              ),
            ),
            const Divider(),
            // Soporte
            ListTile(
              title: const Text("Soporte"),
              trailing: const Icon(Icons.help),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Nosotros(),
                ),
              ),
            ),
          ],
        ),
      ),
      body: CategoryGrid(),
    );
  }
}

