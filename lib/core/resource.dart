import 'package:dio/dio.dart';
import 'package:movie_demo/core/resource_type.dart';
import 'package:movie_demo/utils/app_languages.dart';

class Resource<DataType> {
  int code;
  String message;
  DataType? data;

  Resource({this.code = 0, this.message = "", this.data});

  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
        'data': data,
      };

  factory Resource.withHasData(DataType data) => Resource(
        code: ResourceType.requestSuccess,
        message: AppLanguages.success,
        data: data,
      );

  factory Resource.withNoData() => Resource(
        code: ResourceType.requestNullData,
        message: AppLanguages.successNoData,
      );

  factory Resource.withDisconnect() => Resource(
        message: AppLanguages.noInternetConnection,
        code: ResourceType.requestDisconnect,
      );

  factory Resource.withError(DioException error, {DataType? data}) {
    String message = "";
    final int code;
    switch (error.type) {
      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
        code = ResourceType.requestConnectTimeOut;
        message = AppLanguages.connectTimeOut;
        break;
      case DioExceptionType.sendTimeout:
        code = ResourceType.requestSendTimeout;
        message = AppLanguages.sendTimeOut;
        break;
      case DioExceptionType.receiveTimeout:
        code = ResourceType.requestReceiveTimeout;
        message = AppLanguages.receiveTimOut;
        break;
      case DioExceptionType.badResponse:
        Response? response = error.response;
        code = response?.statusCode ?? ResourceType.requestResponse;
        if (response != null) {
          message = response.data is String
              ? response.data
              : response.data is Map<String, dynamic>
                  ? response.data["status_message"] ?? ""
                  : "";
        }
        break;
      case DioExceptionType.cancel:
        code = ResourceType.requestCancel;
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        code = ResourceType.requestErrorServer;
        message = error.response?.statusMessage ?? AppLanguages.somethingWentWrong;
        break;
    }
    return Resource(code: code, message: message);
  }

  bool get isSuccess => code == ResourceType.requestSuccess;

  bool get isErrorToken => code == ResourceType.requestErrorToken;

  bool get isError => code != ResourceType.requestSuccess;

  bool get isDisconnect =>
      code == ResourceType.requestDisconnect || code == ResourceType.requestErrorServer;
}
