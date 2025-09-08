import 'package:proyecto_venta_fl/Entities/Productos.dart';

class Stock {
  int? idStock;

  int? cantidadStock;

  Productos? productos;

  Stock({this.idStock, this.cantidadStock, this.productos});

  factory Stock.fromJson(Map<String, dynamic> json) => Stock(
        idStock: json["idStock"] ?? 0,
        cantidadStock: json["cantidadStock"] ?? 0,
        productos: json["Productos"],
      );

  Map<String, dynamic> toJson() => {
        "idStock": idStock,
        "cantidadStock": cantidadStock,
        "Productos": productos
      };
}
