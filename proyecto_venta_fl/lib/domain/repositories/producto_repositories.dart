import 'package:proyecto_venta_fl/Entities/Productos.dart';

abstract class ProductoRepositories {

   Future<List<Productos>> getAllProductos();

   Future<Productos> getProductosById(int id);


  Future<Productos> createUpdateProductos(Map<String, dynamic> productLike);
}