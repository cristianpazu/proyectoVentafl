import 'package:proyecto_venta_fl/Entities/Productos.dart';

class StockActualizarState {
 final bool isFormvalid;
  final int? idStock;
  final String? cantidadStock;
  final Productos? productos;

  StockActualizarState({
    this.isFormvalid = false,
    this.idStock,
    this.cantidadStock,
    this.productos,
  });

  StockActualizarState copyWith({
    bool? isFormvalid,
    int? idStock,
   String? cantidadStock,
   Productos? productos,
  }) =>
      StockActualizarState(
        isFormvalid: isFormvalid ?? this.isFormvalid,
        idStock: idStock ?? this.idStock,
        cantidadStock:cantidadStock ?? this.cantidadStock,
        productos: productos ?? this.productos
      );
}