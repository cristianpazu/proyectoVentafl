import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_venta_fl/Entities/Productos.dart';
import 'package:proyecto_venta_fl/Entities/Stock.dart';
import 'package:proyecto_venta_fl/notifiers/producto_get_all_notifier/productos_state_motifier.dart';
import 'package:proyecto_venta_fl/notifiers/stock_get_id/stock_get_id_state_notifier.dart';
import 'package:proyecto_venta_fl/notifiers/stock_notifiers/stock_state_notifier.dart';
import 'package:proyecto_venta_fl/widget/custom_stock_field.dart';
import 'package:proyecto_venta_fl/widget/full_screen_loader.dart';

class StockScreen extends ConsumerWidget {
    final int stockId;
  const StockScreen({super.key, required this.stockId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final stockState = ref.watch(stockProviderId(stockId));
    return Scaffold(
      appBar: AppBar(
        title: Text('titulos $stockId'),
        actions: [],
      ),
      body: stockState.isLoading
          
          ? FullScreenLoader()
          : 
          _StockView(stock: stockState.stock!),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
/*  if (productoState.producto == null) return;

        ref.read(productoActualizarProvider(productoState.producto!).notifier).onFOrmSubmit().then((value){
          if (!value)  return;
          showSnackBar(context);
        });*/

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
   //final productoForm = ref.watch(productoActualizarProvider(product));
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
  //final productoForm = ref.watch(productoActualizarProvider(product));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          const Text('Informacion del producto'),
          const SizedBox(height: 15),
          CustomStockField(
            isTopField: true,
            label: 'Nombre del Producto',
            enabled: false,
           initialValue: stock.productos?.nombre ?? '',
          //  onChanged: ref.read(productoActualizarProvider(product).notifier).onNombreChanged,
          ),
          CustomStockField(
            isBottomField: true,
            label: 'Cantidad',
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            
            initialValue: stock.cantidadStock.toString(),
            // onChanged:(value) => ref.read(productoActualizarProvider(product).notifier).onPrecioVentaChanged(
             // int.tryParse(value) ?? 0
             //),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}

/*
class DropdownExample extends ConsumerWidget {

final Productos productos;



  String selectedValue = 'Opción 1';
  List<String> options = ['Opción 1', 'Opción 2', 'Opción 3'];
   DropdownExample({required this.productos});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
 final productoState = ref.watch(productosProvider);
  final producto = productoState.productos;

    return DropdownButton<String>(
      value: selectedValue,
      onChanged: (String? newValue) {
        ref.read(stockProvider.notifier).updateStocks ;
      },
      items: options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}*/