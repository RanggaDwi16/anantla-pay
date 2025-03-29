import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_model.freezed.dart';
part 'wallet_model.g.dart';

@freezed
class WalletModel with _$WalletModel {
  const factory WalletModel({
    @JsonKey(name: "wallet_id") int? walletId,
    @JsonKey(name: "user_id") int? userId,
    @JsonKey(name: "username") String? username,
    @JsonKey(name: "phone") dynamic phone,
    @JsonKey(name: "country_code") String? countryCode,
    @JsonKey(name: "currency") String? currency,
  }) = _WalletModel;

  factory WalletModel.fromJson(Map<String, dynamic> json) =>
      _$WalletModelFromJson(json);
}
