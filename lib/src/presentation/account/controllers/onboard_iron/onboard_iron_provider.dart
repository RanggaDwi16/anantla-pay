import 'package:anantla_pay/src/presentation/account/controllers/account_impl_provider.dart';
import 'package:anantla_pay/src/presentation/account/domain/usecases/onboard_iron.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboard_iron_provider.g.dart';

@riverpod
OnboardIron onboardIron (OnboardIronRef ref) {
  return OnboardIron(
    repository: ref.watch(accountRepositoryProvider),
  );
}