// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_color_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingColorState {
  ThemeData? get themeData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingColorStateCopyWith<SettingColorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingColorStateCopyWith<$Res> {
  factory $SettingColorStateCopyWith(
          SettingColorState value, $Res Function(SettingColorState) then) =
      _$SettingColorStateCopyWithImpl<$Res, SettingColorState>;
  @useResult
  $Res call({ThemeData? themeData});
}

/// @nodoc
class _$SettingColorStateCopyWithImpl<$Res, $Val extends SettingColorState>
    implements $SettingColorStateCopyWith<$Res> {
  _$SettingColorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeData = freezed,
  }) {
    return _then(_value.copyWith(
      themeData: freezed == themeData
          ? _value.themeData
          : themeData // ignore: cast_nullable_to_non_nullable
              as ThemeData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SettingColorStateCopyWith<$Res>
    implements $SettingColorStateCopyWith<$Res> {
  factory _$$_SettingColorStateCopyWith(_$_SettingColorState value,
          $Res Function(_$_SettingColorState) then) =
      __$$_SettingColorStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeData? themeData});
}

/// @nodoc
class __$$_SettingColorStateCopyWithImpl<$Res>
    extends _$SettingColorStateCopyWithImpl<$Res, _$_SettingColorState>
    implements _$$_SettingColorStateCopyWith<$Res> {
  __$$_SettingColorStateCopyWithImpl(
      _$_SettingColorState _value, $Res Function(_$_SettingColorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeData = freezed,
  }) {
    return _then(_$_SettingColorState(
      themeData: freezed == themeData
          ? _value.themeData
          : themeData // ignore: cast_nullable_to_non_nullable
              as ThemeData?,
    ));
  }
}

/// @nodoc

class _$_SettingColorState extends _SettingColorState {
  const _$_SettingColorState({this.themeData}) : super._();

  @override
  final ThemeData? themeData;

  @override
  String toString() {
    return 'SettingColorState(themeData: $themeData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingColorState &&
            (identical(other.themeData, themeData) ||
                other.themeData == themeData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingColorStateCopyWith<_$_SettingColorState> get copyWith =>
      __$$_SettingColorStateCopyWithImpl<_$_SettingColorState>(
          this, _$identity);
}

abstract class _SettingColorState extends SettingColorState {
  const factory _SettingColorState({final ThemeData? themeData}) =
      _$_SettingColorState;
  const _SettingColorState._() : super._();

  @override
  ThemeData? get themeData;
  @override
  @JsonKey(ignore: true)
  _$$_SettingColorStateCopyWith<_$_SettingColorState> get copyWith =>
      throw _privateConstructorUsedError;
}
