import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_venta_fl/notifiers/productos_state_motifier.dart';
import 'package:proyecto_venta_fl/router/app_router.dart';
import 'package:proyecto_venta_fl/widget/info_screen.dart';
import 'package:proyecto_venta_fl/widget/product_card.dart';

class ProductosView extends ConsumerStatefulWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  const ProductosView({super.key, this.controller, this.onChanged});

  @override
  _ProductosViewState createState() => _ProductosViewState();
}

class _ProductosViewState extends ConsumerState {
  @override
  void initState() {
    super.initState();
    /* WidgetsBinding.instance.addPostFrameCallback((_) {
    ref.read(productosProvider.notifier).traerProductos();
  }); */
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _openIconButtonPressed({
    required String nombre,
    required int precio,
    required String fechaIngreso,
    required int cantidadStock,
    required String observacion,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => InfoScreen(
        nombreProducto: nombre,
        precioVenta: precio,
        fechaIngreso: fechaIngreso,
        cantidadStock: cantidadStock,
        observacion: observacion,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final productosState = ref.watch(productosProvider);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 243, 244, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(241, 243, 244, 1),
        title: Center(
            child: Text(
          'Inventory',
          style: 
          //style: GoogleFonts.blackOpsOne(),
        TextStyle(
              fontSize: 20.0,
              fontFamily: 'Roboto-Medium',
              fontWeight: FontWeight.w600), 
        )),
      ),
      body: Column(
        children: [
// Encabezado fijo

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 255, 255, 255),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black.withOpacity(0.5),
                ),
                hintText: 'Search...',
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.5), // Opacidad del hintText
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(
                        255, 255, 255, 255), // Borde blanco al enfocar
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 255, 255,
                        255), // Borde blanco al no estar enfocado
                    width: 2,
                  ),
                ),
              ),
            ),
          ),

          /*   Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: widget.controller,
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                  hintText: 'Buscar',
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: //Image.asset('assets/buscar.png',width: 78,height: 2,fit: BoxFit.contain,),
                      Icon(
                    Icons.search_rounded,
                    size: 40,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ), */

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 20,
              width: double.infinity,
              child: Text(
                'Items',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),

          Expanded(
            child: ListView.builder(
              itemCount: productosState.productos.length,
              itemBuilder: (context, index) {
                final producto = productosState.productos[index];

                return Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                          color:
                              Colors.white, //Color.fromARGB(123, 0, 16, 236),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Slidable(
                        key: ValueKey(producto
                            .idProductos), // cada item debe tener una key única
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              borderRadius: BorderRadius.circular(20),
                              onPressed: (context) {
                                print(
                                    '--------||||||||--------- ${producto.categoriasConcat}');
                                context
                                    .push('/producto/${producto.idProductos}');
                              },
                              backgroundColor:
                                  const Color.fromRGBO(232, 235, 255, 1),
                              foregroundColor: const Color.fromRGBO(87, 118, 230, 1),
                                  //const Color.fromRGBO(96, 124, 218, 1),
                              icon: Icons.edit,
                              label: 'Editar',
                            ),
                          ],
                        ),
                        child: ListTile(
                            title: Text('${producto.nombre}',  style: 
          //style: GoogleFonts.blackOpsOne(),
        TextStyle(
              fontSize: 18.0,
              fontFamily: 'Roboto-Regular',
              fontWeight: FontWeight.w500), ),
                            subtitle: Text('${producto.precioVenta}'),
                            trailing: IconButton(
                                onPressed: () {
                                  _openIconButtonPressed(
                                    nombre: producto.nombre ?? '',
                                    precio: producto.precioVenta ?? 0,
                                    fechaIngreso: producto.fechaIngreso ?? '',
                                    cantidadStock: producto.cantidadStock ?? 0,
                                    observacion: producto.observacion ??
                                        'Sin observaciones',
                                  );
                                },
                                icon: Icon(Icons.info_outline_rounded))),
                      ),
                    ) //ProductCard(productos: producto)
                    );
              },
            ),
          ),
        ],
      ),
    );
  }
}
