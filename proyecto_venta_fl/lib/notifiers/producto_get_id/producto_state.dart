import 'package:proyecto_venta_fl/Entities/Productos.dart';

class ProductoState {
 final int? idProductos;
 final Productos? producto;
 final bool isLoading;
 final bool isSaving;

ProductoState( {
 this.idProductos,
this.producto,
this.isLoading= true,
this.isSaving = false,
});

ProductoState copyWith({
  int? id,
  Productos? producto,
  bool? isLoading,
  bool? isSaving, 
}) => ProductoState( 
  idProductos: id ?? this.idProductos,
  producto: producto ?? this.producto,
  isLoading: isLoading ?? this.isLoading,
  isSaving: isSaving ?? this.isSaving, 
);
} 