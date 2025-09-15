import 'package:proyecto_venta_fl/Entities/Productos.dart';

class Stock {
  int? idStock;

  int? cantidadStock;

  Productos? productos;

  Stock({this.idStock, this.cantidadStock, this.productos});

  factory Stock.fromJson(Map<String, dynamic> json) => Stock(
        idStock: json["idStock"] ?? 0,
        cantidadStock: json["cantidadStock"] ?? 0,
        productos:json["productos"] != null
            ? Productos.fromJson(json["productos"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "idStock": idStock,
        "cantidadStock": cantidadStock,
        "productos":productos?.toJson(),
      };

      
  Stock copyWith(
          {int? idStock,

  int? cantidadStock,

  Productos? productos,
         }) =>
      Stock(
          idStock: idStock ?? this.idStock,
          cantidadStock: cantidadStock ?? this.cantidadStock,
          productos: productos ?? this.productos,
          );


}
