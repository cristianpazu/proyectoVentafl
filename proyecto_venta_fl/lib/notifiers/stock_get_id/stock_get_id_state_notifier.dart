import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_venta_fl/Entities/Productos.dart';
import 'package:proyecto_venta_fl/Entities/Stock.dart';
import 'package:proyecto_venta_fl/domain/repositories/stock_repositories.dart';
import 'package:proyecto_venta_fl/notifiers/producto_get_all_notifier/productos_state_motifier.dart';
import 'package:proyecto_venta_fl/notifiers/stock_get_id/stock_get_id_state.dart';
import 'package:proyecto_venta_fl/notifiers/stock_notifiers/stock_state_notifier.dart';
import 'package:proyecto_venta_fl/providers/stock_repository_provider.dart';

import '../../Entities/Response/ProductoResponse.dart';

final stockProviderId = StateNotifierProvider.autoDispose
    .family<StockIdNotifier, StockGetIdState, int>((ref, stockId) {
  final stockRepository = ref.watch(stockRepositoryProvider);
  return StockIdNotifier(
      stockRepositories: stockRepository, ref: ref, stockId: stockId);
});

class StockIdNotifier extends StateNotifier<StockGetIdState> {
  final StockRepositories stockRepositories;
  final Ref ref;
  StockIdNotifier(
      {required this.stockRepositories,
      required this.ref,
      required int stockId})
      : super(StockGetIdState(idStock: stockId)) {
    loadStock();
  }

  Stock newEmptyProducto() {
    final productoState = ref.watch(stockProvider);
        final listProductoState = ref.watch(productosProvider);
    final Productos? productosDisponibles = productoState.productos;
    print('||||||||||||||||||| $productosDisponibles ');


final List<ProductosResponse> productoDisponibles = listProductoState.productos;


  final productosPorDefecto = productoDisponibles.firstWhere(
    (cat) => cat.idProductos == 1,
    orElse: () => ProductosResponse(idProductos: 0, nombre: 'Desconocida'),
  );





    final as = Stock(idStock: 999999, productos: productosDisponibles);

    print('>>>>>>>>>>><<<<<<<<<<<<< ${as.toJson()}');
    return as;
  }

  Future<void> loadStock() async {
    try {
      if (state.idStock == 999999) {
       
       print('entre aquiiiiiiiiiii ${state.idStock}');
        state = state.copyWith(
          isLoading: false,
          stock: newEmptyProducto(),
        );
        return;
      }

      final stock = await stockRepositories.getStockById(state.idStock!);

      state = state.copyWith(isLoading: false, stock: stock);
    } catch (e, stackTrace) {
      print('Error al cargar producto: $e');
      print('Stack trace: $stackTrace');
    }
  }
}
