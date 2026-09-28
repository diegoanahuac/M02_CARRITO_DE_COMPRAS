# M02 · Carrito de Compras

App Flutter de dos pantallas que simula un carrito de compras básico usando
**rutas nombradas** y **paso de información bidireccional**.

## Estructura

```
lib/
├── main.dart                         # MaterialApp + mapa `routes` (único archivo que importa las pantallas)
├── routes/app_routes.dart            # Identificadores String de las rutas
├── models/producto.dart              # Modelo Producto + lista estática de 3 productos
├── theme/app_colors.dart             # Paleta (inspirada en flutter_ecommerce_app)
└── screens/
    ├── lista_productos_screen.dart   # Pantalla 1: lista de productos
    └── detalle_producto_screen.dart  # Pantalla 2: detalle + botón Confirmar
```

## Cómo cumple la rúbrica

### Configuración y ejecución de rutas nombradas
- `MaterialApp` se configura con `initialRoute` y `routes` en `main.dart`.
- Se navega con `Navigator.pushNamed(context, AppRoutes.detalleProducto, ...)`,
  usando identificadores tipo `String` (`'/'` y `'/detalle-producto'`).
- `lista_productos_screen.dart` **no importa** `detalle_producto_screen.dart`;
  solo conoce el nombre de la ruta.

### Paso de información bidireccional
- **Ida:** el producto (nombre y precio) se envía con `arguments: producto`.
- **Extracción con seguridad de tipos:** en el destino se lee
  `ModalRoute.of(context)?.settings.arguments` y se valida con `is Producto`
  antes de usarlo (si no llega un producto, se muestra un mensaje en lugar de fallar).
- **Regreso:** el botón **Confirmar** ejecuta `Navigator.pop(context, true)`.
- **Espera del resultado:** la primera pantalla hace
  `await Navigator.pushNamed(...)` dentro de un método `async`; si el resultado
  es `true`, imprime en consola **`Compra confirmada`** (y muestra un SnackBar).

## Ejecutar

```bash
flutter pub get
flutter run
flutter test   # prueba el flujo completo: lista → detalle → Confirmar → "Compra confirmada"
```
