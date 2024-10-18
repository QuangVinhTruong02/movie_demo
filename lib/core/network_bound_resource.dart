import 'dart:async';

import 'package:dio/dio.dart';
import 'package:movie_demo/core/manager/internet_connectivity_manager.dart';
import 'package:movie_demo/core/resource.dart';
import 'package:movie_demo/core/resource_type.dart';

class NetworkBoundResource<RequestType, ResultType> {
  final Completer<Resource<ResultType>> _result = Completer<Resource<ResultType>>();

  Future<Resource<ResultType>> getAsFuture() => _result.future;

  Stream<Resource<ResultType>> getAsStream() => Stream.fromFuture(_result.future);

  final Future<RequestType> Function() createSerializedCall;

  final bool shouldFetch;

  final Future<ResultType> Function()? loadFromDb;

  final Future<void> Function(ResultType result)? saveCallResult;

  final ResultType Function(RequestType json)? parsedData;

  NetworkBoundResource({
    required this.createSerializedCall,
    this.loadFromDb,
    this.saveCallResult,
    this.parsedData,
    this.shouldFetch = true,
  }) {
    shouldFetch ? _fetchFromServerWithSerialization() : _fetchFromDb();
  }

  Future<void> _fetchFromServerWithSerialization() async {
    if (!await (InternetConnectivityManager().isConnected)) {
      _result.complete(Resource.withDisconnect());
      return;
    }

    //call request from network
    createSerializedCall.call().then((RequestType resource) async {
      ResultType? result;

      if (resource is ResultType) {
        result = resource;
      } else {
        result = parsedData?.call(resource);
      }

      if (result != null) {
        await saveCallResult?.call(result); // cache database
      }

      if (loadFromDb != null) {
        result = await loadFromDb!();
      }

      if (result != null) {
        _result.complete(Resource.withHasData(result));
      } else {
        _result.complete(Resource.withNoData());
      }
    }).catchError((error) async {
      ResultType? data = await loadFromDb?.call();
      if (error is DioException) {
        _result.complete(Resource.withError(error, data: data));
      } else {
        _result.complete(Resource(
          message: error.toString(),
          code: ResourceType.requestResponse,
          data: data,
        ));
      }
    });
  }

  Future<void> _fetchFromDb() async {
    ResultType? result = await loadFromDb?.call(); // call request from database
    if (result == null) {
      _result.complete(Resource.withNoData());
    } else {
      _result.complete(Resource.withHasData(result));
    }
  }
}
