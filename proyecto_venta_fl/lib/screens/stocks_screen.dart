import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_venta_fl/notifiers/stock_notifiers/stock_state.dart';
import 'package:proyecto_venta_fl/notifiers/stock_notifiers/stock_state_notifier.dart';

class MyWidget extends ConsumerStatefulWidget {
  const MyWidget({super.key});

  @override
  _StockState createState() => _StockState();
}

class _StockState extends ConsumerState {
  FiltroStock filtroSeleccionado = FiltroStock.todos;
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final stockNotifier = ref.read(stockProvider.notifier);
      final stocks = ref.read(stockProvider).stock;

  
      // Solo traer si la lista está vacía
      if (stocks.isEmpty) {
        stockNotifier.traerStock();
      }
      // ref.read(productosProvider.notifier).traerProductos();
    });
  }

  @override
  Widget build(BuildContext context) {
    final stockState = ref.watch(stockProvider);

    final stockFiltrado = stockState.stock.where((s) {
      final cantidad = s.cantidadStock ?? 0;

      switch (filtroSeleccionado) {
        case FiltroStock.alto:
          return cantidad > 50;
        case FiltroStock.bajo:
          return cantidad <= 50;
        case FiltroStock.todos:
        default:
          return true;
      }
    }).toList();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 243, 244, 1),
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        filtroSeleccionado = FiltroStock.todos;
                      });
                    },
                    child: Chip(
                      label: Text('Todos'),
                      backgroundColor: filtroSeleccionado == FiltroStock.todos
                          ? Colors.blue
                          : Colors.grey[300],
                    )),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      filtroSeleccionado = FiltroStock.alto;
                    });
                  },
                  child: Chip(
                    label: Text('Stock alto'),
                    backgroundColor: filtroSeleccionado == FiltroStock.alto
                        ? Colors.blue
                        : Colors.grey[300],
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      filtroSeleccionado = FiltroStock.bajo;
                    });
                  },
                  child: Chip(
                    label: Text('Stock bajo'),
                    backgroundColor: filtroSeleccionado == FiltroStock.bajo
                        ? Colors.blue
                        : Colors.grey[300],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: stockFiltrado.length,
              itemBuilder: (context, index) {
                final stocks = stockFiltrado[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: cardStock(stocks.productos?.nombre ?? '',
                      stocks.cantidadStock ?? 0),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Nuevo stock'),
        icon: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }

  Container cardStock(String title, int cantidadStock) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          //Padding(

          //padding: const EdgeInsets.only(right: 300, top: 10),
          // child:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: 300,
                  height: 80,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title),
                        Text(cantidadStock.toString()),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                  height: 40,
                ),
                //),
                //
                //Padding(
                //padding: const EdgeInsets.only(right: 200, bottom: 50),
                // child:
                Container(
                  width: 65,
                  height: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                            width: 30,
                            height: 30,
                            child: cantidadStock > 50
                                ? Image.asset('assets/flechaCrecimiento.png')
                                : Image.asset('assets/decrecimiento.png')),
                      )
                      //   Text('data')
                    ],
                  ),
                ),
                //),
              ],
            ),
          ),

          //
        ],
      ),
    );
  }
}
