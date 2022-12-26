
import 'package:advance_fluuter_project/app/app_constant.dart';
import 'package:advance_fluuter_project/app/app_prefs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";

class DioFactory{

  AppPreferences _applicationPreferences;

  DioFactory(this._applicationPreferences);


  Future<Dio> getDio() async{
    int  _timeOut = 60 * 1000;
    String language = await _applicationPreferences.getApplicationLanguageType();
    Dio dio = Dio();

    Map<String,String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT:APPLICATION_JSON,
      AUTHORIZATION:  Constant.token,
      DEFAULT_LANGUAGE: language
    };
    dio.options = BaseOptions(
    baseUrl: Constant.baseUrl,
      connectTimeout:  _timeOut,
      receiveTimeout:  _timeOut,
      headers: headers);


    if (kReleaseMode) {
      print("app on  kRelease mode No Logs available");
      
    } else{
      dio.interceptors.add(PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true
      ));
    }
    
    return dio;
  }
}