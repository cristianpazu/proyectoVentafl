import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_venta_fl/domain/repositories/producto_repositories.dart';
import 'package:proyecto_venta_fl/domain/repositories/stock_repositories.dart';
import 'package:proyecto_venta_fl/infrastructure/datasource/stock_datasource_impl.dart';
import 'package:proyecto_venta_fl/infrastructure/repositories/stock_repository_impl.dart';

final stockRepositoryProvider = Provider<StockRepositories>((ref) {

 
 final stockRepositories = StockRepositoryImpl(
  StockDatasourceImpl()
 );


  return stockRepositories;
});