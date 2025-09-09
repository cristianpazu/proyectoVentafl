import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PedidosScreen extends StatefulWidget {
   PedidosScreen({super.key});



static String formatearFecha(String fechaIso) {
  final DateTime fecha = DateTime.parse(fechaIso);
  final DateFormat formatter = DateFormat('EEEE d MMMM y');
  return toBeginningOfSentenceCase(formatter.format(fecha)) ?? '';
}

  @override
  State<PedidosScreen> createState() => _PedidosScreenState();
}

class _PedidosScreenState extends State<PedidosScreen> {
final String fechaDelBackend = "2025-09-09";

final  String fechaFormateada = PedidosScreen.formatearFecha("2025-09-09");

DateTime? _fechaSeleccionada;

  



List<Map<String, dynamic>> items = [
   {'id': 1, 'nombre': 'Manzana', 'fecha': '2025-09-01'},
  {'id': 2, 'nombre': 'Banana', 'fecha': '2025-09-02'},
  {'id': 3, 'nombre': 'Naranja', 'fecha': '2025-09-03'},
  {'id': 4, 'nombre': 'Uva', 'fecha': '2025-09-09'},
  {'id': 5, 'nombre': 'Melón', 'fecha': '2025-09-05'},
];

Future<void> _seleccionarFecha(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _fechaSeleccionada ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      locale: const Locale('es', 'ES'),
    );

    if (picked != null && picked != _fechaSeleccionada) {
      setState(() {
        _fechaSeleccionada = picked;
      });
    }
  }

List<Map<String, dynamic>> get _itemsFiltrados {
  if (_fechaSeleccionada == null) return items; // 👈 Mostrar todos si no hay fecha seleccionada

  final String fechaStr = DateFormat('yyyy-MM-dd').format(_fechaSeleccionada!);
  return items.where((item) => item['fecha'] == fechaStr).toList();
}









  @override
  Widget build(BuildContext context) {
       String textoFecha = _fechaSeleccionada != null
        ? DateFormat('EEEE d MMMM y', 'es_ES').format(_fechaSeleccionada!)
        : 'Selecciona una fecha';

    return Scaffold(
      appBar: AppBar(
        title: Text('Pedidos'),
         actions: [
          if (_fechaSeleccionada != null)
            IconButton(
              icon: const Icon(Icons.clear),
              tooltip: 'Limpiar filtro',
              onPressed: () {
                setState(() {
                  _fechaSeleccionada = null;
                });
              },
            )
        ],
      ),
      body: Column(
        children: [

        Container(
          width: 150,
          height: 150,
          color: Colors.green,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textoFecha,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _seleccionarFecha(context),
              child: const Text('Elegir fecha'),
            ),
          ],
        ),
        ),
        //
        //
        Expanded(child: ListView.builder(

/*
          itemCount: items.length,
          itemBuilder: (context, index) {
              final item = items[index]; */
              itemCount: _itemsFiltrados.length,
itemBuilder: (context, index) {
  final item = _itemsFiltrados[index];
          return  Padding(
         padding: const EdgeInsets.all(8.0),
         child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
          color: Colors.amber,
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ID DEL PEDIDO'),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Fecha de pedido'),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['fecha'],//fechaFormateada, // 👈 Mostrar fecha aquí
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(item['nombre']),
            ],
          ),
         ),
       );

          
        },))


      


        ],
      ) ,
    );
  }
}