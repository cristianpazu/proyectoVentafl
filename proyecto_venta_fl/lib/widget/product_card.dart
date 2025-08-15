import 'package:flutter/material.dart';
import 'package:proyecto_venta_fl/Entities/Productos.dart';

class ProductCard extends StatelessWidget {
  final Productos productos;

  const ProductCard({super.key, required this.productos});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                width: 100,
                color: Colors.amber,
                child: Column(
                  children: [
                    Text(productos.nombre ?? ''),
                     Text(productos.referencia ?? ''),
                     Text(productos.fechaIngreso ?? '')
                  ],
                ),
              )
            ],
          ),

             Column(
            children: [
              Container(
                height: 100,
                width: 100,
                color: Colors.greenAccent,
                  child:  ListView.builder(
                    itemCount: productos.categoria?.length ,

                    
                   itemBuilder: (context, index) {
                   print('zzzzzzzzzzzzzzzzz ${productos.categoria?[index].nombreCategoria}' ?? '');
                     print('aaaaaaaaaaaaaaaaaa ${productos.categoria?.length}' ?? '');
                    return ListTile(
                         title: Text('${productos.categoria?[index].nombreCategoria}' ?? '')
                    );
                     
                   },
                  ),
              )
            ],
          )
        ],
      ),
    );
  }
}
