import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../network/api_service.dart';
import '../network/network_properties.dart';

@module
abstract class AppModule {

  @injectable
  BaseOptions get baseOptions =>
      BaseOptions(baseUrl: NetworkProperties.BASE_URL);

  @injectable
  PrettyDioLogger get prettyDioLogger => PrettyDioLogger(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        logPrint: (log) {
           // return debugPrint(log as String);
        },
      );

  // Dio DI
  @injectable
  Dio get dioProvider {
    {
      Dio dio = Dio(baseOptions);
      dio.interceptors.add(
        prettyDioLogger,
      );
      return dio;
    }
  }

  // Api Service DI
  @injectable
  ApiService get apiService => ApiService(
        dio: dioProvider,
        baseUrl: NetworkProperties.BASE_URL,
      );

}
