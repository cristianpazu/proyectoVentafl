import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_venta_fl/Entities/Productos.dart';
import 'package:proyecto_venta_fl/Entities/Stock.dart';
import 'package:proyecto_venta_fl/notifiers/stock_register_notifier/stock_actualizar_state.dart';

final ProductosActualizaProvider = StateNotifierProvider.autoDispose.family<StockActualizarStateNotifier,StockActualizarState, Stock>((ref, stock){

  return StockActualizarStateNotifier(stock:stock );
});



class StockActualizarStateNotifier extends StateNotifier<StockActualizarState> {
  final void Function(Map<String, dynamic> stockLike)? onSubmitCallback;

  StockActualizarStateNotifier({this.onSubmitCallback, required Stock stock})
      : super(StockActualizarState(
          idStock: stock.idStock,
          cantidadStock: stock.cantidadStock,
          productos: stock.productos,
        ));

  Future<bool> onFormSubmit() async {
 if (onSubmitCallback == null) return false;

    final stockLike = {
      'idStock': state.idStock,
      'cantidadStock': state.cantidadStock,
      'productos': state.productos
    };

    return true ;
  }

  void onCantidadStockChanged(int cantidadStock) {
    state = state.copyWith(cantidadStock: cantidadStock);
  }

  void onProducto(Productos productos) {
    state = state.copyWith(productos: productos);
  }
}
