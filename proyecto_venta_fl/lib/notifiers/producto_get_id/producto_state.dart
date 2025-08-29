import 'package:proyecto_venta_fl/Entities/Productos.dart';

class ProductoState {
 final int? id;
 final Productos? producto;
 final bool isLoading;
 final bool isSaving;

ProductoState( {
 this.id,
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
  id: id ?? this.id,
  producto: producto ?? this.producto,
  isLoading: isLoading ?? this.isLoading,
  isSaving: isSaving ?? this.isSaving, 
);
} 