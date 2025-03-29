import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_wallet_params.freezed.dart';
part 'create_wallet_params.g.dart';

@freezed
class CreateWalletParams with _$CreateWalletParams {
  const factory CreateWalletParams({
    @JsonKey(name: "user_id") int? userId,
    @JsonKey(name: "country_code") String? countryCode,
  }) = _CreateWalletParams;

  factory CreateWalletParams.fromJson(Map<String, dynamic> json) =>
      _$CreateWalletParamsFromJson(json);
}
