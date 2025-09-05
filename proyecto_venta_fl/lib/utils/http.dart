import 'package:dio/dio.dart';
import 'package:proyecto_venta_fl/utils/baseUrl.dart';

class HttpService {
  String endPoint;
  final Dio dio = Dio();

  HttpService(this.endPoint);

  Future getHttp() async {
    try {
      final response = await dio.get('${Baseurl.baseUrl}${endPoint}');

      return response.data;
    } catch (e) {
      print('Error: $e');
      return {}; // O puedes lanzar una excepción si prefieres
    }
  }


    Future putHttp(Map<String, dynamic>producto, String method ) async {
    try {


      final response = await dio.put(
        '${Baseurl.baseUrl}${endPoint}',
        data: producto,
        options: Options(
          method: method
        )
        );



      return response.data;
    } catch (e) {
      print('Error: $e');
      return {}; // O puedes lanzar una excepción si prefieres
    }
  }
  //

  Future postRegisterHttp(Map<String, dynamic>producto, String method ) async {
    try {


      final response = await dio.post(
        '${Baseurl.baseUrl}${endPoint}',
        data: producto,
        options: Options(
          method: method
        )
        );

print('response.data ${response.data}');

      return response.data as Map<String, dynamic>;
    } catch (e) {
      print('Error: $e');
      return {}; // O puedes lanzar una excepción si prefieres
    }
  }
}
