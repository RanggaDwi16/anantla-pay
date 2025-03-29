import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_param.freezed.dart';
part 'register_param.g.dart';

@freezed
class RegisterParams with _$RegisterParams {
  const factory RegisterParams({
    @JsonKey(name: "client_id") int? clientId,
    @JsonKey(name: "username") String? username,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "phone") String? phone,
    @JsonKey(name: "country_code") String? countryCode,
  }) = _RegisterParams;

  factory RegisterParams.fromJson(Map<String, dynamic> json) =>
      _$RegisterParamsFromJson(json);
}
