import 'package:flutter/material.dart';

class Category {
    final String id;
    final String nombre;
    final String imagen;
    final String descripcion;

    const Category({
        required this.id,
        required this.nombre,
        required this.imagen,
        required this.descripcion,
    });
}

const List<Category> dummyCategories = [
    Category(
        id: 'c1',
        nombre: 'Pesas',
        imagen: 'assets/img/pesas.jpg',
        descripcion: 'Trabajo con pesas....',
    ),
    Category(
        id: 'c2',
        nombre: 'Cinta Elastica',
        imagen: 'assets/img/cinta.jpg',
        descripcion: 'Trabajo con cinta 4 repeticiones de 15',
    ),
    Category(
        id: 'c3',
        nombre: 'Cinta',
        imagen: 'assets/img/cinta2.jpg',
        descripcion: 'Trabajo con cinta 2 repeticiones de 15',
    ),
    Category(
        id: 'c4',
        nombre: 'Abdomen',
        imagen: 'assets/img/abdomen2.jpg',
        descripcion: 'Abdomen alto...',
    ),
    Category(
        id: 'c5',
        nombre: 'Peso',
        imagen: 'assets/img/pesas.jpg',
        descripcion: 'Trabajo pesas de 5kg',
    ),
    Category(
        id: 'c6',
        nombre: 'Gluteos',
        imagen: 'assets/img/gluteos.jpg',
        descripcion: 'Trabajo con cinta 4 repeticiones de 15',
    ),
    Category(
        id: 'c7',
        nombre: 'Mas Gluteos',
        imagen: 'assets/img/gluteos2.jpg',
        descripcion: 'Trabajo con cinta 4 repeticiones de 15',
    ),
    Category(
        id: 'c8',
        nombre: 'Barra',
        imagen: 'assets/img/barra2.jpg',
        descripcion: 'Trabajo con cinta 4 repeticiones de 15',
    ),
    Category(
        id: 'c9',
        nombre: 'Rusa',
        imagen: 'assets/img/otro.png',
        descripcion: 'Trabajo con cinta 4 repeticiones de 15',
    ),
    Category(
        id: 'c10',
        nombre: 'Cinta Elastica',
        imagen: 'assets/img/cinta2.jpg',
        descripcion: 'Trabajo con cinta 4 repeticiones de 15',
    ),
    Category(
        id: 'c11',
        nombre: 'Peso z',
        imagen: 'assets/img/pesas.jpg',
        descripcion: 'Trabajo con cinta 4 repeticiones de 15',
    ),
    Category(
        id: 'c12',
        nombre: 'Mancuernas',
        imagen: 'assets/img/mancuernas.jpg',
        descripcion: 'Trabajo con cinta 4 repeticiones de 15',
    ),
    Category(
        id: 'c13',
        nombre: 'Estiramiento',
        imagen: 'assets/img/estiramiento.jpg',
        descripcion: 'Trabajo con cinta 4 repeticiones de 15',
    ),
    Category(
        id: 'c14',
        nombre: 'Otro',
        imagen: 'assets/img/otro.png',
        descripcion: 'Fortalece pierna y Gluteos',
    ),
    Category(
        id: 'c15',
        nombre: 'Otro+',
        imagen: 'assets/img/otro1.png',
        descripcion: 'Pierna y Gluteos',
    ),
    Category(
        id: 'c16',
        nombre: 'Barra de 5k',
        imagen: 'assets/img/barra.jpg',
        descripcion: 'Trabajo con cinta 4 repeticiones de 15',
    ),
];
