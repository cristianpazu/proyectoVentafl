import 'package:proyecto_venta_fl/Entities/Categoria.dart';

class ProductosResponse {
 
 int? idProductos;
 
 String? nombre;

 String? referencia;

 int? cantidadStock;

 int? precioVenta;

 String? fechaIngreso;

 String? observacion;

 String? categoriasConcat;

ProductosResponse({this.idProductos, this.nombre, this.referencia, this.cantidadStock ,this.precioVenta, this.fechaIngreso, this.observacion, this.categoriasConcat});


factory ProductosResponse.fromJson(Map<String, dynamic> json ) => ProductosResponse(
  idProductos: json["idProductos"]?? 0, 
  nombre: json["nombre"]?? "", 
  referencia: json["referencia"]?? "", 
  cantidadStock: json["cantidadStock"] ?? 0,
  precioVenta: json["precioVenta"]?? 0.0 , 
  fechaIngreso: json["fechaIngreso"] ?? "",
  observacion: json["observacion"]?? "",
  categoriasConcat:json["categoriasConcat"]
  );


Map<String, dynamic> toJson() => {
  "idProductos": idProductos,
  "nombre": nombre,
  "referencia": referencia,
  "cantidadStock": cantidadStock,
  "precioVenta": precioVenta,
  "fechaIngreso": fechaIngreso,
  "observacion": observacion,
  "categoriasConcat": categoriasConcat,
};

ProductosResponse copyWith({
int? idProductos,
   String? nombre,

 String? referencia,
 int? cantidadStock,
 int? precioVenta,

 String? fechaIngreso,

 String? observacion,

 String? categoriasConcat,

})=> ProductosResponse(
idProductos: idProductos ?? this.idProductos,
nombre: nombre ?? this.nombre,
referencia: referencia ?? this.referencia,
cantidadStock: cantidadStock ?? this.cantidadStock,
precioVenta: precioVenta ?? this.precioVenta,
fechaIngreso: fechaIngreso ?? this.fechaIngreso,
observacion: observacion ?? this.observacion,
categoriasConcat: categoriasConcat ?? this.categoriasConcat



);

}