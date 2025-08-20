import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_venta_fl/notifiers/productos_state_motifier.dart';
import 'package:proyecto_venta_fl/widget/info_screen.dart';
import 'package:proyecto_venta_fl/widget/product_card.dart';

class ProductosView extends ConsumerStatefulWidget {
  const ProductosView({super.key});

  @override
  _ProductosViewState createState() => _ProductosViewState();
}

class _ProductosViewState extends ConsumerState<ProductosView> {
  @override
  void initState() {
    super.initState();
    ref.read(productosProvider.notifier).traerProductos();
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
      body: ListView.builder(
        itemCount: productosState.productos.length,
        itemBuilder: (context, index) {
          final producto = productosState.productos[index];
          return Padding(
              padding: EdgeInsets.all(10),
              child: ListTile(
                  title: Text('${producto.nombre}'),
                  subtitle: Text('${producto.precioVenta}'),
                  trailing: IconButton(
                      onPressed: () {
                        _openIconButtonPressed(
                          nombre: producto.nombre ?? '',
                          precio: producto.precioVenta ?? 0,
                          fechaIngreso: producto.fechaIngreso ?? '',
                          cantidadStock: producto.cantidadStock ?? 0,
                          observacion:
                              producto.observacion ?? 'Sin observaciones',
                        );
                      },
                      icon: Icon(Icons
                          .info_outline_rounded))) //ProductCard(productos: producto)
              );
        },
      ),
    );
  }
}
