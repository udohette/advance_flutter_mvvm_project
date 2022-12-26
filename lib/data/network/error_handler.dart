import 'dart:math';

import 'package:advance_fluuter_project/data/network/failure.dart';
import 'package:dio/dio.dart';

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERORR,
  CONNECTIONTION_TIMEOUT,
  CANCEL,
  RECEIVED_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}
class ErrorHandler implements Exception{
  late Failure failure;

  ErrorHandler.handler(dynamic error){
    // dio  error is error from  API
           if (error is DioError) {
             failure = _handleError(error);

           } else{
             // default error
             failure = DataSource.DEFAULT.getFailure();

           }
  }
  Failure _handleError(DioError  error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        return DataSource.CONNECTIONTION_TIMEOUT.getFailure();
      case DioErrorType.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailure();
      case DioErrorType.receiveTimeout:
        return DataSource.RECEIVED_TIMEOUT.getFailure();

      case DioErrorType.response:
      switch(error.response?.statusCode){
        case ResponseCode.BAD_REQUEST:
          return DataSource.BAD_REQUEST.getFailure();
        case ResponseCode.FORBIDDEN:
          return DataSource.FORBIDDEN.getFailure();
        case ResponseCode.UNAUTHORISED:
          return DataSource.UNAUTHORISED.getFailure();
        case ResponseCode.NOT_FOUND:
          return DataSource.NOT_FOUND.getFailure();
        case ResponseCode.INTERNAL_SERVER_ERORR:
          return DataSource.INTERNAL_SERVER_ERORR.getFailure();
        default:
          return DataSource.DEFAULT.getFailure();

      }
      case DioErrorType.cancel:
        return DataSource.CANCEL.getFailure();
      case DioErrorType.other:
        return DataSource.DEFAULT.getFailure();
      default:
        return DataSource.DEFAULT.getFailure();
    }
  }
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {

      case DataSource.BAD_REQUEST:
       return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);
      case DataSource.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);
      case DataSource.UNAUTHORISED:
        return Failure(ResponseCode.UNAUTHORISED, ResponseMessage.UNAUTHORISED);
      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);
      case DataSource.INTERNAL_SERVER_ERORR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERORR, ResponseMessage.INTERNAL_SERVER_ERORR);
      case DataSource.CONNECTIONTION_TIMEOUT:
        return Failure(ResponseCode.CONNECTION_TIMEOUT, ResponseMessage.CONNECTION_TIMEOUT);
      case DataSource.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);
      case DataSource.RECEIVED_TIMEOUT:
        return Failure(ResponseCode.RECEIVE_TIMEOUT, ResponseMessage.RECEIVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);
      case DataSource.CACHE_ERROR:
        return Failure(ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION, ResponseMessage.NO_INTERNET_CONNECTION);

      case DataSource.DEFAULT:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);

      default:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);

    }
  }
}

class ResponseCode {
  // API Status Codes
  static const int SUCCESS = 200; // Success with  data
  static const int NO_CONTENT = 201; // success with  no  data
  static const int BAD_REQUEST = 400; // failure, api rejected the request
  static const int FORBIDDEN = 403; // failure, api rejected the request
  static const int UNAUTHORISED = 401; // Failure User is not authorised
  static const int NOT_FOUND = 404; // Failure, API url is not correct and not found
  static const int INTERNAL_SERVER_ERORR = 500; //failure, crash happened at server side

  //Local Status Code
  static const int DEFAULT = -1;
  static const int CONNECTION_TIMEOUT = -2;
  static const int CANCEL = -3;
  static const int RECEIVE_TIMEOUT = -4;
  static const int SEND_TIMEOUT = -5;
  static const int CACHE_ERROR = -6;
  static const int NO_INTERNET_CONNECTION = -7;
}

class ResponseMessage {
  // API Status Message
  static const String SUCCESS = "Success"; // Success with  data
  static const String NO_CONTENT = "success with  no  content"; // success with  no  content
  static const String BAD_REQUEST = "Bad Request, try Again Later"; // failure, api rejected the request
  static const String FORBIDDEN = "Forbidden Request, Try Again Later"; // failure, api rejected the request
  static const String UNAUTHORISED = "User is UnAuthorised, Please  try again Again"; // Failure User is not authorised
  static const String NOT_FOUND = "Url not found, try again later"; // Failure, API url is not correct and not found
  static const String INTERNAL_SERVER_ERORR = "Something Went wrong"; //failure, crash happened at server side

  //Local Status Message
  static const String DEFAULT = "Something Went wrong";
  static const String CONNECTION_TIMEOUT = "Time out Error, please try again";
  static const String CANCEL = "request was cancelled, please try again";
  static const String RECEIVE_TIMEOUT = "receive time out error, please try again";
  static const String SEND_TIMEOUT = "send   time out error, please try again";
  static const String CACHE_ERROR = "cache  error  , please try again";
  static const String NO_INTERNET_CONNECTION = "Please check your internet  connections ";
}
class APIInternalStatus
{
  static const int SUCCESS = 0;
  static const int  FAILURE = 1;
}