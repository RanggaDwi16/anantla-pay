import 'package:anantla_pay/src/presentation/transfer/controllers/transfer_impl_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/usecases/internal_transfer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'internal_transfer_provider.g.dart';

@riverpod
InternalTransfer internalTransfer (InternalTransferRef ref) {
  return InternalTransfer(transferRepository: ref.read(transferRepositoryProvider));
}