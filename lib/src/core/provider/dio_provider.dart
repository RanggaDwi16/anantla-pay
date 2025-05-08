import 'package:anantla_pay/src/core/provider/token_manager_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

final baseUrl = dotenv.env['BASE_URL'];
final virtualAccount = dotenv.env['VIRTUAL_ACCOUNT'];

@riverpod
Dio userDio(UserDioRef ref) {
  final dio = Dio();
  dio.options.baseUrl = baseUrl!;
  dio.options.connectTimeout = const Duration(seconds: 120);
  dio.options.receiveTimeout = const Duration(seconds: 120);
  dio.options.headers['Content-Type'] = 'application/json';
  dio.options.headers['Accept'] = 'application/json';
  dio.options.validateStatus = (status) {
    return status != null && status >= 200 && status < 400;
  };

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final tokenManager = await ref.watch(tokenManagerProvider.future);
        final authToken = await tokenManager.getToken();
        options.headers['Authorization'] = 'Bearer $authToken';
        options.headers['x-api-key'] = 'mock-api-key';
        options.headers['User-Agent'] =
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36';
        print('User-Agent: ${options.headers['User-Agent']}');
        return handler.next(options);
      },
    ),
  );

  if (!kReleaseMode) {
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
    ));
  }

  return dio;
}

@riverpod
Dio virtualAccountDio(VirtualAccountDioRef ref) {
  final dio = Dio();
  dio.options.baseUrl = virtualAccount!;
  dio.options.connectTimeout = const Duration(seconds: 120);
  dio.options.receiveTimeout = const Duration(seconds: 120);
  dio.options.headers['Content-Type'] = 'application/json';
  dio.options.headers['Accept'] = 'application/json';
  dio.options.validateStatus = (status) {
    return status != null && status >= 200 && status < 400;
  };

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final tokenManager = await ref.watch(tokenManagerProvider.future);
        final authToken = await tokenManager.getTokenVirtualAccount();
        options.headers['Authorization'] = 'Bearer $authToken';

        options.headers['x-api-key'] = 'mock-api-key';
        return handler.next(options);
      },
    ),
  );

  if (!kReleaseMode) {
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
    ));
  }

  return dio;
}

@riverpod
Dio adminDio(AdminDioRef ref) {
  final dio = Dio();
  dio.options.baseUrl = baseUrl!;
  dio.options.connectTimeout = const Duration(seconds: 120);
  dio.options.receiveTimeout = const Duration(seconds: 120);
  dio.options.headers['Content-Type'] = 'application/json';
  dio.options.headers['Accept'] = 'application/json';
  dio.options.headers['Authorization'] =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjozLCJlbWFpbCI6IlJhbmdnYS5Ed2lAYW5hbnRsYS5jb20iLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3NDYwMDAxNDl9.WEScFavJhSt_GG94_zJc4FtPCj1OEHTSaNw47x3kxsw'; // Ganti dengan token admin
  dio.options.headers['x-api-key'] = 'mock-api-key';
  dio.options.headers['User-Agent'] =
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36';

  dio.options.validateStatus = (status) {
    return status != null && status >= 200 && status < 400;
  };

  if (!kReleaseMode) {
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
    ));
  }

  return dio;
}
