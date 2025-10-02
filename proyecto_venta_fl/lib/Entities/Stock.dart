import 'package:proyecto_venta_fl/Entities/Productos.dart';
import 'package:proyecto_venta_fl/Entities/Response/ProductoResponse.dart';

class Stock {
  int? idStock;

  int? cantidadStock;

  Productos? productos;
  List<ProductosResponse>? listProductos;

  Stock({this.idStock, this.cantidadStock, this.productos, this.listProductos});

  factory Stock.fromJson(Map<String, dynamic> json) => Stock(
        idStock: json["idStock"] ?? 0,
        cantidadStock: json["cantidadStock"] ?? 0,
        productos:json["productos"] != null
            ? Productos.fromJson(json["productos"])
            : null,
        listProductos: (json["listProductos"] != null && json["listProductos"] is List)
            ? List<ProductosResponse>.from(
                json["listProductos"].map((x) => Productos.fromJson(x)))
            : [],
      );







  Map<String, dynamic> toJson() => {
        "idStock": idStock,
        "cantidadStock": cantidadStock,
        "productos":productos?.toJson(),
        "listProductos": listProductos?.map((x) => x.toJson()).toList(),
      };

      
  Stock copyWith(
          {int? idStock,

  int? cantidadStock,

  Productos? productos,
 List<ProductosResponse>? listProductos,
         }) =>
      Stock(
          idStock: idStock ?? this.idStock,
          cantidadStock: cantidadStock ?? this.cantidadStock,
          productos: productos ?? this.productos,
          listProductos: listProductos ?? this.listProductos,

          );


}
