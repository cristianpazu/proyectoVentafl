import 'package:proyecto_venta_fl/Entities/Categoria.dart';

class Productos {
 
 int? id;
 
 String? nombre;

 String? referencia;

 int? cantidadStock;

 int? precioVenta;

 String? fechaIngreso;

 String? observacion;

 List<Categoria>? categoria;

Productos({this.id, this.nombre, this.referencia, this.cantidadStock ,this.precioVenta, this.fechaIngreso, this.observacion, this.categoria});


factory Productos.fromJson(Map<String, dynamic> json ) => Productos(
  id: json["id"]?? 0, 
  nombre: json["nombre"]?? "", 
  referencia: json["referencia"]?? "", 
  cantidadStock: json["cantidadStock"] ?? 0,
  precioVenta: json["precioVenta"]?? 0.0 , 
  fechaIngreso: json["fechaIngreso"] ?? "",
  observacion: json["observacion"]?? "",
  categoria: (json["categoria"] != null && json["categoria"] is List)
    ? List<Categoria>.from(json["categoria"].map((x) => Categoria.fromJson(x)))
    : [],
  );


Map<String, dynamic> toJson() => {
  "id": id,
  "nombre": nombre,
  "referencia": referencia,
  "cantidadStock": cantidadStock,
  "precioVenta": precioVenta,
  "fechaIngreso": fechaIngreso,
  "observacion": observacion,
  "categoria": categoria?.map((x) => x.toJson()).toList(),
};

Productos copyWith({
int? id,
   String? nombre,

 String? referencia,
 int? cantidadStock,
 int? precioVenta,

 String? fechaIngreso,

 String? observacion,

 List<Categoria>? categoria

})=> Productos(
id: id ?? this.id,
nombre: nombre ?? this.nombre,
referencia: referencia ?? this.referencia,
cantidadStock: cantidadStock ?? this.cantidadStock,
precioVenta: precioVenta ?? this.precioVenta,
fechaIngreso: fechaIngreso ?? this.fechaIngreso,
observacion: observacion ?? this.observacion,
categoria: categoria ?? this.categoria



);

}