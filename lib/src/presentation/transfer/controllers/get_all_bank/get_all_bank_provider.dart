import 'package:anantla_pay/src/presentation/transfer/controllers/transfer_impl_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/usecases/get_all_bank.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_all_bank_provider.g.dart';

@riverpod
GetAllBank getAllBank(GetAllBankRef ref) {
  return GetAllBank(transferRepository: ref.watch(transferRepositoryProvider));
}
