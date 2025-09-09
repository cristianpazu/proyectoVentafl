import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:proyecto_venta_fl/router/app_router.dart';
import 'package:proyecto_venta_fl/screens/productos_screen.dart';
import 'package:proyecto_venta_fl/utils/baseUrl.dart';
import 'package:proyecto_venta_fl/utils/http.dart';
import 'package:proyecto_venta_fl/widget/product_card.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; 
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('es_ES', null); 
  runApp(
    
    ProviderScope(
      
      child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {

  final appRouter = ref.watch( goRouterProvider);


    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Flutter Demo',
     
      debugShowCheckedModeBanner: false,
       locale: const Locale('es', 'ES'),
      supportedLocales: const [
        Locale('es', 'ES'),
        Locale('en', 'US'), // opcional
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
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
