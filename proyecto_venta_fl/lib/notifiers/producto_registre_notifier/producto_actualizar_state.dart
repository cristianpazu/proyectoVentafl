import 'dart:ffi';

import 'package:proyecto_venta_fl/Entities/Categoria.dart';

class ProductoActualizarState {
final bool isFormvalid;
final int? idProductos;
final String? nombre;
final String? referencia;
final int? precioVenta;
final String? fechaIngreso;
final String? observacion;
final List<Categoria>? categorias;


ProductoActualizarState({
this.isFormvalid = false,
this.idProductos,
this.nombre,
this.referencia,
this.precioVenta,
this.fechaIngreso,
this.observacion,
this.categorias = const [],
});

ProductoActualizarState copyWith({
 bool? isFormvalid,
 int? idProductos,
 String? nombre,
 String? referencia,
 int? precioVenta,
 String? fechaIngreso,
 String? observacion,
 List<Categoria>? categorias,
}) => ProductoActualizarState(
isFormvalid : isFormvalid ??  this.isFormvalid,
idProductos : idProductos ?? this.idProductos,
nombre : nombre ?? this.nombre,
referencia : referencia ?? this.referencia,
precioVenta : precioVenta ?? this.precioVenta,
fechaIngreso : fechaIngreso ??  this.fechaIngreso,
observacion : observacion ?? this.observacion,
categorias : categorias ?? this.categorias,
);



}