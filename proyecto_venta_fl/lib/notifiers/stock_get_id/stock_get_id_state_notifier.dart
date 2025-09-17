import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_venta_fl/domain/repositories/stock_repositories.dart';
import 'package:proyecto_venta_fl/notifiers/stock_get_id/stock_get_id_state.dart';
import 'package:proyecto_venta_fl/providers/stock_repository_provider.dart';

final stockProviderId = StateNotifierProvider.autoDispose.family<StockIdNotifier,StockGetIdState,int>((ref, stockId) {
  

   final stockRepository = ref.watch(stockRepositoryProvider);
return StockIdNotifier(
  stockRepositories: stockRepository, 
  ref: ref, 
  stockId: stockId);
});



class StockIdNotifier extends StateNotifier<StockGetIdState> {
    final StockRepositories stockRepositories;
    final Ref ref;
    StockIdNotifier({
       required this.stockRepositories,
       required this.ref, 
       required int stockId
    }) : super(StockGetIdState(idStock: stockId)) {
    loadStock();
  }



     Future<void> loadStock() async {
    try {
     

      final stock = 
          await stockRepositories.getStockById(state.idStock!);

      state = state.copyWith(isLoading: false, stock: stock);
    } catch (e, stackTrace) {
      print('Error al cargar producto: $e');
      print('Stack trace: $stackTrace');
    }
  }



}