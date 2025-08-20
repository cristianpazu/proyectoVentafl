 import 'package:proyecto_venta_fl/Entities/Categoria.dart';
import 'package:proyecto_venta_fl/Entities/Productos.dart';
import 'package:proyecto_venta_fl/mappers/categoria_mapper.dart';

class ProductoMapper {

static jsonToEntity(Map<String, dynamic> json )=> Productos(
id: json['id'],
nombre: json['nombre'],
referencia: json['referencia'],
cantidadStock: json['cantidadStock'],
precioVenta: json['precioVenta'],
fechaIngreso: json['fechaIngreso'],
observacion: json['observacion'],
categoria:  json['categoria'] != null
        ? CategoriaMapper.jsonToEntityMapper(json['categoria'])
        : null, // Permite categoria null en Productos

);

}


