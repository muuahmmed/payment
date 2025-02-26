import 'package:dio/dio.dart';
import 'dart:core';
import 'package:payment/componets/constants.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: AOIConstants.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    print('Sending request to: $url');
    print('Request data: $data');
    return dio.post(
      url,
      data: data,
    );
  }
}
