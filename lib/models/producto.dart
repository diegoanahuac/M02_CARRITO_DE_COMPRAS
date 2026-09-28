import 'package:flutter/material.dart';

/// Modelo de datos de un producto del carrito.
///
/// Se usa como argumento tipado al navegar con rutas nombradas, así la
/// pantalla destino puede extraerlo con seguridad de tipos.
class Producto {
  final String nombre;
  final double precio;
  final IconData icono;

  const Producto({
    required this.nombre,
    required this.precio,
    required this.icono,
  });

  String get precioFormateado => '\$${precio.toStringAsFixed(2)}';
}

/// Lista estática de 3 productos que se muestra en la primera pantalla.
const List<Producto> productosDisponibles = [
  Producto(
    nombre: 'Tenis Nike Air',
    precio: 1899.00,
    icono: Icons.directions_run,
  ),
  Producto(
    nombre: 'Audífonos Bluetooth',
    precio: 749.50,
    icono: Icons.headphones,
  ),
  Producto(nombre: 'Reloj Inteligente', precio: 2499.99, icono: Icons.watch),
];
