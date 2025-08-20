import 'package:flutter/material.dart';
import 'package:proyecto_venta_fl/Entities/Productos.dart';

class ProductCard extends StatelessWidget {
  // final Productos productos;

  const ProductCard({
    super.key,
    //required this.productos
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 40, right: 10, top: 20),
                    child: Container(
                      height: 150,
                      width: 300,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(
                              255, 40, 87, 187), // Color morado
                          width: 2.0, // Grosor del borde
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 18.0),
                            child: Text('productos.nombre ?? '),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 18.0),
                            child: Text('productos.referencia ?? '),
                          ),
                          Text('productos.fechaIngreso ?? ')
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  /*Container(
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
                  ) */
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
