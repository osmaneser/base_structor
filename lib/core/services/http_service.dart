import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../configs/app_config.dart';

class HttpService {
  HttpService() {
    print("HttpService Init");
    initInterceptor();
  }

  Dio dio;
  Future<void> initInterceptor() async {
    try {
      this.dio = Dio();

      dio.interceptors.add(
        InterceptorsWrapper(
          onError: (e) {
            switch (e.response.statusCode) {
              case HttpStatus.accepted:
                return "";
                break;

              case HttpStatus.unauthorized:
                return "";
                break;

              case HttpStatus.notFound:
                return "";
                break;

              case HttpStatus.badRequest:
                return "";
                break;

              default:
                return "default";
            }
          },
          onRequest: (e) {
            Map<String, String> headers = {
              HttpHeaders.contentTypeHeader: "application/json", // or whatever
              //HttpHeaders.authorizationHeader: "Bearer $token",
            };

            e.headers = headers;
          },
          onResponse: (e) {
            //TODO: something...
          },
        ),
      );
    } catch (e) {
      //TODO: it will control errror status
      print("EX => e.toString()");
      print(e.toString());
    }
  }

  Future<dynamic> httpGet<T>({@required String url}) async {
    return await this.dio.get(AppConfig.baseUrl + url);
  }

  Future<dynamic> httpGetWithParameter<T>({@required String url, List<Map<String, dynamic>> parameters}) async {
    String finalParameter = "";
    parameters.forEach((parameter) {
      finalParameter += parameter["key"] + "=" + parameter["value"] + (parameters.indexOf(parameter) == parameters.length - 1 ? "" : "&");
    });
    return await this.dio.get(AppConfig.baseUrl + url + finalParameter);
  }

  Future<dynamic> httpPost({@required String url, @required dynamic data}) async {
    return await this.dio.post(AppConfig.baseUrl + url, data: data);
  }
}