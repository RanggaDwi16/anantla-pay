// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) {
  return _TransactionModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionModel {
  @JsonKey(name: "transaction_id")
  String? get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: "transaction_type")
  String? get transactionType => throw _privateConstructorUsedError;
  @JsonKey(name: "transaction_date")
  DateTime? get transactionDate => throw _privateConstructorUsedError;
  @JsonKey(name: "wallet_id")
  int? get walletId => throw _privateConstructorUsedError;
  @JsonKey(name: "wallet_from_id")
  dynamic get walletFromId => throw _privateConstructorUsedError;
  @JsonKey(name: "wallet_to_id")
  int? get walletToId => throw _privateConstructorUsedError;
  @JsonKey(name: "currency_from")
  String? get currencyFrom => throw _privateConstructorUsedError;
  @JsonKey(name: "currency_to")
  String? get currencyTo => throw _privateConstructorUsedError;
  @JsonKey(name: "amount")
  String? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "trans_wallet_type")
  String? get transWalletType => throw _privateConstructorUsedError;
  @JsonKey(name: "trans_wallet_flow")
  String? get transWalletFlow => throw _privateConstructorUsedError;
  @JsonKey(name: "settlement_status")
  String? get settlementStatus => throw _privateConstructorUsedError;
  @JsonKey(name: "settled_date")
  DateTime? get settledDate => throw _privateConstructorUsedError;
  @JsonKey(name: "settlement_approver")
  String? get settlementApprover => throw _privateConstructorUsedError;

  /// Serializes this TransactionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionModelCopyWith<TransactionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionModelCopyWith<$Res> {
  factory $TransactionModelCopyWith(
          TransactionModel value, $Res Function(TransactionModel) then) =
      _$TransactionModelCopyWithImpl<$Res, TransactionModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "transaction_id") String? transactionId,
      @JsonKey(name: "transaction_type") String? transactionType,
      @JsonKey(name: "transaction_date") DateTime? transactionDate,
      @JsonKey(name: "wallet_id") int? walletId,
      @JsonKey(name: "wallet_from_id") dynamic walletFromId,
      @JsonKey(name: "wallet_to_id") int? walletToId,
      @JsonKey(name: "currency_from") String? currencyFrom,
      @JsonKey(name: "currency_to") String? currencyTo,
      @JsonKey(name: "amount") String? amount,
      @JsonKey(name: "trans_wallet_type") String? transWalletType,
      @JsonKey(name: "trans_wallet_flow") String? transWalletFlow,
      @JsonKey(name: "settlement_status") String? settlementStatus,
      @JsonKey(name: "settled_date") DateTime? settledDate,
      @JsonKey(name: "settlement_approver") String? settlementApprover});
}

/// @nodoc
class _$TransactionModelCopyWithImpl<$Res, $Val extends TransactionModel>
    implements $TransactionModelCopyWith<$Res> {
  _$TransactionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = freezed,
    Object? transactionType = freezed,
    Object? transactionDate = freezed,
    Object? walletId = freezed,
    Object? walletFromId = freezed,
    Object? walletToId = freezed,
    Object? currencyFrom = freezed,
    Object? currencyTo = freezed,
    Object? amount = freezed,
    Object? transWalletType = freezed,
    Object? transWalletFlow = freezed,
    Object? settlementStatus = freezed,
    Object? settledDate = freezed,
    Object? settlementApprover = freezed,
  }) {
    return _then(_value.copyWith(
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionDate: freezed == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as int?,
      walletFromId: freezed == walletFromId
          ? _value.walletFromId
          : walletFromId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      walletToId: freezed == walletToId
          ? _value.walletToId
          : walletToId // ignore: cast_nullable_to_non_nullable
              as int?,
      currencyFrom: freezed == currencyFrom
          ? _value.currencyFrom
          : currencyFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyTo: freezed == currencyTo
          ? _value.currencyTo
          : currencyTo // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      transWalletType: freezed == transWalletType
          ? _value.transWalletType
          : transWalletType // ignore: cast_nullable_to_non_nullable
              as String?,
      transWalletFlow: freezed == transWalletFlow
          ? _value.transWalletFlow
          : transWalletFlow // ignore: cast_nullable_to_non_nullable
              as String?,
      settlementStatus: freezed == settlementStatus
          ? _value.settlementStatus
          : settlementStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      settledDate: freezed == settledDate
          ? _value.settledDate
          : settledDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      settlementApprover: freezed == settlementApprover
          ? _value.settlementApprover
          : settlementApprover // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionModelImplCopyWith<$Res>
    implements $TransactionModelCopyWith<$Res> {
  factory _$$TransactionModelImplCopyWith(_$TransactionModelImpl value,
          $Res Function(_$TransactionModelImpl) then) =
      __$$TransactionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "transaction_id") String? transactionId,
      @JsonKey(name: "transaction_type") String? transactionType,
      @JsonKey(name: "transaction_date") DateTime? transactionDate,
      @JsonKey(name: "wallet_id") int? walletId,
      @JsonKey(name: "wallet_from_id") dynamic walletFromId,
      @JsonKey(name: "wallet_to_id") int? walletToId,
      @JsonKey(name: "currency_from") String? currencyFrom,
      @JsonKey(name: "currency_to") String? currencyTo,
      @JsonKey(name: "amount") String? amount,
      @JsonKey(name: "trans_wallet_type") String? transWalletType,
      @JsonKey(name: "trans_wallet_flow") String? transWalletFlow,
      @JsonKey(name: "settlement_status") String? settlementStatus,
      @JsonKey(name: "settled_date") DateTime? settledDate,
      @JsonKey(name: "settlement_approver") String? settlementApprover});
}

