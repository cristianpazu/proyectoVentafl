
import 'package:proyecto_venta_fl/Entities/Categoria.dart';
import 'package:proyecto_venta_fl/Entities/Productos.dart';
import 'package:proyecto_venta_fl/Entities/Response/ProductoResponse.dart';
import 'package:proyecto_venta_fl/Entities/Stock.dart';
enum FiltroStock { todos, alto, bajo }
class StockState {
  final bool isLoding;
  final List<Stock> stock;
  final Stock? stocks;
  final Productos? productos;
   final ProductosResponse? productoSeleccionado;

  StockState({
    this.isLoding = false,
    this.stock = const [],
    this.stocks,
    this.productos, 
    this.productoSeleccionado

  });

  StockState copyWith({
    bool? isLoding,
    List<Stock>? stock,
    Stock? stocks,
    Productos? productos,
  final ProductosResponse? productoSeleccionado
  }) =>
      StockState(
          isLoding: isLoding ?? this.isLoding,
          stock: stock ?? this.stock,
          stocks: stocks ?? this.stocks,
          productos: productos ?? this.productos,
          productoSeleccionado: productoSeleccionado ?? this.productoSeleccionado
          );
}
