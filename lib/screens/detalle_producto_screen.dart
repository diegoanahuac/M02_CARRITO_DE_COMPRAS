import 'package:flutter/material.dart';

import '../models/producto.dart';
import '../theme/app_colors.dart';

/// Pantalla 2: muestra el producto recibido y permite confirmar la compra.
class DetalleProductoScreen extends StatelessWidget {
  const DetalleProductoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Extracción de los argumentos con ModalRoute y seguridad de tipos:
    // se comprueba el tipo con `is` en lugar de hacer un cast ciego.
    final Object? argumentos = ModalRoute.of(context)?.settings.arguments;

    if (argumentos is! Producto) {
      return Scaffold(
        appBar: AppBar(title: const Text('Detalle')),
        body: const Center(child: Text('No se recibió ningún producto.')),
      );
    }

    final Producto producto = argumentos;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detalle del producto',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 220,
              decoration: BoxDecoration(
                color: AppColors.tarjetaIcono,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Icon(producto.icono, size: 120, color: AppColors.naranja),
            ),
            const SizedBox(height: 32),
            Text(
              producto.nombre,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.titulo,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              producto.precioFormateado,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: AppColors.naranja,
              ),
            ),
            const Spacer(),
            FilledButton.icon(
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.naranja,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              icon: const Icon(Icons.shopping_cart_checkout),
              label: const Text('Confirmar', style: TextStyle(fontSize: 18)),
              // Regresa a la pantalla anterior devolviendo el valor `true`.
              onPressed: () => Navigator.pop(context, true),
            ),
          ],
        ),
      ),
    );
  }
}
