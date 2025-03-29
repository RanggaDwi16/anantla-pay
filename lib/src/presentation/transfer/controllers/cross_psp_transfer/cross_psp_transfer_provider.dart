import 'package:anantla_pay/src/presentation/transfer/controllers/transfer_impl_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/usecases/cross_psp_transfer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cross_psp_transfer_provider.g.dart';

@riverpod
CrossPspTransfer crossPspTransfer(CrossPspTransferRef ref) {
  return CrossPspTransfer(
      transferRepository: ref.watch(transferRepositoryProvider));
}
