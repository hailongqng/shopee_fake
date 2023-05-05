import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shopee_fake/common/base_response_object.dart';

class HttpClient {
  static HttpClient? _instance;
  Dio dio = Dio();
  String jwtToken = "";

  HttpClient._internal(String baseUrl) {
    var options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 30000,
      contentType: "application/json",
    );
    dio = Dio(options);
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (jwtToken.isNotEmpty) {
          options.headers.update(
            "Authorization",
            (value) => "Bearer $jwtToken",
            ifAbsent: () => "Bearer $jwtToken",
          );
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (e, handler) {
        return handler.next(e);
      },
    ));
    _instance = this;
  }

  void addLoggingRequest(RequestOptions options) {
    logPrint("*** API Request - Start ***");

    printKV("URI", options.uri);
    printKV("METHOD", options.method);
    logPrint("HEADERS:");
    options.headers.forEach((key, v) => printKV(" - $key", v));
    logPrint("BODY:");
    printAll(options.data ?? "");

    logPrint("*** API Request - End ***");
  }

  void addLoggingResponse(Response response) {
    debugPrint("*** Api Response - Start ***");
    debugPrint("STATUS CODE: ${response.statusCode}");
    debugPrint("REDIRECT: ${response.isRedirect}");
    debugPrint("BODY:\n");
    debugPrint(response.data, wrapWidth: 1024);
    debugPrint("*** Api Response - End ***");
  }

  void addLoggingError(DioError err) {
    logPrint("*** Api Error - Start ***:");

    if (err.response != null) {
      logPrint("STATUS CODE: ${err.response!.statusCode?.toString()}");
    }
    logPrint("$err");
    if (err.response != null) {
      printKV("REDIRECT", err.response!.realUri);
      logPrint("BODY:");
      printAll(err.response?.toString());
    }

    logPrint("*** Api Error - End ***:");
  }

  void printKV(String key, Object v) {
    logPrint("$key: $v");
  }

  void printAll(msg) {
    msg.toString().split("\n").forEach(logPrint);
  }

  void logPrint(String s) {
    debugPrint(s);
  }

  dynamic getRequest(
    String url,
    dynamic params, {
    bool responseRaw = false,
    ignoreCheckSuccess = false,
    CancelToken? cancelToken,
  }) async {
    try {
      var response =
          await dio.get(url, queryParameters: params, cancelToken: cancelToken);
      if (ignoreCheckSuccess) return response.data;
      return handleResponse(response, responseRaw: responseRaw);
    } catch (error) {
      DioError err = error as DioError;
      if (CancelToken.isCancel(err)) throw err;
      var res = err.response;
      if (res != null) {
        handleResponse(res);
      }
      throw ('Cannot connect to server, please try again later');
    }
  }

  dynamic handleResponse(Response response, {bool responseRaw = false}) {
    final res = response.data is String
        ? BaseResponseObject()
        : BaseResponseObject.fromJson(response.data);
    if (res.isSuccess()) {
      if (responseRaw) {
        return response.data;
      }
      var json = response.data['message'];
      return json;
    } else {
      throw (res.getErrorMessage(httpCode: response.statusCode));
    }
  }

  factory HttpClient(String baseUrl) =>
      _instance ?? HttpClient._internal(baseUrl);
}
