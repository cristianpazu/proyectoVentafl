import 'package:proyecto_venta_fl/Entities/Categoria.dart';

class Productos {
  int? idProductos;

  String? nombre;

  String? referencia;

  int? cantidadStock;

  int? precioVenta;

  String? fechaIngreso;

  String? observacion;

  List<Categoria>? categorias;

  Productos(
      {this.idProductos,
      this.nombre,
      this.referencia,
      this.cantidadStock,
      this.precioVenta,
      this.fechaIngreso,
      this.observacion,
      this.categorias});

  factory Productos.fromJson(Map<String, dynamic> json) => Productos(
        idProductos: json["idProductos"] ?? 0,
        nombre: json["nombre"] ?? "",
        referencia: json["referencia"] ?? "",
        cantidadStock: json["cantidadStock"] ?? 0,
        precioVenta: json["precioVenta"] ?? 0,
        fechaIngreso: json["fechaIngreso"] ?? "",
        observacion: json["observacion"] ?? "",
        categorias: (json["categorias"] != null && json["categorias"] is List)
            ? List<Categoria>.from(
                json["categorias"].map((x) => Categoria.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "idProductos": idProductos,
        "nombre": nombre,
        "referencia": referencia,
        "cantidadStock": cantidadStock,
        "precioVenta": precioVenta,
        "fechaIngreso": fechaIngreso,
        "observacion": observacion,
        "categorias": categorias?.map((x) => x.toJson()).toList(),
      };

  Productos copyWith(
          {int? idProductos,
          String? nombre,
          String? referencia,
          int? cantidadStock,
          int? precioVenta,
          String? fechaIngreso,
          String? observacion,
          List<Categoria>? categorias}) =>
      Productos(
          idProductos: idProductos ?? this.idProductos,
          nombre: nombre ?? this.nombre,
          referencia: referencia ?? this.referencia,
          cantidadStock: cantidadStock ?? this.cantidadStock,
          precioVenta: precioVenta ?? this.precioVenta,
          fechaIngreso: fechaIngreso ?? this.fechaIngreso,
          observacion: observacion ?? this.observacion,
          categorias: categorias ?? this.categorias);
}
