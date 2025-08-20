import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_venta_fl/screens/productos_screen.dart';
import 'package:proyecto_venta_fl/utils/baseUrl.dart';
import 'package:proyecto_venta_fl/utils/http.dart';
import 'package:proyecto_venta_fl/widget/product_card.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const ProductosView(),
    );
  }
}

class DioExamplePage extends StatefulWidget {
  const DioExamplePage({super.key});

  @override
  State<DioExamplePage> createState() => _DioExamplePageState();
}

class _DioExamplePageState extends State<DioExamplePage> {
  @override
  void initState() {
    super.initState();
    print('object');
    getCategoria();
  }

  Future<Object> getCategoria() async {
    try {
      final Object? respuesta =
          await HttpService(Baseurl.consultarProductos).getHttp();

      /* final response =
          await dio.get('http://192.168.42.76:9090/productos/traerporId/1'); */

      print('>>>>>>>>>>>>>>>>> ${respuesta.toString()}');

      return respuesta.toString();
    } catch (e) {
      print('Error: $e');
      return {}; // O puedes lanzar una excepción si prefieres
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ejemplo de Dio')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text('response'),
      ),
    );
  }
}
