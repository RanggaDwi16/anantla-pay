import 'package:anantla_pay/src/core/provider/dio_provider.dart';
import 'package:anantla_pay/src/presentation/qr/data/datasources/qr_remote_datasource.dart';
import 'package:anantla_pay/src/presentation/qr/data/repositories/qr_repository_impl.dart';
import 'package:anantla_pay/src/presentation/qr/domain/repository/qr_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'qr_impl_provider.g.dart';

@riverpod
QrRepository qrRepository(QrRepositoryRef ref) {
  return QrRepositoryImpl(remoteDataSource: QrRemoteDataSourceImpl(httpClient: ref.watch(userDioProvider)));
}