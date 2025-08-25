


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_venta_fl/domain/repositories/categoria_repositories.dart';
import 'package:proyecto_venta_fl/domain/repositories/producto_repositories.dart';
import 'package:proyecto_venta_fl/infrastructure/datasource/categoria_datasorce_impl.dart';
import 'package:proyecto_venta_fl/infrastructure/datasource/productos_datasource_impl.dart';
import 'package:proyecto_venta_fl/infrastructure/repositories/categoria_repository_impl.dart';
import 'package:proyecto_venta_fl/infrastructure/repositories/productos_repository_impl.dart';

final categpriaRepositoryProvider = Provider<CategoriaRepositories>((ref) {

 
 final caregoriaRepositories = CategoriaRepositoryImpl(
  CategoriaDatasorceImpl()
 );


  return caregoriaRepositories;
});