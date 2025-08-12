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
}
