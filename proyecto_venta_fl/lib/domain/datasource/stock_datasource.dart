import 'package:proyecto_venta_fl/Entities/Stock.dart';

abstract class StockDatasource {
   Future<List<Stock>> getAllStock();
}