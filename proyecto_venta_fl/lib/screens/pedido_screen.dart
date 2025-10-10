import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_venta_fl/notifiers/producto_get_all_notifier/productos_state_motifier.dart';

class PedidoScreen extends ConsumerStatefulWidget {
  const PedidoScreen({super.key});

  @override
  _PedidoScreenState createState() => _PedidoScreenState();
}

class _PedidoScreenState extends ConsumerState {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final productosNotifier = ref.read(productosProvider.notifier);
      final productos = ref.read(productosProvider).productos;

      // Solo traer si la lista está vacía
      if (productos.isEmpty) {
        productosNotifier.traerProductos();
      }
      // ref.read(productosProvider.notifier).traerProductos();
    });
  }

  @override
  Widget build(BuildContext context) {
    final productosState = ref.watch(productosProvider);
    return Scaffold(
        appBar: AppBar(
          actions: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Container(
                  height: 60,
                  width: 35,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 175, 54, 54),
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: InkWell(
                    onTap: () {
                      print('Carrito icon pressed');
                      /*  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CarritoPage(),
                      )); */
                    },
                    child: Stack(
                      children: [
                        Positioned(
                            child: Container(
                          width: 20,
                          height: 16,
                          color: Colors.amber,
                          child: Center(child: Text('0')),
                        )),
                        Center(
                          child: Icon(Icons.shopping_cart_outlined),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: productosState.productos.length,
                itemBuilder: (context, index) {
                  final producto = productosState.productos[index];

                  return Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                          height: 85,
                          decoration: BoxDecoration(
                              color: Colors
                                  .blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Row(
                                     mainAxisAlignment: MainAxisAlignment
                                      .center, // Centra en el eje horizontal
                                  crossAxisAlignment: CrossAxisAlignment
                                      .center,
                                  children: [
                                    Text(
                                      '${producto.nombre}',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontFamily: 'Roboto-Regular',
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('${producto.precioVenta}'),
                                  ],
                                ),
                              ),
                              Container(
                                width: 150,
                                height: 50,
                               decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10)
                               ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .center, // Centra en el eje horizontal
                                  crossAxisAlignment: CrossAxisAlignment
                                      .center, // Centra en el eje vertical
                                  children: [
                                    Expanded(
                                     child: 
                                        TextButton(
                                            onPressed: () {},
                                            child: Text('agregar producto'))
                                   
                                    )
                                  ],
                                ),
                              )
                            ],
                          )) //ProductCard(productos: producto)
                      );
                },
              ),
            ),
          ],
        ));
  }
}
