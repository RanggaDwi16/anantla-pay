// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'virtual_account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VirtualAccountModel _$VirtualAccountModelFromJson(Map<String, dynamic> json) {
  return _VirtualAccountModel.fromJson(json);
}

/// @nodoc
mixin _$VirtualAccountModel {
  @JsonKey(name: "access_token")
  String? get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: "expires_in")
  int? get expiresIn => throw _privateConstructorUsedError;

  /// Serializes this VirtualAccountModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VirtualAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VirtualAccountModelCopyWith<VirtualAccountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VirtualAccountModelCopyWith<$Res> {
  factory $VirtualAccountModelCopyWith(
          VirtualAccountModel value, $Res Function(VirtualAccountModel) then) =
      _$VirtualAccountModelCopyWithImpl<$Res, VirtualAccountModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "access_token") String? accessToken,
      @JsonKey(name: "expires_in") int? expiresIn});
}

/// @nodoc
class _$VirtualAccountModelCopyWithImpl<$Res, $Val extends VirtualAccountModel>
    implements $VirtualAccountModelCopyWith<$Res> {
  _$VirtualAccountModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VirtualAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? expiresIn = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresIn: freezed == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VirtualAccountModelImplCopyWith<$Res>
    implements $VirtualAccountModelCopyWith<$Res> {
  factory _$$VirtualAccountModelImplCopyWith(_$VirtualAccountModelImpl value,
          $Res Function(_$VirtualAccountModelImpl) then) =
      __$$VirtualAccountModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "access_token") String? accessToken,
      @JsonKey(name: "expires_in") int? expiresIn});
}

/// @nodoc
class __$$VirtualAccountModelImplCopyWithImpl<$Res>
    extends _$VirtualAccountModelCopyWithImpl<$Res, _$VirtualAccountModelImpl>
    implements _$$VirtualAccountModelImplCopyWith<$Res> {
  __$$VirtualAccountModelImplCopyWithImpl(_$VirtualAccountModelImpl _value,
      $Res Function(_$VirtualAccountModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of VirtualAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? expiresIn = freezed,
  }) {
    return _then(_$VirtualAccountModelImpl(
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresIn: freezed == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VirtualAccountModelImpl implements _VirtualAccountModel {
  const _$VirtualAccountModelImpl(
      {@JsonKey(name: "access_token") this.accessToken,
      @JsonKey(name: "expires_in") this.expiresIn});

  factory _$VirtualAccountModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VirtualAccountModelImplFromJson(json);

  @override
  @JsonKey(name: "access_token")
  final String? accessToken;
  @override
  @JsonKey(name: "expires_in")
  final int? expiresIn;

  @override
  String toString() {
    return 'VirtualAccountModel(accessToken: $accessToken, expiresIn: $expiresIn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VirtualAccountModelImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, expiresIn);

  /// Create a copy of VirtualAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VirtualAccountModelImplCopyWith<_$VirtualAccountModelImpl> get copyWith =>
      __$$VirtualAccountModelImplCopyWithImpl<_$VirtualAccountModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VirtualAccountModelImplToJson(
      this,
    );
  }
}

abstract class _VirtualAccountModel implements VirtualAccountModel {
  const factory _VirtualAccountModel(
          {@JsonKey(name: "access_token") final String? accessToken,
          @JsonKey(name: "expires_in") final int? expiresIn}) =
      _$VirtualAccountModelImpl;

  factory _VirtualAccountModel.fromJson(Map<String, dynamic> json) =
      _$VirtualAccountModelImpl.fromJson;

  @override
  @JsonKey(name: "access_token")
  String? get accessToken;
  @override
  @JsonKey(name: "expires_in")
  int? get expiresIn;

  /// Create a copy of VirtualAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VirtualAccountModelImplCopyWith<_$VirtualAccountModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
