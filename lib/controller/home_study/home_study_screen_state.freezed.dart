// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_study_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeStudyScreenState {
  int get quizIndex => throw _privateConstructorUsedError; //クイズ番号
  List<QuizItemState> get quizItemList => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError; //正解数
  bool get isCompleted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStudyScreenStateCopyWith<HomeStudyScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStudyScreenStateCopyWith<$Res> {
  factory $HomeStudyScreenStateCopyWith(HomeStudyScreenState value,
          $Res Function(HomeStudyScreenState) then) =
      _$HomeStudyScreenStateCopyWithImpl<$Res, HomeStudyScreenState>;
  @useResult
  $Res call(
      {int quizIndex,
      List<QuizItemState> quizItemList,
      int score,
      bool isCompleted});
}

/// @nodoc
class _$HomeStudyScreenStateCopyWithImpl<$Res,
        $Val extends HomeStudyScreenState>
    implements $HomeStudyScreenStateCopyWith<$Res> {
  _$HomeStudyScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizIndex = null,
    Object? quizItemList = null,
    Object? score = null,
    Object? isCompleted = null,
  }) {
    return _then(_value.copyWith(
      quizIndex: null == quizIndex
          ? _value.quizIndex
          : quizIndex // ignore: cast_nullable_to_non_nullable
              as int,
      quizItemList: null == quizItemList
          ? _value.quizItemList
          : quizItemList // ignore: cast_nullable_to_non_nullable
              as List<QuizItemState>,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateCopyWith<$Res>
    implements $HomeStudyScreenStateCopyWith<$Res> {
  factory _$$_CreateCopyWith(_$_Create value, $Res Function(_$_Create) then) =
      __$$_CreateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int quizIndex,
      List<QuizItemState> quizItemList,
      int score,
      bool isCompleted});
}

/// @nodoc
class __$$_CreateCopyWithImpl<$Res>
    extends _$HomeStudyScreenStateCopyWithImpl<$Res, _$_Create>
    implements _$$_CreateCopyWith<$Res> {
  __$$_CreateCopyWithImpl(_$_Create _value, $Res Function(_$_Create) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizIndex = null,
    Object? quizItemList = null,
    Object? score = null,
    Object? isCompleted = null,
  }) {
    return _then(_$_Create(
      quizIndex: null == quizIndex
          ? _value.quizIndex
          : quizIndex // ignore: cast_nullable_to_non_nullable
              as int,
      quizItemList: null == quizItemList
          ? _value._quizItemList
          : quizItemList // ignore: cast_nullable_to_non_nullable
              as List<QuizItemState>,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Create implements _Create {
  const _$_Create(
      {this.quizIndex = 0,
      final List<QuizItemState> quizItemList = const [],
      this.score = 0,
      this.isCompleted = false})
      : _quizItemList = quizItemList;

  @override
  @JsonKey()
  final int quizIndex;
//クイズ番号
  final List<QuizItemState> _quizItemList;
//クイズ番号
  @override
  @JsonKey()
  List<QuizItemState> get quizItemList {
    if (_quizItemList is EqualUnmodifiableListView) return _quizItemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quizItemList);
  }

  @override
  @JsonKey()
  final int score;
//正解数
  @override
  @JsonKey()
  final bool isCompleted;

  @override
  String toString() {
    return 'HomeStudyScreenState(quizIndex: $quizIndex, quizItemList: $quizItemList, score: $score, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Create &&
            (identical(other.quizIndex, quizIndex) ||
                other.quizIndex == quizIndex) &&
            const DeepCollectionEquality()
                .equals(other._quizItemList, _quizItemList) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @override
  int get hashCode => Object.hash(runtimeType, quizIndex,
      const DeepCollectionEquality().hash(_quizItemList), score, isCompleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      __$$_CreateCopyWithImpl<_$_Create>(this, _$identity);
}

abstract class _Create implements HomeStudyScreenState {
  const factory _Create(
      {final int quizIndex,
      final List<QuizItemState> quizItemList,
      final int score,
      final bool isCompleted}) = _$_Create;

  @override
  int get quizIndex;
  @override //クイズ番号
  List<QuizItemState> get quizItemList;
  @override
  int get score;
  @override //正解数
  bool get isCompleted;
  @override
  @JsonKey(ignore: true)
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      throw _privateConstructorUsedError;
}
