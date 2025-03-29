import 'package:anantla_pay/src/core/provider/dio_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/data/datasources/transfer_remote_datasource.dart';
import 'package:anantla_pay/src/presentation/transfer/data/repositories/transfer_repositories_impl.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/repository/transfer_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transfer_impl_provider.g.dart';

@riverpod
TransferRepository transferRepository(TransferRepositoryRef ref) {
  return TransferRepositoriesImpl(
    remoteDataSource: TransferRemoteDataSourceImpl(
      httpClient: ref.watch(userDioProvider),
    ),
  );
}
