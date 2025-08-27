import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  String? nombreProducto;
  int? precioVenta;
  String? fechaIngreso;
  int? cantidadStock;
  String? observacion;

  InfoScreen(
      {super.key,
      this.nombreProducto,
      this.precioVenta,
      this.fechaIngreso,
      this.cantidadStock,
      this.observacion});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // color: Colors.amber,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                  width: 300,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(233, 236, 255, 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    'Información del producto',
                    style: TextStyle(fontFamily: 'Arial', fontSize: 24),
                  ))),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                   
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 48.0),
                              child: Text('Nombre del Producto: '),
                            ),
                            Text('${nombreProducto} '),
                          ],
                        ),
//
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 48.0),
                              child: Text('Precio de ventas: '),
                            ),
                            Text('${precioVenta} '),
                          ],
                        ),
                        //
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 48.0),
                              child: Text('Fecha de ingreso: '),
                            ),
                            Text('${fechaIngreso} '),
                          ],
                        ),
                        //
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 48.0),
                              child: Text('Cantidad de existencia: '),
                            ),
                            Text('${cantidadStock} '),
                          ],
                        ),
                        //
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 48.0),
                              child: Text('Observación del producto: '),
                            ),
                            Text('${observacion} '),
                          ],
                        ),
                      ],
                    )),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
