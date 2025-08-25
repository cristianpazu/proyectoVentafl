
import 'package:proyecto_venta_fl/Entities/Categoria.dart';

class CategoriaState {
  final bool isLoding;
  final List<Categoria> categoria;

  CategoriaState({
    this.isLoding = false,
    this.categoria = const [],
  });

  CategoriaState copyWith({
    bool? isLoding,
    List<Categoria>? categoria,
  }) =>
      CategoriaState(
          isLoding: isLoding ?? this.isLoding,
          categoria: categoria ?? this.categoria);
}
