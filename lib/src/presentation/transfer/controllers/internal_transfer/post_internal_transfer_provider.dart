import 'package:anantla_pay/src/core/main/controllers/notification_service/notification_services.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/internal_transfer/internal_transfer_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/entities/transfer_params.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/usecases/internal_transfer.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_internal_transfer_provider.g.dart';

@Riverpod(keepAlive: true)
class PostInternalTransfer extends _$PostInternalTransfer {
  @override
  FutureOr<String?> build() {
    return null;
  }

  Future<void> postInternalTranfer({
    required InternalTransferParams params,
    required Function(String message) onSuccess,
    required Function(String message) onError,
  }) async {
    state = const AsyncLoading();
    NotificationService notificationService = NotificationService();
    final fcmToken = await notificationService.getToken();
    InternalTransfer internalTransfer =
        await ref.read(internalTransferProvider);
    final result = await internalTransfer(InternalTransferParams(
      amount: params.amount,
      fromWalletId: params.fromWalletId,
      toWalletId: params.toWalletId,
      note: params.note,
      firebaseToken: fcmToken,
      otpCode: params.otpCode,
    ));
    return result.fold(
      (error) {
        state = AsyncError(error, StackTrace.current);
        onError(error);
      },
      (data) {
        onSuccess(data);
        state = AsyncData('Transfer Success');
      },
    );
  }
}
