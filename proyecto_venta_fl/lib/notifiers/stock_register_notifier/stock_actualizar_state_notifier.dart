import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_venta_fl/Entities/Productos.dart';
import 'package:proyecto_venta_fl/Entities/Response/ProductoResponse.dart';
import 'package:proyecto_venta_fl/Entities/Stock.dart';
import 'package:proyecto_venta_fl/notifiers/stock_notifiers/stock_state_notifier.dart';
import 'package:proyecto_venta_fl/notifiers/stock_register_notifier/stock_actualizar_state.dart';
import 'package:proyecto_venta_fl/providers/stock_repository_provider.dart';

final StocksActualizaProvider = StateNotifierProvider.autoDispose.family<StockActualizarStateNotifier,StockActualizarState, Stock>((ref, stock){

//final createUpdateCallback = ref.watch(stockRepositoryProvider).createUpdateStock;
 final createUpdateCallback =
      ref.watch(stockProvider.notifier).crearOrUpdateProductos;


  return StockActualizarStateNotifier(
    stock:stock ,
    onSubmitCallback: createUpdateCallback,
    );
});



class StockActualizarStateNotifier extends StateNotifier<StockActualizarState> {
  final Future<bool> Function(Map<String, dynamic> stockLike)? onSubmitCallback;

  StockActualizarStateNotifier({this.onSubmitCallback, required Stock stock})
      : super(StockActualizarState(
          idStock: stock.idStock,
          cantidadStock: stock.cantidadStock,
          productos: stock.productos,
        ));

  Future<bool> onFormSubmit() async {
 if (onSubmitCallback == null) return false;

    final stockLike = {
      'idStock': (state.idStock == 999999) ? null : state.idStock,
      'cantidadStock': state.cantidadStock,
      'productos': (state.productos?.toJson() ?? {}) as Map<String, dynamic>,
    };


    print('stockLike $stockLike');

 try {
      return await onSubmitCallback!(stockLike);
        
    } catch (e, stackTrace) {
      print('productoForm stockLike $stackTrace');

      print('productoForm stockLike $e');
      return false;
    }
  }

  void onCantidadStockChanged(int cantidadStock) {
    state = state.copyWith(cantidadStock: cantidadStock);
  }

  void onProducto(Productos productos) {
    state = state.copyWith(productos: productos);
  }

    void seleccionarProducto(Productos producto) {
    state = state.copyWith(productos: producto);
  }
}
