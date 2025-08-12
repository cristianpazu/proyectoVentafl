class Categoria {
  
  int? id;
  String? nombreCategoria;


  Categoria({this.id, this.nombreCategoria});



   factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
  id: json["id"] ?? 0, 
  nombreCategoria: json["nombre_categoria"] ?? "", 
   );

  Map<String, dynamic> toJson() =>{
    "id":id,
    "nombre_Categoria": nombreCategoria,

  };

  Categoria copyWith(
    {
     int? id, 
    String? nombreCategoria, 

    }
  )=> Categoria(
    id: id ??  this.id, 
    nombreCategoria: nombreCategoria ?? this.nombreCategoria,);

 @override
  String toString() {
    return 'Categoria(id: $id, nombreCategoria: $nombreCategoria)';
  }


}