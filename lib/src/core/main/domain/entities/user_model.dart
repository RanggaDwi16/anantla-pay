import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: "user_id") int? userId,
    @JsonKey(name: "client_id") int? clientId,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "username") String? username,
    @JsonKey(name: "user_status") String? userStatus,
    @JsonKey(name: "created") DateTime? created,
    @JsonKey(name: "updated") DateTime? updated,
    @JsonKey(name: "public_key") dynamic publicKey,
    @JsonKey(name: "e_kyc_status") String? eKycStatus,
    @JsonKey(name: "e_kyc_verified_at") dynamic eKycVerifiedAt,
    @JsonKey(name: "phone") String? phone,
    @JsonKey(name: "role") String? role,
    @JsonKey(name: "ekyc_verified_at") DateTime? ekycVerifiedAt,
    @JsonKey(name: "profile_picture") dynamic profilePicture,
    @JsonKey(name: "country_code") String? countryCode,
    @JsonKey(name: "tos_accepted_at") dynamic tosAcceptedAt,
    @JsonKey(name: "psp_id") int? pspId,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
