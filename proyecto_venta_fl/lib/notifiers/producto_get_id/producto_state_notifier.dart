import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:proyecto_venta_fl/Entities/Categoria.dart';
import 'package:proyecto_venta_fl/Entities/Productos.dart';
import 'package:proyecto_venta_fl/domain/repositories/producto_repositories.dart';
import 'package:proyecto_venta_fl/infrastructure/repositories/productos_repository_impl.dart';
import 'package:proyecto_venta_fl/notifiers/producto_get_id/producto_state.dart';
import 'package:proyecto_venta_fl/notifiers/producto_get_all_notifier/productos_state.dart';
import 'package:proyecto_venta_fl/providers/productos_repository_provider.dart';

final productoProvider = StateNotifierProvider.autoDispose
    .family<ProductoNotifier, ProductoState, int>((ref, productoId) {
  final productoRepository = ref.watch(productosRepositoryProvider);

  return ProductoNotifier(
      productoRepositories: productoRepository, 
      productoId: productoId);
});

class ProductoNotifier extends StateNotifier<ProductoState> {
  final ProductoRepositories productoRepositories;

  ProductoNotifier(
      {required this.productoRepositories, required int productoId})
      : super(ProductoState(idProductos: productoId)) {
    loadProducto();
  }

  String fechaFormateada = DateFormat('yyyy-MM-dd').format(DateTime.now());

  Productos newEmptyProducto() {
    final as = Productos(
        idProductos: 999999,
        nombre:  '',
        referencia: '',
        cantidadStock: 0,
        precioVenta: 0,
        fechaIngreso: fechaFormateada,
        observacion: '',
        categorias: []);

    print('>>>>>>>>>>><<<<<<<<<<<<< ${as.toJson()}');
    return as;
  }

  Future<void> loadProducto() async {
    try {
      if (state.idProductos == 999999) {
     
        state = state.copyWith(
          isLoading: false,
          producto: newEmptyProducto(),
        );
  print('objectobject ${state.producto?.toJson()}');
        return;
      }

      final producto =
          await productoRepositories.getProductosById(state.idProductos!);

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
