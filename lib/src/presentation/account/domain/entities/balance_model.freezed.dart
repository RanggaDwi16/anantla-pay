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
  @JsonKey(name: "wallet_id")
  int? get walletId => throw _privateConstructorUsedError;
  @JsonKey(name: "wallet_code")
  String? get walletCode => throw _privateConstructorUsedError;
  @JsonKey(name: "currency")
  String? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: "wallet_status")
  String? get walletStatus => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "balance")
  int? get balance => throw _privateConstructorUsedError;
  @JsonKey(name: "total_received")
  int? get totalReceived => throw _privateConstructorUsedError;
  @JsonKey(name: "total_spent")
  int? get totalSpent => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "wallet_id") int? walletId,
      @JsonKey(name: "wallet_code") String? walletCode,
      @JsonKey(name: "currency") String? currency,
      @JsonKey(name: "wallet_status") String? walletStatus,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "balance") int? balance,
      @JsonKey(name: "total_received") int? totalReceived,
      @JsonKey(name: "total_spent") int? totalSpent});
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
    Object? walletId = freezed,
    Object? walletCode = freezed,
    Object? currency = freezed,
    Object? walletStatus = freezed,
    Object? createdAt = freezed,
    Object? balance = freezed,
    Object? totalReceived = freezed,
    Object? totalSpent = freezed,
  }) {
    return _then(_value.copyWith(
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as int?,
      walletCode: freezed == walletCode
          ? _value.walletCode
          : walletCode // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      walletStatus: freezed == walletStatus
          ? _value.walletStatus
          : walletStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int?,
      totalReceived: freezed == totalReceived
          ? _value.totalReceived
          : totalReceived // ignore: cast_nullable_to_non_nullable
              as int?,
      totalSpent: freezed == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as int?,
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
      {@JsonKey(name: "wallet_id") int? walletId,
      @JsonKey(name: "wallet_code") String? walletCode,
      @JsonKey(name: "currency") String? currency,
      @JsonKey(name: "wallet_status") String? walletStatus,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "balance") int? balance,
      @JsonKey(name: "total_received") int? totalReceived,
      @JsonKey(name: "total_spent") int? totalSpent});
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
    Object? walletId = freezed,
    Object? walletCode = freezed,
    Object? currency = freezed,
    Object? walletStatus = freezed,
    Object? createdAt = freezed,
    Object? balance = freezed,
    Object? totalReceived = freezed,
    Object? totalSpent = freezed,
  }) {
    return _then(_$BalanceModelImpl(
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as int?,
      walletCode: freezed == walletCode
          ? _value.walletCode
          : walletCode // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      walletStatus: freezed == walletStatus
          ? _value.walletStatus
          : walletStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int?,
      totalReceived: freezed == totalReceived
          ? _value.totalReceived
          : totalReceived // ignore: cast_nullable_to_non_nullable
              as int?,
      totalSpent: freezed == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BalanceModelImpl implements _BalanceModel {
  const _$BalanceModelImpl(
      {@JsonKey(name: "wallet_id") this.walletId,
      @JsonKey(name: "wallet_code") this.walletCode,
      @JsonKey(name: "currency") this.currency,
      @JsonKey(name: "wallet_status") this.walletStatus,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "balance") this.balance,
      @JsonKey(name: "total_received") this.totalReceived,
      @JsonKey(name: "total_spent") this.totalSpent});

  factory _$BalanceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BalanceModelImplFromJson(json);

  @override
  @JsonKey(name: "wallet_id")
  final int? walletId;
  @override
  @JsonKey(name: "wallet_code")
  final String? walletCode;
  @override
  @JsonKey(name: "currency")
  final String? currency;
  @override
  @JsonKey(name: "wallet_status")
  final String? walletStatus;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "balance")
  final int? balance;
  @override
  @JsonKey(name: "total_received")
  final int? totalReceived;
  @override
  @JsonKey(name: "total_spent")
  final int? totalSpent;

  @override
  String toString() {
    return 'BalanceModel(walletId: $walletId, walletCode: $walletCode, currency: $currency, walletStatus: $walletStatus, createdAt: $createdAt, balance: $balance, totalReceived: $totalReceived, totalSpent: $totalSpent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BalanceModelImpl &&
            (identical(other.walletId, walletId) ||
                other.walletId == walletId) &&
            (identical(other.walletCode, walletCode) ||
                other.walletCode == walletCode) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.walletStatus, walletStatus) ||
                other.walletStatus == walletStatus) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.totalReceived, totalReceived) ||
                other.totalReceived == totalReceived) &&
            (identical(other.totalSpent, totalSpent) ||
                other.totalSpent == totalSpent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, walletId, walletCode, currency,
      walletStatus, createdAt, balance, totalReceived, totalSpent);

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
          {@JsonKey(name: "wallet_id") final int? walletId,
          @JsonKey(name: "wallet_code") final String? walletCode,
          @JsonKey(name: "currency") final String? currency,
          @JsonKey(name: "wallet_status") final String? walletStatus,
          @JsonKey(name: "created_at") final DateTime? createdAt,
          @JsonKey(name: "balance") final int? balance,
          @JsonKey(name: "total_received") final int? totalReceived,
          @JsonKey(name: "total_spent") final int? totalSpent}) =
      _$BalanceModelImpl;

  factory _BalanceModel.fromJson(Map<String, dynamic> json) =
      _$BalanceModelImpl.fromJson;

  @override
  @JsonKey(name: "wallet_id")
  int? get walletId;
  @override
  @JsonKey(name: "wallet_code")
  String? get walletCode;
  @override
  @JsonKey(name: "currency")
  String? get currency;
  @override
  @JsonKey(name: "wallet_status")
  String? get walletStatus;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "balance")
  int? get balance;
  @override
  @JsonKey(name: "total_received")
  int? get totalReceived;
  @override
  @JsonKey(name: "total_spent")
  int? get totalSpent;

  /// Create a copy of BalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BalanceModelImplCopyWith<_$BalanceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
