import 'package:dio/dio.dart';
import 'package:proyecto_venta_fl/Entities/Productos.dart';
import 'package:proyecto_venta_fl/domain/datasource/producto_datasource.dart';
import 'package:proyecto_venta_fl/infrastructure/errors/product_errors.dart';
import 'package:proyecto_venta_fl/mappers/producto_mapper.dart';
import 'package:proyecto_venta_fl/utils/baseUrl.dart';
import 'package:proyecto_venta_fl/utils/http.dart';

class ProductosDatasourceImpl extends ProductoDatasource {
  @override
  Future<Productos> createUpdateProductos(Map<String, dynamic> productLike) {
    // TODO: implement createUpdateProductos
    throw UnimplementedError();
  }

  @override
  Future<List<Productos>> getAllProductos() async {
    try {
      final respuesta = await HttpService(Baseurl.consultarProductos).getHttp();

      final List<Productos> productos = [];

      print('object respuesta $respuesta');
      for (var element in respuesta ?? []) {
        print('object element $element');

        productos.add(ProductoMapper.jsonToEntity(element));
      }

      print('<<<<<<<<<object>>>>>>>>>>><< ${productos.length}');

      return productos;

/*
 if (respuesta != null && respuesta is List) {
      // Parsear la lista de productos
      return respuesta.map((item) => Productos.fromJson(item)).toList();
    } else {
      return [];
    } */
    } catch (e) {
      print('Error: $e');
      return []; // O puedes lanzar una excepción si prefieres
    }
  }

  @override
  Future<Productos> getProductosById(String id) async {
    try {
      final respuesta =
          await HttpService(Baseurl.consultarProductoId).getHttp();

      final productos = ProductoMapper.jsonToEntity(respuesta);

      return productos;
    } on DioException catch (e) {
      if (e.response!.statusCode == 404 || e.response!.statusCode == 500)
        throw ProductosNotFound();

      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }
}
