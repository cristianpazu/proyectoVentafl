import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_venta_fl/domain/repositories/producto_repositories.dart';
import 'package:proyecto_venta_fl/infrastructure/repositories/productos_repository_impl.dart';
import 'package:proyecto_venta_fl/notifiers/producto_state.dart';
import 'package:proyecto_venta_fl/notifiers/productos_state.dart';
import 'package:proyecto_venta_fl/providers/productos_repository_provider.dart';

final productoProvider = StateNotifierProvider.autoDispose
    .family<ProductoNotifier, ProductoState, String>((ref, productoId) {
  final productoRepository = ref.watch(productosRepositoryProvider);

  return ProductoNotifier(
      productoRepositories: productoRepository, 
      productoId: productoId);
});

class ProductoNotifier extends StateNotifier<ProductoState> {
  final ProductoRepositories productoRepositories;

  ProductoNotifier(
      {required this.productoRepositories, required String productoId})
      : super(ProductoState(id: productoId));

  Future<void> loadProducto() async {
    try {
      final producto =
          await productoRepositories.getProductosById(state.id ?? '1');

      state = state.copyWith(isLoading: false, producto: producto);
    } catch (e) {}
  }
}
