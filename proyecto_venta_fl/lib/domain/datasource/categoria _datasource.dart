import 'package:proyecto_venta_fl/Entities/Categoria.dart';
import 'package:proyecto_venta_fl/Entities/Productos.dart';
import 'package:proyecto_venta_fl/Entities/Response/ProductoResponse.dart';

abstract class CategoriaDatasource {
  Future<List<Categoria>> getAllCategoria();

  Future<Categoria> getCategoriaById(int id);
}
