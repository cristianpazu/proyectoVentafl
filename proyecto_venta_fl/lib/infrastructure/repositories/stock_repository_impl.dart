import 'package:proyecto_venta_fl/Entities/Stock.dart';
import 'package:proyecto_venta_fl/domain/datasource/stock_datasource.dart';
import 'package:proyecto_venta_fl/domain/repositories/stock_repositories.dart';

class StockRepositoryImpl  extends StockRepositories{



 final StockDatasource stockDatasource;


StockRepositoryImpl(this.stockDatasource);


  @override
  Future<List<Stock>> getAllStock() {
  return stockDatasource.getAllStock();
  }
  
  @override
  Future<Stock> createUpdateStock(Map<String, dynamic> stockLike) {
    return stockDatasource.createUpdateStock(stockLike);
  }
  
  @override
  Future<Stock> getStockById(int id) {
return stockDatasource.getStockById(id);
  }



}