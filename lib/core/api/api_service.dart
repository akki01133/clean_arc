import 'package:clean_arc/core/api/api_interface.dart';
import 'package:clean_arc/core/api/dio_service.dart';
import 'package:clean_arc/core/api/models.dart';
import 'package:clean_arc/utils/constant.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

import '../../exceptions/exceptions.dart';

class ApiService extends ApiInterface {

  late final DioService _dioService;

  ApiService(DioService dioService): _dioService = dioService;
  @override
  void cancelRequests({CancelToken? cancelToken}) {
    _dioService.cancelRequests(cancelToken: cancelToken);
  }

  @override
  Future<T> deleteData<T>(
      {required String endpoint,
      JSON? data,
      CancelToken? cancelToken,
      bool requiresAuthToken = true,
      required T Function(ResponseModel<JSON> response) converter}) async{
    ResponseModel<JSON> response;
    try {
      response = await _dioService.delete<JSON>(
        endpoint: endpoint,
        data: data,
        options: Options(
          extra: <String, Object?>{
            'requiresAuthToken': requiresAuthToken,
          },
        ),
        cancelToken: cancelToken,
      );
    } on Exception catch (ex) {
      throw CustomException.fromDioException(ex);
    }
    try {
      return converter(response);
    } on Exception catch (ex) {
      throw CustomException.fromParsingException(ex);
    }
  }

  @override
  Future downloadData(
      {required String endpoint,
        required String savePath,
      JSON? data,
      CancelToken? cancelToken,
      bool requiresAuthToken = true}) {
    // TODO: implement downloadData
    throw UnimplementedError();
  }

  @override
  Future<List<T>> getCollectionData<T>(
      {required String endpoint,
      JSON? queryParams,
      CancelToken? cancelToken,
      CachePolicy? cachePolicy,
      int? cacheAgeDays,
      bool requiresAuthToken = true,
      required T Function(JSON responseBody) converter}) async{
    List<Object?> body;
    try {
      // Entire map of response
      final data = await _dioService.get<List<Object?>>(
        endpoint: endpoint,
        cacheOptions: _dioService.globalCacheOptions?.copyWith(
          policy: cachePolicy,
          maxStale: cacheAgeDays != null
              ? Nullable(Duration(days: cacheAgeDays))
              : null,
        ),
        options: Options(
          extra: <String, Object?>{
            /// todo - handle this
            'requiresAuthToken': requiresAuthToken,
          },
        ),
        queryParams: queryParams,
        cancelToken: cancelToken,
      );

      // Items of table as json
      body = data.body;
    } on Exception catch (ex) {
      throw CustomException.fromDioException(ex);
    }

    try {
      // Returning the deserialized objects
      return body.map((dataMap) => converter(dataMap! as JSON)).toList();
    } on Exception catch (ex) {
      throw CustomException.fromParsingException(ex);
    }
  }

  @override
  Future<T> getDocumentData<T>(
      {required String endpoint,
      JSON? queryParams,
      CancelToken? cancelToken,
      CachePolicy? cachePolicy,
      int? cacheAgeDays,
      bool requiresAuthToken = true,
      required T Function(JSON response) converter}) async{
    JSON body;
    try {
      // Entire map of response
      final data = await _dioService.get<JSON>(
        endpoint: endpoint,
        queryParams: queryParams,
        cacheOptions: _dioService.globalCacheOptions?.copyWith(
          policy: cachePolicy,
          maxStale: cacheAgeDays != null
              ? Nullable(Duration(days: cacheAgeDays))
              : null,
        ),
        options: Options(
          extra: <String, Object?>{
            'requiresAuthToken': requiresAuthToken,
          },
        ),
        cancelToken: cancelToken,
      );
      body = data.body;
    } on Exception catch (ex) {
      throw CustomException.fromDioException(ex);
    }
    try {
      return converter(body);
    } on Exception catch (ex) {
      throw CustomException.fromParsingException(ex);
    }
  }

  @override
  Future<List<T>> setAndGetCollectionData<T>(
      {required String endpoint,
      required JSON data,
      CancelToken? cancelToken,
      bool requiresAuthToken = true,
      required T Function(JSON response) converter}) async{
    List<Object?> body;

    try {
      // Entire map of response
      final response = await _dioService.post<List<JSON>>(
        endpoint: endpoint,
        data: data,
        options: Options(
          extra: <String, Object?>{
            'requiresAuthToken': requiresAuthToken,
          },
        ),
        cancelToken: cancelToken,
      );

      // Items of table as json
      body = response.body;
    } on Exception catch (ex) {
      throw CustomException.fromDioException(ex);
    }

    try {
      // Returning the deserialized objects
      return body.map((dataMap) => converter(dataMap! as JSON)).toList();
    } on Exception catch (ex) {
      throw CustomException.fromParsingException(ex);
    }
  }

  @override
  Future<T> setData<T>(
      {required String endpoint,
      required JSON data,
      CancelToken? cancelToken,
      bool requiresAuthToken = true,
      required T Function(ResponseModel<JSON> response) converter}) async{
    ResponseModel<JSON> response;
    try {
      response = await _dioService.post<JSON>(
        endpoint: endpoint,
        data: data,
        options: Options(
          extra: <String, Object?>{
            'requiresAuthToken': requiresAuthToken,
          },
        ),
        cancelToken: cancelToken,
      );
    } on Exception catch (ex) {
      throw CustomException.fromDioException(ex);
    }
    try {
      return converter(response);
    } on Exception catch (ex) {
      throw CustomException.fromParsingException(ex);
    }
  }

  @override
  Future<T> updateData<T>(
      {required String endpoint,
      required JSON data,
      CancelToken? cancelToken,
      bool requiresAuthToken = true,
      required T Function(ResponseModel<JSON> response) converter}) async{
    ResponseModel<JSON> response;

    try {
      // Entire map of response
      response = await _dioService.patch<JSON>(
        endpoint: endpoint,
        data: data,
        options: Options(
          extra: <String, Object?>{
            'requiresAuthToken': requiresAuthToken,
          },
        ),
        cancelToken: cancelToken,
      );
    } on Exception catch (ex) {
      throw CustomException.fromDioException(ex);
    }

    try {
      // Returning the serialized object
      return converter(response);
    } on Exception catch (ex) {
      throw CustomException.fromParsingException(ex);
    }
  }
}