/// @nodoc
class __$$TransactionModelImplCopyWithImpl<$Res>
    extends _$TransactionModelCopyWithImpl<$Res, _$TransactionModelImpl>
    implements _$$TransactionModelImplCopyWith<$Res> {
  __$$TransactionModelImplCopyWithImpl(_$TransactionModelImpl _value,
      $Res Function(_$TransactionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = freezed,
    Object? transactionType = freezed,
    Object? transactionDate = freezed,
    Object? walletId = freezed,
    Object? walletFromId = freezed,
    Object? walletToId = freezed,
    Object? currencyFrom = freezed,
    Object? currencyTo = freezed,
    Object? amount = freezed,
    Object? transWalletType = freezed,
    Object? transWalletFlow = freezed,
    Object? settlementStatus = freezed,
    Object? settledDate = freezed,
    Object? settlementApprover = freezed,
  }) {
    return _then(_$TransactionModelImpl(
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionDate: freezed == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as int?,
      walletFromId: freezed == walletFromId
          ? _value.walletFromId
          : walletFromId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      walletToId: freezed == walletToId
          ? _value.walletToId
          : walletToId // ignore: cast_nullable_to_non_nullable
              as int?,
      currencyFrom: freezed == currencyFrom
          ? _value.currencyFrom
          : currencyFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyTo: freezed == currencyTo
          ? _value.currencyTo
          : currencyTo // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      transWalletType: freezed == transWalletType
          ? _value.transWalletType
          : transWalletType // ignore: cast_nullable_to_non_nullable
              as String?,
      transWalletFlow: freezed == transWalletFlow
          ? _value.transWalletFlow
          : transWalletFlow // ignore: cast_nullable_to_non_nullable
              as String?,
      settlementStatus: freezed == settlementStatus
          ? _value.settlementStatus
          : settlementStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      settledDate: freezed == settledDate
          ? _value.settledDate
          : settledDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      settlementApprover: freezed == settlementApprover
          ? _value.settlementApprover
          : settlementApprover // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionModelImpl implements _TransactionModel {
  const _$TransactionModelImpl(
      {@JsonKey(name: "transaction_id") this.transactionId,
      @JsonKey(name: "transaction_type") this.transactionType,
      @JsonKey(name: "transaction_date") this.transactionDate,
      @JsonKey(name: "wallet_id") this.walletId,
      @JsonKey(name: "wallet_from_id") this.walletFromId,
      @JsonKey(name: "wallet_to_id") this.walletToId,
      @JsonKey(name: "currency_from") this.currencyFrom,
      @JsonKey(name: "currency_to") this.currencyTo,
      @JsonKey(name: "amount") this.amount,
      @JsonKey(name: "trans_wallet_type") this.transWalletType,
      @JsonKey(name: "trans_wallet_flow") this.transWalletFlow,
      @JsonKey(name: "settlement_status") this.settlementStatus,
      @JsonKey(name: "settled_date") this.settledDate,
      @JsonKey(name: "settlement_approver") this.settlementApprover});

  factory _$TransactionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionModelImplFromJson(json);

  @override
  @JsonKey(name: "transaction_id")
  final String? transactionId;
  @override
  @JsonKey(name: "transaction_type")
  final String? transactionType;
  @override
  @JsonKey(name: "transaction_date")
  final DateTime? transactionDate;
  @override
  @JsonKey(name: "wallet_id")
  final int? walletId;
  @override
  @JsonKey(name: "wallet_from_id")
  final dynamic walletFromId;
  @override
  @JsonKey(name: "wallet_to_id")
  final int? walletToId;
  @override
  @JsonKey(name: "currency_from")
  final String? currencyFrom;
  @override
  @JsonKey(name: "currency_to")
  final String? currencyTo;
  @override
  @JsonKey(name: "amount")
  final String? amount;
  @override
  @JsonKey(name: "trans_wallet_type")
  final String? transWalletType;
  @override
  @JsonKey(name: "trans_wallet_flow")
  final String? transWalletFlow;
  @override
  @JsonKey(name: "settlement_status")
  final String? settlementStatus;
  @override
  @JsonKey(name: "settled_date")
  final DateTime? settledDate;
  @override
  @JsonKey(name: "settlement_approver")
  final String? settlementApprover;

  @override
  String toString() {
    return 'TransactionModel(transactionId: $transactionId, transactionType: $transactionType, transactionDate: $transactionDate, walletId: $walletId, walletFromId: $walletFromId, walletToId: $walletToId, currencyFrom: $currencyFrom, currencyTo: $currencyTo, amount: $amount, transWalletType: $transWalletType, transWalletFlow: $transWalletFlow, settlementStatus: $settlementStatus, settledDate: $settledDate, settlementApprover: $settlementApprover)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionModelImpl &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.walletId, walletId) ||
                other.walletId == walletId) &&
            const DeepCollectionEquality()
                .equals(other.walletFromId, walletFromId) &&
            (identical(other.walletToId, walletToId) ||
                other.walletToId == walletToId) &&
            (identical(other.currencyFrom, currencyFrom) ||
                other.currencyFrom == currencyFrom) &&
            (identical(other.currencyTo, currencyTo) ||
                other.currencyTo == currencyTo) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.transWalletType, transWalletType) ||
                other.transWalletType == transWalletType) &&
            (identical(other.transWalletFlow, transWalletFlow) ||
                other.transWalletFlow == transWalletFlow) &&
            (identical(other.settlementStatus, settlementStatus) ||
                other.settlementStatus == settlementStatus) &&
            (identical(other.settledDate, settledDate) ||
                other.settledDate == settledDate) &&
            (identical(other.settlementApprover, settlementApprover) ||
                other.settlementApprover == settlementApprover));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      transactionId,
      transactionType,
      transactionDate,
      walletId,
      const DeepCollectionEquality().hash(walletFromId),
      walletToId,
      currencyFrom,
      currencyTo,
      amount,
      transWalletType,
      transWalletFlow,
      settlementStatus,
      settledDate,
      settlementApprover);

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionModelImplCopyWith<_$TransactionModelImpl> get copyWith =>
      __$$TransactionModelImplCopyWithImpl<_$TransactionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionModelImplToJson(
      this,
    );
  }
}

