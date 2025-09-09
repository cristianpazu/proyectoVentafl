import 'package:proyecto_venta_fl/Entities/Stock.dart';
import 'package:proyecto_venta_fl/domain/datasource/stock_datasource.dart';
import 'package:proyecto_venta_fl/utils/baseUrl.dart';
import 'package:proyecto_venta_fl/utils/http.dart';

class StockDatasourceImpl extends StockDatasource {
  @override
  Future<List<Stock>> getAllStock() async {
    try {
      final respuesta = await HttpService(Baseurl.consultarStock).getHttp();

      final List<Stock> stocks = [];

      print('object respuesta $respuesta');
      for (var element in respuesta ?? []) {
        print('object element $element');

stocks.add(Stock.fromJson(element));
      }

      return stocks;
    } catch (e, stackTrace) {
      print('e $e');
      print('stackTrace $stackTrace');

      rethrow;
    }
  }
}
