import 'package:proyecto_venta_fl/Entities/Stock.dart';

abstract class StockRepositories {
   Future<List<Stock>> getAllStock();
}