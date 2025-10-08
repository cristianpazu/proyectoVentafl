import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:proyecto_venta_fl/Entities/Productos.dart';
import 'package:proyecto_venta_fl/Entities/Response/ProductoResponse.dart';
import 'package:proyecto_venta_fl/Entities/Stock.dart';
import 'package:proyecto_venta_fl/notifiers/producto_get_all_notifier/productos_state_motifier.dart';
import 'package:proyecto_venta_fl/notifiers/stock_get_id/stock_get_id_state_notifier.dart';
import 'package:proyecto_venta_fl/notifiers/stock_notifiers/stock_state_notifier.dart';
import 'package:proyecto_venta_fl/notifiers/stock_register_notifier/stock_actualizar_state_notifier.dart';
import 'package:proyecto_venta_fl/widget/custom_stock_field.dart';
import 'package:proyecto_venta_fl/widget/full_screen_loader.dart';

class StockScreen extends ConsumerWidget {
  final int stockId;
  const StockScreen({super.key, required this.stockId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stockState = ref.watch(stockProviderId(stockId));
final titulos = stockState.idStock == 999999 ? 'Registro Stock' : 'Editar Stock';


    void showSnackBar(BuildContext context) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: 
          stockState.idStock == 999999 ? Text('Stock Registrado') :
          Text('Stock Actualizado')));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('$titulos'),
        actions: [],
      ),
      body: stockState.isLoading
          ? FullScreenLoader()
          : _StockView(stock: stockState.stock!),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (stockState.stock == null) return;

          ref
              .read(StocksActualizaProvider(stockState.stock!).notifier)
              .onFormSubmit()
              .then((value) {
            if (!value) return;
            showSnackBar(context);
          });


        },
        child: Icon(Icons.save_as_outlined),
      ),
    );
  }
}

class _StockView extends ConsumerWidget {
  final Stock stock;

  const _StockView({required this.stock});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
 
    return ListView(
      children: [
        _StockInformation(stock: stock),
      ],
    );
  }
}

class _StockInformation extends ConsumerWidget {
  final Stock stock;
  const _StockInformation({required this.stock});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final StockForm = ref.watch(StocksActualizaProvider(stock));

    final productosState = ref.watch(productosProvider);
    //inal productos = productosState.productos;
    //final List<Productos>? productos = productosState.productos;

    final List<Productos> productos = (productosState.productos ?? [])
        .map((p) => Productos.fromResponse(p))
        .toList();

    final isLoading = productosState.isLoding;

  

    final stockState = ref.watch(stockProvider);
    final List<Productos> productosRegistrados = stockState.stock
        .map((s) => s.productos)
        .whereType<Productos>()
        .toList();

    final List<int?> idsRegistrados =
        productosRegistrados.map((p) => p.idProductos).toList();

    //

    final List<Productos> productosDisponibles = productos
    .where((p) => !idsRegistrados.contains(p.idProductos))
    .toList();

// Verificamos si el producto del formulario todavía está disponible
Productos? selectedProducto;

try {
  selectedProducto = productosDisponibles.firstWhere(
    (p) => p.idProductos == StockForm.productos?.idProductos,
  );
} catch (e) {
  selectedProducto = null;
  debugPrint('⚠️ El producto ya no está disponible en el dropdown.');
}
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          const Text('Informacion del stock'),
          const SizedBox(height: 15),
          StockForm.idStock == 999999
              ? (isLoading
                  ? CircularProgressIndicator()
                  : DropdownButtonFormField<Productos>(
            isExpanded: true,
            value: selectedProducto,
            decoration: const InputDecoration(
              labelText: 'Nombre del stock',
              border: OutlineInputBorder(),
            ),
            items: productosDisponibles.map((producto) {
              return DropdownMenuItem<Productos>(
                value: producto,
                child: Text(producto.nombre ?? ''),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                ref
                    .read(StocksActualizaProvider(stock).notifier)
                    .onProducto(value);
              }
            },
          ))
              : CustomStockField(
                  isTopField: true,
                  label: 'Nombre del stock',
                  enabled: false,
                  initialValue: stock.productos?.nombre ?? '',
                  //  onChanged: ref.read(productoActualizarProvider(product).notifier).onNombreChanged,
                ),
          const SizedBox(height: 5),
          CustomStockField(
            isBottomField: true,
            label: 'Cantidad del stock',
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            initialValue: StockForm.cantidadStock.toString() ?? '0',
            onChanged: (value) => ref
                .read(StocksActualizaProvider(stock).notifier)
                .onCantidadStockChanged(int.tryParse(value) ?? 0),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}


