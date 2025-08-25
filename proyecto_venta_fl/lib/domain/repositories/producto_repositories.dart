import 'package:proyecto_venta_fl/Entities/Productos.dart';
import 'package:proyecto_venta_fl/Entities/Response/ProductoResponse.dart';

abstract class ProductoRepositories {

   Future<List<ProductosResponse>> getAllProductos();

   Future<Productos> getProductosById(int id);


  Future<Productos> createUpdateProductos(Map<String, dynamic> productLike);
}