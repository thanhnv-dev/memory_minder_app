import 'package:dio/dio.dart';
import 'package:memory_minder_app/core/data_sources/core_local_storage.dart';
import 'package:memory_minder_app/core/error/exceptions.dart';
import 'package:memory_minder_app/flavors.dart';
import 'api_interceptors.dart';

class CoreApiUtil {
  static Dio? _dio;

  CoreApiUtil._internal();

  static final CoreApiUtil _coreApiUtil = CoreApiUtil._internal();

  factory CoreApiUtil() {
    return _coreApiUtil;
  }

  Dio getDio({
    Function({
      String method,
      String uri,
      dynamic token,
      dynamic data,
    })? requestResult,
    Function({
      int? statusCode,
      String uri,
      dynamic data,
    })? responseResult,
  }) {
    if (_dio == null) {
      _dio = Dio(
        BaseOptions(
          baseUrl: F.baseUrl,
        ),
      );

      _dio!.options.connectTimeout = const Duration(seconds: 60);

      _dio!.interceptors.add(
        ApiInterceptors(
          handleError: Exceptions().handlerDioException,
          getToken: CoreLocalStorageDataSourceImpl().getToken,
          requestResult: requestResult,
          responseResult: responseResult,
        ),
      );
    }
    return _dio!;
  }
}
