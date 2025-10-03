import 'package:proyecto_venta_fl/Entities/Productos.dart';
import 'package:proyecto_venta_fl/Entities/Response/ProductoResponse.dart';

class StockActualizarState {
 final bool isFormvalid;
  final int? idStock;
  final int? cantidadStock;
  final Productos? productos;
   final ProductosResponse? productoSeleccionado; 

  StockActualizarState({
    this.isFormvalid = false,
    this.idStock,
    this.cantidadStock,
    this.productos,
    this.productoSeleccionado
  });

  StockActualizarState copyWith({
    bool? isFormvalid,
    int? idStock,
   int? cantidadStock,
   Productos? productos,
   ProductosResponse? productoSeleccionado
  }) =>
      StockActualizarState(
        isFormvalid: isFormvalid ?? this.isFormvalid,
        idStock: idStock ?? this.idStock,
        cantidadStock:cantidadStock ?? this.cantidadStock,
        productos: productos ?? this.productos,
        productoSeleccionado: productoSeleccionado ?? this.productoSeleccionado
      );
}