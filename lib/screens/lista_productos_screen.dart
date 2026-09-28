import 'package:flutter/material.dart';

import '../models/producto.dart';
import '../routes/app_routes.dart';
import '../theme/app_colors.dart';

/// Pantalla 1: lista estática de 3 productos (nombre y precio).
///
/// Nota: esta pantalla NO importa `detalle_producto_screen.dart`; navega
/// únicamente con el identificador String `AppRoutes.detalleProducto`.
class ListaProductosScreen extends StatelessWidget {
  const ListaProductosScreen({super.key});

  /// Navega al detalle enviando el producto y espera (await) el resultado
  /// que la segunda pantalla devuelve con `Navigator.pop`.
  Future<void> _abrirDetalle(BuildContext context, Producto producto) async {
    // Las rutas del mapa `routes` son MaterialPageRoute<dynamic>, por eso se
    // recibe como Object? y se valida el tipo antes de usarlo.
    final Object? resultado = await Navigator.pushNamed(
      context,
      AppRoutes.detalleProducto,
      arguments: producto,
    );

    if (resultado is bool && resultado) {
      debugPrint('Compra confirmada');
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Compra confirmada: ${producto.nombre}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nuestros Productos',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: productosDisponibles.length,
        separatorBuilder: (_, _) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final producto = productosDisponibles[index];
          return _TarjetaProducto(
            producto: producto,
            onTap: () => _abrirDetalle(context, producto),
          );
        },
      ),
    );
  }
}

class _TarjetaProducto extends StatelessWidget {
  final Producto producto;
  final VoidCallback onTap;

  const _TarjetaProducto({required this.producto, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      elevation: 2,
      shadowColor: Colors.black12,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.tarjetaIcono,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(producto.icono, color: AppColors.naranja, size: 30),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      producto.nombre,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.titulo,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      producto.precioFormateado,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.naranja,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: AppColors.subtitulo),
            ],
          ),
        ),
      ),
    );
  }
}
