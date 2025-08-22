import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_venta_fl/screens/productos_screen.dart';

final goRouterProvider = Provider((ref){
return GoRouter(
  initialLocation: '/',
  routes: [
  GoRoute(path: '/',

  builder: (context, state) => ProductosView(),
  )
  

  ]
);


});


