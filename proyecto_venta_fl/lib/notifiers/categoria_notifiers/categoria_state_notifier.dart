import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_venta_fl/Entities/Categoria.dart';
import 'package:proyecto_venta_fl/domain/repositories/categoria_repositories.dart';
import 'package:proyecto_venta_fl/domain/repositories/producto_repositories.dart';
import 'package:proyecto_venta_fl/notifiers/categoria_notifiers/categoria_state.dart';
import 'package:proyecto_venta_fl/notifiers/productos_state.dart';
import 'package:proyecto_venta_fl/providers/categoria_repository_provider.dart';
import 'package:proyecto_venta_fl/providers/productos_repository_provider.dart';

final categoriasProvider =
    StateNotifierProvider<CategoriaNotifier, CategoriaState>((ref) {
  final categoriaREpository = ref.watch(categpriaRepositoryProvider);

  return CategoriaNotifier(categoriaRepositories: categoriaREpository);
});

class CategoriaNotifier extends StateNotifier<CategoriaState> {
  final CategoriaRepositories categoriaRepositories;

  CategoriaNotifier({
    required this.categoriaRepositories})
      : super(CategoriaState()) {
    traerCategorias();
  }

  Future traerCategorias() async {
    if (state.isLoding) return;

    state = state.copyWith(
      isLoding: true,
    );

    final categoria = await categoriaRepositories.getAllCategoria();

    if (categoria.isEmpty) {
      state = state.copyWith(
        isLoding: false,
      );
      return;
    }
    

    state = state.copyWith(
        isLoding: false, 
        categoria: [...state.categoria, ...categoria]);
  }
}
