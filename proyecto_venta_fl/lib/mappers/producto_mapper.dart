 import 'package:proyecto_venta_fl/Entities/Categoria.dart';
import 'package:proyecto_venta_fl/Entities/Productos.dart';
import 'package:proyecto_venta_fl/Entities/Response/ProductoResponse.dart';
import 'package:proyecto_venta_fl/mappers/categoria_mapper.dart';

class ProductoMapper {

static jsonToEntity(Map<String, dynamic> json )=> ProductosResponse(
idProductos: json['idProductos'],
nombre: json['nombre'],
referencia: json['referencia'],
cantidadStock: json['cantidadStock'],
precioVenta: json['precioVenta'],
fechaIngreso: json['fechaIngreso'],
observacion: json['observacion'],
categoriasConcat:  json['categoriasConcat'] , // Permite categoria null en Productos

);

}