abstract class _TransactionModel implements TransactionModel {
  const factory _TransactionModel(
      {@JsonKey(name: "transaction_id") final String? transactionId,
      @JsonKey(name: "transaction_type") final String? transactionType,
      @JsonKey(name: "transaction_date") final DateTime? transactionDate,
      @JsonKey(name: "wallet_id") final int? walletId,
      @JsonKey(name: "wallet_from_id") final dynamic walletFromId,
      @JsonKey(name: "wallet_to_id") final int? walletToId,
      @JsonKey(name: "currency_from") final String? currencyFrom,
      @JsonKey(name: "currency_to") final String? currencyTo,
      @JsonKey(name: "amount") final String? amount,
      @JsonKey(name: "trans_wallet_type") final String? transWalletType,
      @JsonKey(name: "trans_wallet_flow") final String? transWalletFlow,
      @JsonKey(name: "settlement_status") final String? settlementStatus,
      @JsonKey(name: "settled_date") final DateTime? settledDate,
      @JsonKey(name: "settlement_approver")
      final String? settlementApprover}) = _$TransactionModelImpl;

  factory _TransactionModel.fromJson(Map<String, dynamic> json) =
      _$TransactionModelImpl.fromJson;

  @override
  @JsonKey(name: "transaction_id")
  String? get transactionId;
  @override
  @JsonKey(name: "transaction_type")
  String? get transactionType;
  @override
  @JsonKey(name: "transaction_date")
  DateTime? get transactionDate;
  @override
  @JsonKey(name: "wallet_id")
  int? get walletId;
  @override
  @JsonKey(name: "wallet_from_id")
  dynamic get walletFromId;
  @override
  @JsonKey(name: "wallet_to_id")
  int? get walletToId;
  @override
  @JsonKey(name: "currency_from")
  String? get currencyFrom;
  @override
  @JsonKey(name: "currency_to")
  String? get currencyTo;
  @override
  @JsonKey(name: "amount")
  String? get amount;
  @override
  @JsonKey(name: "trans_wallet_type")
  String? get transWalletType;
  @override
  @JsonKey(name: "trans_wallet_flow")
  String? get transWalletFlow;
  @override
  @JsonKey(name: "settlement_status")
  String? get settlementStatus;
  @override
  @JsonKey(name: "settled_date")
  DateTime? get settledDate;
  @override
  @JsonKey(name: "settlement_approver")
  String? get settlementApprover;

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionModelImplCopyWith<_$TransactionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
