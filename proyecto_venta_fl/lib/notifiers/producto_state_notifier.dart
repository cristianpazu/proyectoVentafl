import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_venta_fl/Entities/Categoria.dart';
import 'package:proyecto_venta_fl/domain/repositories/producto_repositories.dart';
import 'package:proyecto_venta_fl/infrastructure/repositories/productos_repository_impl.dart';
import 'package:proyecto_venta_fl/notifiers/producto_state.dart';
import 'package:proyecto_venta_fl/notifiers/productos_state.dart';
import 'package:proyecto_venta_fl/providers/productos_repository_provider.dart';

final productoProvider = StateNotifierProvider.autoDispose
    .family<ProductoNotifier, ProductoState, int>((ref, productoId) {
  final productoRepository = ref.watch(productosRepositoryProvider);

  return ProductoNotifier(
      productoRepositories: productoRepository, productoId: productoId);
});

class ProductoNotifier extends StateNotifier<ProductoState> {
  final ProductoRepositories productoRepositories;

  ProductoNotifier(
      {required this.productoRepositories, required int productoId})
      : super(ProductoState(id: productoId)) {
    loadProducto();
  }

  Future<void> loadProducto() async {
    try {
      print('entre aquiiiiiiiii111 ${state.id}');

      final producto =
          await productoRepositories.getProductosById(state.id ?? 1);
    //  print('entre aquiiiiiiiii ${producto.categoria}');
      state = state.copyWith(isLoading: false, producto: producto);
    } catch (e, stackTrace) {
    print('Error al cargar producto: $e');
    print('Stack trace: $stackTrace');
  }
  }

  void updateCategorias(List<Categoria> nuevasCategorias) {
    if (state.producto == null) return;

    final updatedProducto =
        state.producto!.copyWith(categorias: nuevasCategorias);

    state = state.copyWith(producto: updatedProducto);
  }
}
