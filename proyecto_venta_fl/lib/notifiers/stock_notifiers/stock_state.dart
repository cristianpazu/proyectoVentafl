
import 'package:proyecto_venta_fl/Entities/Categoria.dart';
import 'package:proyecto_venta_fl/Entities/Productos.dart';
import 'package:proyecto_venta_fl/Entities/Stock.dart';
enum FiltroStock { todos, alto, bajo }
class StockState {
  final bool isLoding;
  final List<Stock> stock;
  final Stock? stocks;
  final Productos? productos;

  StockState({
    this.isLoding = false,
    this.stock = const [],
    this.stocks,
    this.productos, 

  });

  StockState copyWith({
    bool? isLoding,
    List<Stock>? stock,
    Stock? stocks,
    Productos? productos,
  }) =>
      StockState(
          isLoding: isLoding ?? this.isLoding,
          stock: stock ?? this.stock,
          stocks: stocks ?? this.stocks,
          productos: productos ?? this.productos
          );
}
