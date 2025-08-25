

import 'package:proyecto_venta_fl/Entities/Productos.dart';
import 'package:proyecto_venta_fl/Entities/Response/ProductoResponse.dart';
import 'package:proyecto_venta_fl/domain/datasource/producto_datasource.dart';
import 'package:proyecto_venta_fl/domain/repositories/producto_repositories.dart';

class ProductosRepositoryImpl extends ProductoRepositories {



final ProductoDatasource productoDatasource;


ProductosRepositoryImpl(this.productoDatasource);


  @override
  Future<Productos> createUpdateProductos(Map<String, dynamic> productLike) {
    // TODO: implement createUpdateProductos
    throw UnimplementedError();
  }

  @override
  Future<List<ProductosResponse>> getAllProductos() {
   return productoDatasource.getAllProductos();
  }

  @override
  Future<Productos> getProductosById(int id) {
   return productoDatasource.getProductosById(id);
  }


  
 }