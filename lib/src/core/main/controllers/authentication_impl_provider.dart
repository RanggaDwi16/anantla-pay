import 'package:anantla_pay/src/core/main/data/datasources/authentication_remote_datasource.dart';
import 'package:anantla_pay/src/core/main/data/repositories/authentication_repository_impl.dart';
import 'package:anantla_pay/src/core/main/domain/repository/authentication_repository.dart';
import 'package:anantla_pay/src/core/provider/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_impl_provider.g.dart';

@riverpod
AuthenticationRepository authenticationRepository(
    AuthenticationRepositoryRef ref) {
  return AuthenticationRepositoryImpl(
      remoteDataSource: AuthenticationRemoteDataSourceImpl(
    httpClient: ref.watch(userDioProvider),
    adminHttpClient: ref.watch(adminDioProvider),
  ));
}
