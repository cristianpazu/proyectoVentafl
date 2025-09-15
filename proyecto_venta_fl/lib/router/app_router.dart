import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_venta_fl/screens/mainPage.dart';
import 'package:proyecto_venta_fl/screens/producto_screen.dart';
import 'package:proyecto_venta_fl/screens/productos_screen.dart';
import 'package:proyecto_venta_fl/screens/stock_screen.dart';

final goRouterProvider = Provider((ref) {
  return GoRouter(initialLocation: '/', routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => Mainpage(),
    ),
    GoRoute(
  path: '/producto/:id',
  builder: (context, state) {
    final idParam = state.params['id'];
    final productoId = int.tryParse(idParam!)  ?? 999999; // o lanza error si es obligatorio
   print('object||||||||>>>>>>>>>>>>> $idParam');
   print('object||||||||>>>>>>>>>>>>> productoId $productoId');

    return ProductoScreen(productoId: productoId);
  },
),
 GoRoute(
  path: '/stock/:id',
  builder: (context, state) {
final idParam = state.params['id'];
    final productoId = int.tryParse(idParam!)  ?? 999999; // o lanza error si es obligatorio
   

    return StockScreen(productoId: productoId);
  },
),
 GoRoute(
  path: '/stock',
  builder: (context, state) {


    return StockScreen();
  },
)
   /* GoRoute(
      path: '/producto/:id',
      builder: (context, state) => ProductoScreen(
        productoId: state.params['id'] ?? 'no-id',
        
      ),
    ) */
  ],
  redirect: (context, state) {
    

    return null;
  },
  
  
  
  );
});
