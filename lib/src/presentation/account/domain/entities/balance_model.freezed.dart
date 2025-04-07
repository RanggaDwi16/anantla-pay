// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'balance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BalanceModel _$BalanceModelFromJson(Map<String, dynamic> json) {
  return _BalanceModel.fromJson(json);
}

/// @nodoc
mixin _$BalanceModel {
  @JsonKey(name: "user_id")
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "wallet_id")
  int? get walletId => throw _privateConstructorUsedError;
  @JsonKey(name: "balance")
  String? get balance => throw _privateConstructorUsedError;
  @JsonKey(name: "currency")
  String? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: "psp_id")
  int? get pspId => throw _privateConstructorUsedError;
  @JsonKey(name: "wallet_status")
  String? get walletStatus => throw _privateConstructorUsedError;

  /// Serializes this BalanceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BalanceModelCopyWith<BalanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BalanceModelCopyWith<$Res> {
  factory $BalanceModelCopyWith(
          BalanceModel value, $Res Function(BalanceModel) then) =
      _$BalanceModelCopyWithImpl<$Res, BalanceModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "user_id") int? userId,
      @JsonKey(name: "wallet_id") int? walletId,
      @JsonKey(name: "balance") String? balance,
      @JsonKey(name: "currency") String? currency,
      @JsonKey(name: "psp_id") int? pspId,
      @JsonKey(name: "wallet_status") String? walletStatus});
}

/// @nodoc
class _$BalanceModelCopyWithImpl<$Res, $Val extends BalanceModel>
    implements $BalanceModelCopyWith<$Res> {
  _$BalanceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? walletId = freezed,
    Object? balance = freezed,
    Object? currency = freezed,
    Object? pspId = freezed,
    Object? walletStatus = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as int?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      pspId: freezed == pspId
          ? _value.pspId
          : pspId // ignore: cast_nullable_to_non_nullable
              as int?,
      walletStatus: freezed == walletStatus
          ? _value.walletStatus
          : walletStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BalanceModelImplCopyWith<$Res>
    implements $BalanceModelCopyWith<$Res> {
  factory _$$BalanceModelImplCopyWith(
          _$BalanceModelImpl value, $Res Function(_$BalanceModelImpl) then) =
      __$$BalanceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "user_id") int? userId,
      @JsonKey(name: "wallet_id") int? walletId,
      @JsonKey(name: "balance") String? balance,
      @JsonKey(name: "currency") String? currency,
      @JsonKey(name: "psp_id") int? pspId,
      @JsonKey(name: "wallet_status") String? walletStatus});
}

/// @nodoc
class __$$BalanceModelImplCopyWithImpl<$Res>
    extends _$BalanceModelCopyWithImpl<$Res, _$BalanceModelImpl>
    implements _$$BalanceModelImplCopyWith<$Res> {
  __$$BalanceModelImplCopyWithImpl(
      _$BalanceModelImpl _value, $Res Function(_$BalanceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? walletId = freezed,
    Object? balance = freezed,
    Object? currency = freezed,
    Object? pspId = freezed,
    Object? walletStatus = freezed,
  }) {
    return _then(_$BalanceModelImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as int?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      pspId: freezed == pspId
          ? _value.pspId
          : pspId // ignore: cast_nullable_to_non_nullable
              as int?,
      walletStatus: freezed == walletStatus
          ? _value.walletStatus
          : walletStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BalanceModelImpl implements _BalanceModel {
  const _$BalanceModelImpl(
      {@JsonKey(name: "user_id") this.userId,
      @JsonKey(name: "wallet_id") this.walletId,
      @JsonKey(name: "balance") this.balance,
      @JsonKey(name: "currency") this.currency,
      @JsonKey(name: "psp_id") this.pspId,
      @JsonKey(name: "wallet_status") this.walletStatus});

  factory _$BalanceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BalanceModelImplFromJson(json);

  @override
  @JsonKey(name: "user_id")
  final int? userId;
  @override
  @JsonKey(name: "wallet_id")
  final int? walletId;
  @override
  @JsonKey(name: "balance")
  final String? balance;
  @override
  @JsonKey(name: "currency")
  final String? currency;
  @override
  @JsonKey(name: "psp_id")
  final int? pspId;
  @override
  @JsonKey(name: "wallet_status")
  final String? walletStatus;

  @override
  String toString() {
    return 'BalanceModel(userId: $userId, walletId: $walletId, balance: $balance, currency: $currency, pspId: $pspId, walletStatus: $walletStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BalanceModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.walletId, walletId) ||
                other.walletId == walletId) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.pspId, pspId) || other.pspId == pspId) &&
            (identical(other.walletStatus, walletStatus) ||
                other.walletStatus == walletStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, userId, walletId, balance, currency, pspId, walletStatus);

  /// Create a copy of BalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BalanceModelImplCopyWith<_$BalanceModelImpl> get copyWith =>
      __$$BalanceModelImplCopyWithImpl<_$BalanceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BalanceModelImplToJson(
      this,
    );
  }
}

abstract class _BalanceModel implements BalanceModel {
  const factory _BalanceModel(
          {@JsonKey(name: "user_id") final int? userId,
          @JsonKey(name: "wallet_id") final int? walletId,
          @JsonKey(name: "balance") final String? balance,
          @JsonKey(name: "currency") final String? currency,
          @JsonKey(name: "psp_id") final int? pspId,
          @JsonKey(name: "wallet_status") final String? walletStatus}) =
      _$BalanceModelImpl;

  factory _BalanceModel.fromJson(Map<String, dynamic> json) =
      _$BalanceModelImpl.fromJson;

  @override
  @JsonKey(name: "user_id")
  int? get userId;
  @override
  @JsonKey(name: "wallet_id")
  int? get walletId;
  @override
  @JsonKey(name: "balance")
  String? get balance;
  @override
  @JsonKey(name: "currency")
  String? get currency;
  @override
  @JsonKey(name: "psp_id")
  int? get pspId;
  @override
  @JsonKey(name: "wallet_status")
  String? get walletStatus;

  /// Create a copy of BalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BalanceModelImplCopyWith<_$BalanceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
