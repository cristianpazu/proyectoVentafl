import 'package:proyecto_venta_fl/Entities/Stock.dart';

abstract class StockDatasource {
   Future<List<Stock>> getAllStock();

     Future<Stock> getStockById(int id);

     Future<Stock> createUpdateStock(Map<String, dynamic> stockLike);
}