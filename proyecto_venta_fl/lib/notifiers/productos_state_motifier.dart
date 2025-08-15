


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_venta_fl/domain/repositories/producto_repositories.dart';
import 'package:proyecto_venta_fl/notifiers/productos_state.dart';
import 'package:proyecto_venta_fl/providers/productos_repository_provider.dart';

final productosProvider = StateNotifierProvider<ProductosNotifier, ProductosState>((ref) {

final productosREpository = ref.watch(productosRepositoryProvider);

  return ProductosNotifier(productoRepositories: productosREpository);
});



class ProductosNotifier extends StateNotifier<ProductosState>{

 final ProductoRepositories productoRepositories;

ProductosNotifier({
 required this.productoRepositories
}):super(ProductosState()){
traerProductos();
}

Future traerProductos()async{

  if (state.isLoding)return;


  state = state.copyWith(
    isLoding: true,
    
  );

final productos = await productoRepositories.getAllProductos();

if (productos.isEmpty) {
  state =state.copyWith(
    isLoding: false,
   
  );
  return;
}

state = state.copyWith(
  isLoding: false,
  productos: [...state.productos, ...productos]
);


}




}