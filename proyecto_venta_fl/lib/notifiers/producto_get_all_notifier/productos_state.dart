import 'package:proyecto_venta_fl/Entities/Productos.dart';
import 'package:proyecto_venta_fl/Entities/Response/ProductoResponse.dart';

class ProductosState {
  final bool isLoding;
  final List<ProductosResponse> productos;
   final List<Productos>? productos1;
  final ProductosResponse? productoSeleccionado; 

  ProductosState({
    this.isLoding = false,
    this.productos = const [],
    this.productos1,
     this.productoSeleccionado,
  });

  ProductosState copyWith({
    bool? isLoding,
    List<ProductosResponse>? productos,
    List<Productos>? productos1,
    ProductosResponse? productoSeleccionado,
  }) =>
      ProductosState(
          isLoding: isLoding ?? this.isLoding,
          productos: productos ?? this.productos,
          productos1: productos1 ?? this.productos1,
          productoSeleccionado: productoSeleccionado ?? this.productoSeleccionado
          );
}
