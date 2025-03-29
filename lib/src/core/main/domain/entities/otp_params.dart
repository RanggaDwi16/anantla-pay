import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_params.freezed.dart';

part 'otp_params.g.dart';

@freezed
class OtpParams with _$OtpParams {
  const factory OtpParams({
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "otp_code") String? otpCode,
  }) = _OtpParams;

  factory OtpParams.fromJson(Map<String, dynamic> json) =>
      _$OtpParamsFromJson(json);
}
