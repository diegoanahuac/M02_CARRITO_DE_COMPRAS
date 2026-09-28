import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:carrito_de_compras/main.dart';

void main() {
  testWidgets('Muestra 3 productos y confirma la compra', (tester) async {
    final logs = <String?>[];
    final originalDebugPrint = debugPrint;
    debugPrint = (String? message, {int? wrapWidth}) => logs.add(message);

    await tester.pumpWidget(const CarritoApp());

    expect(find.text('Tenis Nike Air'), findsOneWidget);
    expect(find.text('Audífonos Bluetooth'), findsOneWidget);
    expect(find.text('Reloj Inteligente'), findsOneWidget);

    // Navega al detalle con pushNamed.
    await tester.tap(find.text('Audífonos Bluetooth'));
    await tester.pumpAndSettle();

    expect(find.text('Detalle del producto'), findsOneWidget);
    expect(find.text('\$749.50'), findsOneWidget);

    // Confirmar hace pop con true y la lista imprime el mensaje.
    await tester.tap(find.text('Confirmar'));
    await tester.pumpAndSettle();

    debugPrint = originalDebugPrint;

    expect(find.text('Nuestros Productos'), findsOneWidget);
    expect(logs, contains('Compra confirmada'));
  });
}
