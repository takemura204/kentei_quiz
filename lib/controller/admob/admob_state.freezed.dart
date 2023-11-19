// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admob_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AdMobState {
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AdMobStateCopyWith<AdMobState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdMobStateCopyWith<$Res> {
  factory $AdMobStateCopyWith(
          AdMobState value, $Res Function(AdMobState) then) =
      _$AdMobStateCopyWithImpl<$Res, AdMobState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$AdMobStateCopyWithImpl<$Res, $Val extends AdMobState>
    implements $AdMobStateCopyWith<$Res> {
  _$AdMobStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateCopyWith<$Res> implements $AdMobStateCopyWith<$Res> {
  factory _$$_CreateCopyWith(_$_Create value, $Res Function(_$_Create) then) =
      __$$_CreateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$_CreateCopyWithImpl<$Res>
    extends _$AdMobStateCopyWithImpl<$Res, _$_Create>
    implements _$$_CreateCopyWith<$Res> {
  __$$_CreateCopyWithImpl(_$_Create _value, $Res Function(_$_Create) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$_Create(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Create implements _Create {
  const _$_Create({this.isLoading = false});

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'AdMobState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Create &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      __$$_CreateCopyWithImpl<_$_Create>(this, _$identity);
}

abstract class _Create implements AdMobState {
  const factory _Create({final bool isLoading}) = _$_Create;

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      throw _privateConstructorUsedError;
}