import 'package:anantla_pay/src/core/provider/dio_provider.dart';
import 'package:anantla_pay/src/presentation/home/data/datasources/home_remote_datasource.dart';
import 'package:anantla_pay/src/presentation/home/data/repositories/home_repository_impl.dart';
import 'package:anantla_pay/src/presentation/home/domain/repository/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_impl_provider.g.dart';

@riverpod
HomeRepository homeRepository(HomeRepositoryRef ref) {
  return HomeRepositoryImpl(
      remoteDataSource:
          HomeRemoteDataSourceImpl(httpClient: ref.watch(userDioProvider)));
}
