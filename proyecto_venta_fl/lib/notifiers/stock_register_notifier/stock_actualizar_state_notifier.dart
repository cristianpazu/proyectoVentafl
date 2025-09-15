import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_venta_fl/Entities/Productos.dart';
import 'package:proyecto_venta_fl/Entities/Stock.dart';
import 'package:proyecto_venta_fl/notifiers/stock_register_notifier/stock_actualizar_state.dart';

class StockActualizarStateNotifier extends StateNotifier<StockActualizarState>{

  final void Function(Map<String, dynamic> stockLike)? onSubmitCallback;

StockActualizarStateNotifier({this.onSubmitCallback, required Stock stock}): super(
  StockActualizarState(
    idStock: stock.idStock,
    cantidadStock: stock.cantidadStock,
    productos: stock.productos,
  )
);

void onCantidadStockChanged(int cantidadStock){
  state =state.copyWith(cantidadStock: cantidadStock);
}

void onProducto(Productos productos){
state = state.copyWith(productos: productos);
}



}