import 'package:proyecto_venta_fl/Entities/Stock.dart';

class StockGetIdState {
   final int? idStock;
 final Stock? stock;
 final bool isLoading;
 final bool isSaving;

StockGetIdState( {
 this.idStock,
this.stock,
this.isLoading= true,
this.isSaving = false,
});

StockGetIdState copyWith({
  int? id,
  Stock? stock,
  bool? isLoading,
  bool? isSaving, 
}) => StockGetIdState( 
  idStock: id ?? this.idStock,
  stock: stock ?? this.stock,
  isLoading: isLoading ?? this.isLoading,
  isSaving: isSaving ?? this.isSaving, 
);
}