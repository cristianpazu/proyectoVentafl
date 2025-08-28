class Categoria {
  
  int? idCategoria;
  String? nombreCategoria;


  Categoria({this.idCategoria, this.nombreCategoria});



   factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
  idCategoria: json["idCategoria"] ?? 0, 
  nombreCategoria: json["nombreCategoria"] ?? "", 
   );

  Map<String, dynamic> toJson() =>{
    "idCategoria":idCategoria,
    "nombreCategoria": nombreCategoria,

  };

  Categoria copyWith(
    {
     int? idCategoria, 
    String? nombreCategoria, 

    }
  )=> Categoria(
    idCategoria: idCategoria ??  this.idCategoria, 
    nombreCategoria: nombreCategoria ?? this.nombreCategoria,);

 @override
  String toString() {
    return 'Categoria(idCategoria: $idCategoria, nombreCategoria: $nombreCategoria)';
  }


}