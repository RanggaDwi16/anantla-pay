import 'package:anantla_pay/src/core/provider/dio_provider.dart';
import 'package:anantla_pay/src/presentation/account/data/datasource/account_remote_datasource.dart';
import 'package:anantla_pay/src/presentation/account/data/repositories/account_repository_impl.dart';
import 'package:anantla_pay/src/presentation/account/domain/repository/account_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_impl_provider.g.dart';

@riverpod
AccountRepository accountRepository(AccountRepositoryRef ref) {
  return AccountRepositoryImpl(
      remoteDataSource: AccountRemoteDataSourceImpl(
          httpClient: ref.watch(userDioProvider),
          virtualHttpClient: ref.watch(virtualAccountDioProvider)));
}
