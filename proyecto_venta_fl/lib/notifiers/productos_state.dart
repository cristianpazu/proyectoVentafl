import 'package:proyecto_venta_fl/Entities/Productos.dart';

class ProductosState {
  final bool isLoding;
  final List<Productos> productos;

  ProductosState({
    this.isLoding = false,
    this.productos = const [],
  });

  ProductosState copyWith({
    bool? isLoding,
    List<Productos>? productos,
  }) =>
      ProductosState(
          isLoding: isLoding ?? this.isLoding,
          productos: productos ?? this.productos);
}
