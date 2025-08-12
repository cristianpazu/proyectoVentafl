 import 'package:proyecto_venta_fl/Entities/Categoria.dart';
import 'package:proyecto_venta_fl/Entities/Productos.dart';
import 'package:proyecto_venta_fl/mappers/categoria_mapper.dart';

class ProductoMapper {

static jsonToEntity(Map<String, dynamic> json )=> Productos(
id: json['id'],
nombre: json['nombre'],
referencia: json['referencia'],
precioCompra: json['precioCompra'],
fechaIngreso: json['fechaIngreso'],
observacion: json['observacion'],
categoria: CategoriaMapper.jsonToEntityMapper(json['categoria'])

);

}


