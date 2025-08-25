import 'package:proyecto_venta_fl/Entities/Categoria.dart';
import 'package:proyecto_venta_fl/domain/datasource/categoria%20_datasource.dart';
import 'package:proyecto_venta_fl/mappers/categoria_mapper.dart';
import 'package:proyecto_venta_fl/utils/baseUrl.dart';
import 'package:proyecto_venta_fl/utils/http.dart';

class CategoriaDatasorceImpl  extends CategoriaDatasource{
  @override
  Future<List<Categoria>> getAllCategoria()async {
     try {
      final respuesta = await HttpService(Baseurl.consultarCategoria).getHttp();

      final List<Categoria> categoria = [];

      print('object respuesta $respuesta');
      for (var element in respuesta ?? []) {
        print('object element $element');

        categoria.add(CategoriaMapper.jsonToEntityMapper(element));
      }

      print('<<<<<<<<<object>>>>>>>>>>><< ${categoria.length}');

      return categoria;

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
  Future<Categoria> getCategoriaById(int id) {
    // TODO: implement getCategoriaById
    throw UnimplementedError();
  }
 }

