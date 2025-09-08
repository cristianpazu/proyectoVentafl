import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:proyecto_venta_fl/Entities/Categoria.dart';
import 'package:proyecto_venta_fl/Entities/Productos.dart';
import 'package:proyecto_venta_fl/notifiers/producto_get_all_notifier/productos_state_motifier.dart';
import 'package:proyecto_venta_fl/notifiers/producto_registre_notifier/producto_actualizar_state.dart';
import 'package:proyecto_venta_fl/providers/productos_repository_provider.dart';

final productoActualizarProvider = StateNotifierProvider.autoDispose
    .family<ProductoActualizarNotifier, ProductoActualizarState, Productos>(
        (ref, producto) {
//  final createUpdateCallback =  ref.watch(productosRepositoryProvider).createUpdateProductos;

  final createUpdateCallback =
      ref.watch(productosProvider.notifier).crearOrUpdateProductos;

  return ProductoActualizarNotifier(
      product: producto, onSubmitCallback: createUpdateCallback);
});

class ProductoActualizarNotifier
    extends StateNotifier<ProductoActualizarState> {
  final Future<bool> Function(Map<String, dynamic> productLike)?
      onSubmitCallback;

  ProductoActualizarNotifier(
      {this.onSubmitCallback, required Productos product})
      : super(ProductoActualizarState(
          idProductos: product.idProductos,
          nombre: product.nombre,
          referencia: product.referencia,
          cantidadStock: product.cantidadStock,
          precioVenta: product.precioVenta,
          fechaIngreso: product.fechaIngreso,
          observacion: product.observacion,
          categorias: product.categorias,
        ));

  void onNombreChanged(String nombre) {
    state = state.copyWith(nombre: nombre);
  }

  void onReferenciaChanged(String referencia) {
    state = state.copyWith(referencia: referencia);
  }

  void onCantidadStockChanged(int cantidadStock) {
    state = state.copyWith(cantidadStock: cantidadStock);
  }

  void onPrecioVentaChanged(int precioVenta) {
    state = state.copyWith(precioVenta: precioVenta);
  }

  void onFechaIngresoChanged(String fechaIngreso) {
    state = state.copyWith(fechaIngreso: fechaIngreso);
  }

  void onObservacionChanged(String observacion) {
    state = state.copyWith(observacion: observacion);
  }

  void onCategoriasChanged(List<Categoria> categorias) {
    state = state.copyWith(categorias: categorias);
  }

  Future<bool> onFOrmSubmit() async {
    if (onSubmitCallback == null) return false;

print('state.idProductos ${state.idProductos}');

    print('productoForm nombre ${state.nombre} ');

    final productLike = {
      'idProductos': (state.idProductos == 999999) ? null : state.idProductos,
      'nombre': state.nombre,
      'referencia': state.referencia,
      'cantidadStock': state.cantidadStock,
      'precioVenta': state.precioVenta,
      'fechaIngreso': state.fechaIngreso,
      'observacion': state.observacion,
      'categorias':  state.categorias!.map((cat) => {'idCategoria': cat.idCategoria}).toList(),
    };
    print('productoForm idProductos ${state.idProductos} ');
    print('productoForm productLike ${productLike} ');

    try {
      return await onSubmitCallback!(productLike);
    } catch (e, stackTrace) {
      print('productoForm productLike $stackTrace');

      print('productoForm productLike $e');
      return false;
    }
  }
}
