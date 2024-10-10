// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSymbols,
    required TResult Function(List<SymbolPriceUpdate> priceData)
        updateSymbolPrices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSymbols,
    TResult? Function(List<SymbolPriceUpdate> priceData)? updateSymbolPrices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSymbols,
    TResult Function(List<SymbolPriceUpdate> priceData)? updateSymbolPrices,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSymbolsEvent value) getSymbols,
    required TResult Function(UpdateSymbolPricesEvent value) updateSymbolPrices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSymbolsEvent value)? getSymbols,
    TResult? Function(UpdateSymbolPricesEvent value)? updateSymbolPrices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSymbolsEvent value)? getSymbols,
    TResult Function(UpdateSymbolPricesEvent value)? updateSymbolPrices,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetSymbolsEventImplCopyWith<$Res> {
  factory _$$GetSymbolsEventImplCopyWith(_$GetSymbolsEventImpl value,
          $Res Function(_$GetSymbolsEventImpl) then) =
      __$$GetSymbolsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetSymbolsEventImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$GetSymbolsEventImpl>
    implements _$$GetSymbolsEventImplCopyWith<$Res> {
  __$$GetSymbolsEventImplCopyWithImpl(
      _$GetSymbolsEventImpl _value, $Res Function(_$GetSymbolsEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetSymbolsEventImpl implements GetSymbolsEvent {
  const _$GetSymbolsEventImpl();

  @override
  String toString() {
    return 'HomeEvent.getSymbols()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetSymbolsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSymbols,
    required TResult Function(List<SymbolPriceUpdate> priceData)
        updateSymbolPrices,
  }) {
    return getSymbols();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSymbols,
    TResult? Function(List<SymbolPriceUpdate> priceData)? updateSymbolPrices,
  }) {
    return getSymbols?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSymbols,
    TResult Function(List<SymbolPriceUpdate> priceData)? updateSymbolPrices,
    required TResult orElse(),
  }) {
    if (getSymbols != null) {
      return getSymbols();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSymbolsEvent value) getSymbols,
    required TResult Function(UpdateSymbolPricesEvent value) updateSymbolPrices,
  }) {
    return getSymbols(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSymbolsEvent value)? getSymbols,
    TResult? Function(UpdateSymbolPricesEvent value)? updateSymbolPrices,
  }) {
    return getSymbols?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSymbolsEvent value)? getSymbols,
    TResult Function(UpdateSymbolPricesEvent value)? updateSymbolPrices,
    required TResult orElse(),
  }) {
    if (getSymbols != null) {
      return getSymbols(this);
    }
    return orElse();
  }
}

abstract class GetSymbolsEvent implements HomeEvent {
  const factory GetSymbolsEvent() = _$GetSymbolsEventImpl;
}

/// @nodoc
abstract class _$$UpdateSymbolPricesEventImplCopyWith<$Res> {
  factory _$$UpdateSymbolPricesEventImplCopyWith(
          _$UpdateSymbolPricesEventImpl value,
          $Res Function(_$UpdateSymbolPricesEventImpl) then) =
      __$$UpdateSymbolPricesEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SymbolPriceUpdate> priceData});
}

/// @nodoc
class __$$UpdateSymbolPricesEventImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$UpdateSymbolPricesEventImpl>
    implements _$$UpdateSymbolPricesEventImplCopyWith<$Res> {
  __$$UpdateSymbolPricesEventImplCopyWithImpl(
      _$UpdateSymbolPricesEventImpl _value,
      $Res Function(_$UpdateSymbolPricesEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priceData = null,
  }) {
    return _then(_$UpdateSymbolPricesEventImpl(
      null == priceData
          ? _value._priceData
          : priceData // ignore: cast_nullable_to_non_nullable
              as List<SymbolPriceUpdate>,
    ));
  }
}

/// @nodoc

class _$UpdateSymbolPricesEventImpl implements UpdateSymbolPricesEvent {
  const _$UpdateSymbolPricesEventImpl(final List<SymbolPriceUpdate> priceData)
      : _priceData = priceData;

  final List<SymbolPriceUpdate> _priceData;
  @override
  List<SymbolPriceUpdate> get priceData {
    if (_priceData is EqualUnmodifiableListView) return _priceData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_priceData);
  }

  @override
  String toString() {
    return 'HomeEvent.updateSymbolPrices(priceData: $priceData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSymbolPricesEventImpl &&
            const DeepCollectionEquality()
                .equals(other._priceData, _priceData));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_priceData));

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSymbolPricesEventImplCopyWith<_$UpdateSymbolPricesEventImpl>
      get copyWith => __$$UpdateSymbolPricesEventImplCopyWithImpl<
          _$UpdateSymbolPricesEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSymbols,
    required TResult Function(List<SymbolPriceUpdate> priceData)
        updateSymbolPrices,
  }) {
    return updateSymbolPrices(priceData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSymbols,
    TResult? Function(List<SymbolPriceUpdate> priceData)? updateSymbolPrices,
  }) {
    return updateSymbolPrices?.call(priceData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSymbols,
    TResult Function(List<SymbolPriceUpdate> priceData)? updateSymbolPrices,
    required TResult orElse(),
  }) {
    if (updateSymbolPrices != null) {
      return updateSymbolPrices(priceData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSymbolsEvent value) getSymbols,
    required TResult Function(UpdateSymbolPricesEvent value) updateSymbolPrices,
  }) {
    return updateSymbolPrices(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSymbolsEvent value)? getSymbols,
    TResult? Function(UpdateSymbolPricesEvent value)? updateSymbolPrices,
  }) {
    return updateSymbolPrices?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSymbolsEvent value)? getSymbols,
    TResult Function(UpdateSymbolPricesEvent value)? updateSymbolPrices,
    required TResult orElse(),
  }) {
    if (updateSymbolPrices != null) {
      return updateSymbolPrices(this);
    }
    return orElse();
  }
}

abstract class UpdateSymbolPricesEvent implements HomeEvent {
  const factory UpdateSymbolPricesEvent(
      final List<SymbolPriceUpdate> priceData) = _$UpdateSymbolPricesEventImpl;

  List<SymbolPriceUpdate> get priceData;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateSymbolPricesEventImplCopyWith<_$UpdateSymbolPricesEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}
