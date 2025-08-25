import 'package:proyecto_venta_fl/Entities/Productos.dart';
import 'package:proyecto_venta_fl/Entities/Response/ProductoResponse.dart';

class ProductosState {
  final bool isLoding;
  final List<ProductosResponse> productos;

  ProductosState({
    this.isLoding = false,
    this.productos = const [],
  });

  ProductosState copyWith({
    bool? isLoding,
    List<ProductosResponse>? productos,
  }) =>
      ProductosState(
          isLoding: isLoding ?? this.isLoding,
          productos: productos ?? this.productos);
}
