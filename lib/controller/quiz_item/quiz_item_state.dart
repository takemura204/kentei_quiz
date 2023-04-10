import 'package:freezed_annotation/freezed_annotation.dart';

import '../quiz/quiz_state.dart';

part 'quiz_item_state.freezed.dart';

///問題ジャンル
@freezed
class QuizItemState with _$QuizItemState {
  const factory QuizItemState({
    required final int id, //問題ID
    required final String group, //問題のジャンル別に分ける
    required final String title, //問題タイトル
    required final bool isCompleted, //全て問題を解いたか
    required final List<QuizState> quizList, //クイズ一覧
  }) = _Create;
}