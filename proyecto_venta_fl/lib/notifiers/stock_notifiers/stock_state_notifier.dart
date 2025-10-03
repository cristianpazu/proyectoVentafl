import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_venta_fl/Entities/Productos.dart';
import 'package:proyecto_venta_fl/Entities/Response/ProductoResponse.dart';
import 'package:proyecto_venta_fl/Entities/Stock.dart';
import 'package:proyecto_venta_fl/domain/repositories/stock_repositories.dart';
import 'package:proyecto_venta_fl/notifiers/categoria_notifiers/categoria_state.dart';
import 'package:proyecto_venta_fl/notifiers/stock_notifiers/stock_state.dart';
import 'package:proyecto_venta_fl/providers/stock_repository_provider.dart';

final stockProvider = StateNotifierProvider<StockNotifier, StockState>((ref) {
  final stockRepository = ref.watch(stockRepositoryProvider);

  return StockNotifier(stockRepositories: stockRepository);
});

class StockNotifier extends StateNotifier<StockState> {
  final StockRepositories stockRepositories;

  StockNotifier({required this.stockRepositories}) : super(StockState()) {
    traerStock();
  }


  Future<bool> crearOrUpdateProductos(Map<String, dynamic> stockLike) async {
    try {
  

      final stock = await stockRepositories.createUpdateStock(stockLike);

    print('stockLike ${stockLike}');

    print('stockLike ${stock.productos?.toJson()}');
      //  final productos1 = ProductoMapper.jsonToEntity(product as Map<String, dynamic>);

      final isStockInList = state.stock.any((element) => element.idStock == stock.idStock);
     

      if (!isStockInList) {
        state = state.copyWith(stock: [stock, ...state.stock]);
      
        return true;
      }

      state = state.copyWith(
        stock: state.stock
            .map((element) => (element.idStock == stock.idStock)
                ? stock
                : element)
            .toList(),
      );

    
      return true;
    } catch (e, stackTrace) {
      print('Error en crearOrUpdateProductos: $e');
      print('StackTrace: $stackTrace');
      return false;
    }
  }


  Future traerStock() async {
    if (state.isLoding) return;

    state = state.copyWith(
      isLoding: true,
    );

    final stock = await stockRepositories.getAllStock();

    if (stock.isEmpty) {
      state = state.copyWith(
        isLoding: false,
      );
      return;
    }

    state = state.copyWith(isLoding: false, stock: [...state.stock, ...stock]);
  }

   void updateStocks(Productos nuevasProductos) {
    if (state.stock == null) return;

    final updatedProducto =
        state.stocks!.copyWith(productos: nuevasProductos);

    state = state.copyWith(stocks: updatedProducto);
  }
    void seleccionarProducto(ProductosResponse producto) {
    state = state.copyWith(productoSeleccionado: producto);
  }
}
