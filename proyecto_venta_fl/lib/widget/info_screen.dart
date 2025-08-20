

import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {

  String? nombreProducto;
  int? precioVenta;
  String? fechaIngreso;
  int? cantidadStock;
  String? observacion;

   InfoScreen({super.key, this.nombreProducto, this.precioVenta, this.fechaIngreso, this.cantidadStock, this.observacion});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        child: Column(
          
          children: [
       Text('${nombreProducto} '),
        Text('${precioVenta} '),
         Text('${fechaIngreso} '),
          Text('${cantidadStock} '),
           Text('${observacion} ')
            
           
          ],
        ),
      ),
    );
  }
}