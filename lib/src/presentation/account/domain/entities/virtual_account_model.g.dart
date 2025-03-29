// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'virtual_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VirtualAccountModelImpl _$$VirtualAccountModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VirtualAccountModelImpl(
      accessToken: json['access_token'] as String?,
      expiresIn: (json['expires_in'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$VirtualAccountModelImplToJson(
        _$VirtualAccountModelImpl instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'expires_in': instance.expiresIn,
    };
