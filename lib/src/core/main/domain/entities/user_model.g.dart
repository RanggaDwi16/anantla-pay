// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      userId: (json['user_id'] as num?)?.toInt(),
      clientId: (json['client_id'] as num?)?.toInt(),
      email: json['email'] as String?,
      username: json['username'] as String?,
      userStatus: json['user_status'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
      publicKey: json['public_key'],
      eKycStatus: json['e_kyc_status'] as String?,
      eKycVerifiedAt: json['e_kyc_verified_at'],
      phone: json['phone'] as String?,
      role: json['role'] as String?,
      ekycVerifiedAt: json['ekyc_verified_at'] == null
          ? null
          : DateTime.parse(json['ekyc_verified_at'] as String),
      profilePicture: json['profile_picture'],
      countryCode: json['country_code'] as String?,
      tosAcceptedAt: json['tos_accepted_at'],
      pspId: (json['psp_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'client_id': instance.clientId,
      'email': instance.email,
      'username': instance.username,
      'user_status': instance.userStatus,
      'created': instance.created?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
      'public_key': instance.publicKey,
      'e_kyc_status': instance.eKycStatus,
      'e_kyc_verified_at': instance.eKycVerifiedAt,
      'phone': instance.phone,
      'role': instance.role,
      'ekyc_verified_at': instance.ekycVerifiedAt?.toIso8601String(),
      'profile_picture': instance.profilePicture,
      'country_code': instance.countryCode,
      'tos_accepted_at': instance.tosAcceptedAt,
      'psp_id': instance.pspId,
    };
