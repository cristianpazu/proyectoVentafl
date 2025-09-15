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
  
  @override
  Future<Stock> createUpdateProductos(Map<String, dynamic> stockLike) async{
try{
  final int? idStock = stockLike['idStock'];
      final String methos = (idStock == null) ? 'POST' : 'PUT';
      final String url =
          (idStock == null) ? Baseurl.registrarStock : Baseurl.actualizarStock;
    
  print('productLike $idStock');

      stockLike.remove('idStock');
     Map<String, dynamic> responseJson;

if ( methos ==  'POST') {
    responseJson = await HttpService(url).postRegisterHttp(stockLike, methos);


}else{
  responseJson = await HttpService(url).putHttp(stockLike, methos);
}


      final stocks = Stock.fromJson(responseJson);

      return stocks;
}catch (e, stackTrace) {
      print('e $e');
      print('stackTrace $stackTrace');

      rethrow;
    }
  }
}
