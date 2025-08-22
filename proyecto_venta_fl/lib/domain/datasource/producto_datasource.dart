

import 'package:proyecto_venta_fl/Entities/Productos.dart';

abstract class ProductoDatasource {
  Future<List<Productos>> getAllProductos();

  Future<Productos> getProductosById(String id);


  Future<Productos> createUpdateProductos(Map<String, dynamic> productLike);



}