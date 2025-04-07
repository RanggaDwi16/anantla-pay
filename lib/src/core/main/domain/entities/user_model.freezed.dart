// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @JsonKey(name: "user_id")
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "client_id")
  int? get clientId => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "username")
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: "user_status")
  String? get userStatus => throw _privateConstructorUsedError;
  @JsonKey(name: "created")
  DateTime? get created => throw _privateConstructorUsedError;
  @JsonKey(name: "updated")
  DateTime? get updated => throw _privateConstructorUsedError;
  @JsonKey(name: "public_key")
  dynamic get publicKey => throw _privateConstructorUsedError;
  @JsonKey(name: "e_kyc_status")
  String? get eKycStatus => throw _privateConstructorUsedError;
  @JsonKey(name: "e_kyc_verified_at")
  dynamic get eKycVerifiedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "phone")
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: "role")
  String? get role => throw _privateConstructorUsedError;
  @JsonKey(name: "ekyc_verified_at")
  DateTime? get ekycVerifiedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "profile_picture")
  dynamic get profilePicture => throw _privateConstructorUsedError;
  @JsonKey(name: "country_code")
  String? get countryCode => throw _privateConstructorUsedError;
  @JsonKey(name: "tos_accepted_at")
  dynamic get tosAcceptedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "psp_id")
  int? get pspId => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "user_id") int? userId,
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
      @JsonKey(name: "psp_id") int? pspId});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? clientId = freezed,
    Object? email = freezed,
    Object? username = freezed,
    Object? userStatus = freezed,
    Object? created = freezed,
    Object? updated = freezed,
    Object? publicKey = freezed,
    Object? eKycStatus = freezed,
    Object? eKycVerifiedAt = freezed,
    Object? phone = freezed,
    Object? role = freezed,
    Object? ekycVerifiedAt = freezed,
    Object? profilePicture = freezed,
    Object? countryCode = freezed,
    Object? tosAcceptedAt = freezed,
    Object? pspId = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      clientId: freezed == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as int?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      userStatus: freezed == userStatus
          ? _value.userStatus
          : userStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      publicKey: freezed == publicKey
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as dynamic,
      eKycStatus: freezed == eKycStatus
          ? _value.eKycStatus
          : eKycStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      eKycVerifiedAt: freezed == eKycVerifiedAt
          ? _value.eKycVerifiedAt
          : eKycVerifiedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      ekycVerifiedAt: freezed == ekycVerifiedAt
          ? _value.ekycVerifiedAt
          : ekycVerifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as dynamic,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      tosAcceptedAt: freezed == tosAcceptedAt
          ? _value.tosAcceptedAt
          : tosAcceptedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pspId: freezed == pspId
          ? _value.pspId
          : pspId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "user_id") int? userId,
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
      @JsonKey(name: "psp_id") int? pspId});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? clientId = freezed,
    Object? email = freezed,
    Object? username = freezed,
    Object? userStatus = freezed,
    Object? created = freezed,
    Object? updated = freezed,
    Object? publicKey = freezed,
    Object? eKycStatus = freezed,
    Object? eKycVerifiedAt = freezed,
    Object? phone = freezed,
    Object? role = freezed,
    Object? ekycVerifiedAt = freezed,
    Object? profilePicture = freezed,
    Object? countryCode = freezed,
    Object? tosAcceptedAt = freezed,
    Object? pspId = freezed,
  }) {
    return _then(_$UserModelImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      clientId: freezed == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as int?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      userStatus: freezed == userStatus
          ? _value.userStatus
          : userStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      publicKey: freezed == publicKey
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as dynamic,
      eKycStatus: freezed == eKycStatus
          ? _value.eKycStatus
          : eKycStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      eKycVerifiedAt: freezed == eKycVerifiedAt
          ? _value.eKycVerifiedAt
          : eKycVerifiedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      ekycVerifiedAt: freezed == ekycVerifiedAt
          ? _value.ekycVerifiedAt
          : ekycVerifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as dynamic,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      tosAcceptedAt: freezed == tosAcceptedAt
          ? _value.tosAcceptedAt
          : tosAcceptedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pspId: freezed == pspId
          ? _value.pspId
          : pspId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {@JsonKey(name: "user_id") this.userId,
      @JsonKey(name: "client_id") this.clientId,
      @JsonKey(name: "email") this.email,
      @JsonKey(name: "username") this.username,
      @JsonKey(name: "user_status") this.userStatus,
      @JsonKey(name: "created") this.created,
      @JsonKey(name: "updated") this.updated,
      @JsonKey(name: "public_key") this.publicKey,
      @JsonKey(name: "e_kyc_status") this.eKycStatus,
      @JsonKey(name: "e_kyc_verified_at") this.eKycVerifiedAt,
      @JsonKey(name: "phone") this.phone,
      @JsonKey(name: "role") this.role,
      @JsonKey(name: "ekyc_verified_at") this.ekycVerifiedAt,
      @JsonKey(name: "profile_picture") this.profilePicture,
      @JsonKey(name: "country_code") this.countryCode,
      @JsonKey(name: "tos_accepted_at") this.tosAcceptedAt,
      @JsonKey(name: "psp_id") this.pspId});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  @JsonKey(name: "user_id")
  final int? userId;
  @override
  @JsonKey(name: "client_id")
  final int? clientId;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "username")
  final String? username;
  @override
  @JsonKey(name: "user_status")
  final String? userStatus;
  @override
  @JsonKey(name: "created")
  final DateTime? created;
  @override
  @JsonKey(name: "updated")
  final DateTime? updated;
  @override
  @JsonKey(name: "public_key")
  final dynamic publicKey;
  @override
  @JsonKey(name: "e_kyc_status")
  final String? eKycStatus;
  @override
  @JsonKey(name: "e_kyc_verified_at")
  final dynamic eKycVerifiedAt;
  @override
  @JsonKey(name: "phone")
  final String? phone;
  @override
  @JsonKey(name: "role")
  final String? role;
  @override
  @JsonKey(name: "ekyc_verified_at")
  final DateTime? ekycVerifiedAt;
  @override
  @JsonKey(name: "profile_picture")
  final dynamic profilePicture;
  @override
  @JsonKey(name: "country_code")
  final String? countryCode;
  @override
  @JsonKey(name: "tos_accepted_at")
  final dynamic tosAcceptedAt;
  @override
  @JsonKey(name: "psp_id")
  final int? pspId;

  @override
  String toString() {
    return 'UserModel(userId: $userId, clientId: $clientId, email: $email, username: $username, userStatus: $userStatus, created: $created, updated: $updated, publicKey: $publicKey, eKycStatus: $eKycStatus, eKycVerifiedAt: $eKycVerifiedAt, phone: $phone, role: $role, ekycVerifiedAt: $ekycVerifiedAt, profilePicture: $profilePicture, countryCode: $countryCode, tosAcceptedAt: $tosAcceptedAt, pspId: $pspId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.userStatus, userStatus) ||
                other.userStatus == userStatus) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            const DeepCollectionEquality().equals(other.publicKey, publicKey) &&
            (identical(other.eKycStatus, eKycStatus) ||
                other.eKycStatus == eKycStatus) &&
            const DeepCollectionEquality()
                .equals(other.eKycVerifiedAt, eKycVerifiedAt) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.ekycVerifiedAt, ekycVerifiedAt) ||
                other.ekycVerifiedAt == ekycVerifiedAt) &&
            const DeepCollectionEquality()
                .equals(other.profilePicture, profilePicture) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            const DeepCollectionEquality()
                .equals(other.tosAcceptedAt, tosAcceptedAt) &&
            (identical(other.pspId, pspId) || other.pspId == pspId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      clientId,
      email,
      username,
      userStatus,
      created,
      updated,
      const DeepCollectionEquality().hash(publicKey),
      eKycStatus,
      const DeepCollectionEquality().hash(eKycVerifiedAt),
      phone,
      role,
      ekycVerifiedAt,
      const DeepCollectionEquality().hash(profilePicture),
      countryCode,
      const DeepCollectionEquality().hash(tosAcceptedAt),
      pspId);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {@JsonKey(name: "user_id") final int? userId,
      @JsonKey(name: "client_id") final int? clientId,
      @JsonKey(name: "email") final String? email,
      @JsonKey(name: "username") final String? username,
      @JsonKey(name: "user_status") final String? userStatus,
      @JsonKey(name: "created") final DateTime? created,
      @JsonKey(name: "updated") final DateTime? updated,
      @JsonKey(name: "public_key") final dynamic publicKey,
      @JsonKey(name: "e_kyc_status") final String? eKycStatus,
      @JsonKey(name: "e_kyc_verified_at") final dynamic eKycVerifiedAt,
      @JsonKey(name: "phone") final String? phone,
      @JsonKey(name: "role") final String? role,
      @JsonKey(name: "ekyc_verified_at") final DateTime? ekycVerifiedAt,
      @JsonKey(name: "profile_picture") final dynamic profilePicture,
      @JsonKey(name: "country_code") final String? countryCode,
      @JsonKey(name: "tos_accepted_at") final dynamic tosAcceptedAt,
      @JsonKey(name: "psp_id") final int? pspId}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  @JsonKey(name: "user_id")
  int? get userId;
  @override
  @JsonKey(name: "client_id")
  int? get clientId;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "username")
  String? get username;
  @override
  @JsonKey(name: "user_status")
  String? get userStatus;
  @override
  @JsonKey(name: "created")
  DateTime? get created;
  @override
  @JsonKey(name: "updated")
  DateTime? get updated;
  @override
  @JsonKey(name: "public_key")
  dynamic get publicKey;
  @override
  @JsonKey(name: "e_kyc_status")
  String? get eKycStatus;
  @override
  @JsonKey(name: "e_kyc_verified_at")
  dynamic get eKycVerifiedAt;
  @override
  @JsonKey(name: "phone")
  String? get phone;
  @override
  @JsonKey(name: "role")
  String? get role;
  @override
  @JsonKey(name: "ekyc_verified_at")
  DateTime? get ekycVerifiedAt;
  @override
  @JsonKey(name: "profile_picture")
  dynamic get profilePicture;
  @override
  @JsonKey(name: "country_code")
  String? get countryCode;
  @override
  @JsonKey(name: "tos_accepted_at")
  dynamic get tosAcceptedAt;
  @override
  @JsonKey(name: "psp_id")
  int? get pspId;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
