import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final String _baseUrl='https://www.googleapis.com/books/v1/';
  ApiService(this._dio);

  Future<Map<String,dynamic>> get({required String endPoint,Map<String, dynamic>? queryParameters})async{
    var response = await _dio.get('$_baseUrl$endPoint',queryParameters: queryParameters);
    return response.data;
  }
}