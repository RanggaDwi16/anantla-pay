import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_model.freezed.dart';
part 'qr_model.g.dart';

@freezed
class QrModel with _$QrModel {
  const factory QrModel({
    @JsonKey(name: "provider") String? provider,
    @JsonKey(name: "account") String? account,
    @JsonKey(name: "amount") String? amount,
    @JsonKey(name: "currency") String? currency,
    @JsonKey(name: "merchant") String? merchant,
    @JsonKey(name: "type") String? type,
  }) = _QrModel;

  factory QrModel.fromJson(Map<String, dynamic> json) =>
      _$QrModelFromJson(json);
}

@freezed
class TransferQrModel with _$TransferQrModel {
  const factory TransferQrModel({
    required String type,
    @JsonKey(name: 'wallet_id_to') required int walletIdTo,
    required int amount,
    required String currency,
    required String note,
  }) = _TransferQrModel;

  factory TransferQrModel.fromJson(Map<String, dynamic> json) =>
      _$TransferQrModelFromJson(json);
}
