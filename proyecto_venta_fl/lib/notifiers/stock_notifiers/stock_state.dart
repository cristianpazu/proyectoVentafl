
import 'package:proyecto_venta_fl/Entities/Categoria.dart';
import 'package:proyecto_venta_fl/Entities/Stock.dart';
enum FiltroStock { todos, alto, bajo }
class StockState {
  final bool isLoding;
  final List<Stock> stock;

  StockState({
    this.isLoding = false,
    this.stock = const [],
  });

  StockState copyWith({
    bool? isLoding,
    List<Stock>? stock,
  }) =>
      StockState(
          isLoding: isLoding ?? this.isLoding,
          stock: stock ?? this.stock);
}
