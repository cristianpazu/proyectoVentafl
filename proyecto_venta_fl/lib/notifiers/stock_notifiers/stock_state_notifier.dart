import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_venta_fl/Entities/Productos.dart';
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
}
