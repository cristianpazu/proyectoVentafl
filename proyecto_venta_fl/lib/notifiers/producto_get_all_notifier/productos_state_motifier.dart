import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_venta_fl/Entities/Response/ProductoResponse.dart';
import 'package:proyecto_venta_fl/domain/repositories/producto_repositories.dart';
import 'package:proyecto_venta_fl/mappers/producto_mapper.dart';
import 'package:proyecto_venta_fl/notifiers/producto_get_all_notifier/productos_state.dart';
import 'package:proyecto_venta_fl/providers/productos_repository_provider.dart';

final productosProvider =
    StateNotifierProvider<ProductosNotifier, ProductosState>((ref) {
  final productosREpository = ref.watch(productosRepositoryProvider);

  return ProductosNotifier(productoRepositories: productosREpository);
});

class ProductosNotifier extends StateNotifier<ProductosState> {
  final ProductoRepositories productoRepositories;

  ProductosNotifier({required this.productoRepositories})
      : super(ProductosState()) {
    traerProductos();
  }

  

  Future<bool> crearOrUpdateProductos(Map<String, dynamic> productoLike) async {
    try {
  

      final product = await productoRepositories.createUpdateProductos(productoLike);

    

      //  final productos1 = ProductoMapper.jsonToEntity(product as Map<String, dynamic>);

      final isProductoInList = state.productos.any((element) => element.idProductos == product.idProductos);
     

      if (!isProductoInList) {
        state = state.copyWith(productos: [...state.productos, product]);
      
        return true;
      }

      state = state.copyWith(
        productos: state.productos
            .map((element) => (element.idProductos == product.idProductos)
                ? product
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

  Future traerProductos() async {
    try {





      if (state.isLoding) return;

      state = state.copyWith(
        isLoding: true,
      );

      final productos = await productoRepositories.getAllProductos();

      if (productos.isEmpty) {
        state = state.copyWith(
          isLoding: false,
        );
        return;
      }

      state = state.copyWith(
          isLoding: false, productos: [...state.productos, ...productos]);
    } catch (e) {}
  }
}
