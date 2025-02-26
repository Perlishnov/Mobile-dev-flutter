import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Color(0xFFE4002B),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Juego de dados',style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),),
          backgroundColor: Color(0xFFE4002B),
        ),
        body: DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
   int dadoIzquierda = 1;
   int dadoDerecho = 1;
   String mensaje = "Lanza los dados";

   //funcion para lanzar los dados
   void lanzarDados(){
     setState(() {
     dadoIzquierda = Random().nextInt(6)+1;
     dadoDerecho = Random().nextInt(6)+1;
      if (dadoIzquierda > dadoDerecho){
        mensaje = "Gano la izquierda";
      }
      else if (dadoIzquierda == dadoDerecho){
        mensaje = "EMPATE";
      }
      else{
        mensaje = "Gano la derecha";
      }
     });
   }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,

          ),
          Text(mensaje, style: TextStyle(
            fontSize: 50,

          ), textAlign: TextAlign.center,),
          Row(
            children: [
              Expanded(child: TextButton(onPressed: () {
                lanzarDados();
              },
              child: Image.asset('images/dice-$dadoIzquierda.png'),)),
              Expanded(child: TextButton(onPressed: lanzarDados,
              child: Image.asset('images/dice-$dadoDerecho.png'))),
            ],
          )
        ],
      ),
    );
  }
}
