import 'package:anantla_pay/src/presentation/account/controllers/account_impl_provider.dart';
import 'package:anantla_pay/src/presentation/account/domain/usecases/get_all_bank.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_all_bank.g.dart';

@riverpod
GetAllBank getAllBank (GetAllBankRef ref) {
  return GetAllBank(accountRepository: ref.read(accountRepositoryProvider));
}