

import 'package:proyecto_venta_fl/Entities/Categoria.dart';

class CategoriaMapper {

static jsonToEntityMapper(Map<String, dynamic> json ){

return Categoria(

  


  id: json['id'],
  nombreCategoria: json['nombreCategoria']
);
} 


}