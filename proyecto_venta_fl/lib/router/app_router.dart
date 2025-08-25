import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_venta_fl/screens/producto_screen.dart';
import 'package:proyecto_venta_fl/screens/productos_screen.dart';

final goRouterProvider = Provider((ref) {
  return GoRouter(initialLocation: '/', routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ProductosView(),
    ),
    GoRoute(
      path: '/producto/:id',
      builder: (context, state) => ProductoScreen(
        productoId: state.params['id'] ?? 'no-id',
      ),
    )
  ],
  redirect: (context, state) {
    

    return null;
  },
  
  
  
  );
});
