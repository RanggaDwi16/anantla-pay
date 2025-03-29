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
      role: json['role'] as String?,
      userStatus: json['user_status'] as String?,
      countryCode: json['country_code'] as String?,
      eKycStatus: json['e_kyc_status'] as String?,
      phone: json['phone'],
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'client_id': instance.clientId,
      'email': instance.email,
      'username': instance.username,
      'role': instance.role,
      'user_status': instance.userStatus,
      'country_code': instance.countryCode,
      'e_kyc_status': instance.eKycStatus,
      'phone': instance.phone,
      'created': instance.created?.toIso8601String(),
    };
