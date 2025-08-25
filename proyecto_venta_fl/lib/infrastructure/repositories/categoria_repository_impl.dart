
import 'package:proyecto_venta_fl/Entities/Categoria.dart';
import 'package:proyecto_venta_fl/domain/datasource/categoria%20_datasource.dart';
import 'package:proyecto_venta_fl/domain/repositories/categoria_repositories.dart';

class CategoriaRepositoryImpl  extends CategoriaRepositories{

final CategoriaDatasource categoriaDatasource;



CategoriaRepositoryImpl(this.categoriaDatasource);




  @override
  Future<List<Categoria>> getAllCategoria() {
  return categoriaDatasource.getAllCategoria();
  }

  @override
  Future<Categoria> getCategoriaById(int id) {
     return categoriaDatasource.getCategoriaById(id);
  }
 }

