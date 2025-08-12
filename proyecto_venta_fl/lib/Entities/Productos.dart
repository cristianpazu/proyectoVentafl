import 'package:proyecto_venta_fl/Entities/Categoria.dart';

class Productos {
 
 int? id;
 
 String? nombre;

 String? referencia;

 int? precioCompra;

 DateTime? fechaIngreso;

 String? observacion;

 List<Categoria>? categoria;

Productos({this.id, this.nombre, this.referencia, this.precioCompra, this.fechaIngreso, this.observacion, this.categoria});


factory Productos.fromJson(Map<String, dynamic> json ) => Productos(
  id: json["id"]?? 0, 
  nombre: json["nombre"]?? "", 
  referencia: json["referencia"]?? "", 
  precioCompra: json["precioCompra"]?? 0 , 
  fechaIngreso: json["fechaIngreso"] != null
            ? DateTime.tryParse(json["fechaIngreso"])
            : null,
  observacion: json["observacion"]?? "",
  categoria: json["categoria"]
  );


Map<String, dynamic> toJson() => {
  "id": id,
  "nombre": nombre,
  "referencia": referencia,
  "precioCompra": precioCompra,
  "fechaIngreso": fechaIngreso?.toIso8601String(),
  "observacion": observacion,
  "categoria": categoria,
};

Productos copyWith({
int? id,
   String? nombre,

 String? referencia,

 int? precioCompra,

 DateTime? fechaIngreso,

 String? observacion,

 List<Categoria>? categoria

})=> Productos(
id: id ?? this.id,
nombre: nombre ?? this.nombre,
referencia: referencia ?? this.referencia,
precioCompra: precioCompra ?? this.precioCompra,
fechaIngreso: fechaIngreso ?? this.fechaIngreso,
observacion: observacion ?? this.observacion,
categoria: categoria ?? this.categoria



);

}