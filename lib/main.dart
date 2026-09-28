import 'package:flutter/material.dart';

import 'routes/app_routes.dart';
import 'screens/detalle_producto_screen.dart';
import 'screens/lista_productos_screen.dart';
import 'theme/app_colors.dart';

void main() {
  runApp(const CarritoApp());
}

class CarritoApp extends StatelessWidget {
  const CarritoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carrito de Compras',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.naranja),
        scaffoldBackgroundColor: AppColors.fondo,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.fondo,
          foregroundColor: AppColors.titulo,
          elevation: 0,
          centerTitle: true,
        ),
      ),
      // Configuración central de rutas nombradas: este es el ÚNICO archivo
      // que conoce (importa) las pantallas.
      initialRoute: AppRoutes.listaProductos,
      routes: {
        AppRoutes.listaProductos: (context) => const ListaProductosScreen(),
        AppRoutes.detalleProducto: (context) => const DetalleProductoScreen(),
      },
    );
  }
}
