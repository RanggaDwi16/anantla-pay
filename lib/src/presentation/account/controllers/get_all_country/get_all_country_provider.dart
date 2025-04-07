import 'package:anantla_pay/src/presentation/account/controllers/account_impl_provider.dart';
import 'package:anantla_pay/src/presentation/account/domain/usecases/get_all_country.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_all_country_provider.g.dart';

@riverpod
GetAllCountry getAllCountry (GetAllCountryRef ref) {
  return GetAllCountry(accountRepository: ref.watch(accountRepositoryProvider));
}