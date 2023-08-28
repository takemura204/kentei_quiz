import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_item.freezed.dart';
part 'quiz_item.g.dart';

@freezed
class QuizItem with _$QuizItem {
  factory QuizItem({
    required final int quizId, //問題番号
    required final String question, //問題文
    required final String ans, //答え
    required final String comment, //解説
    required final bool isWeak, //苦手か？
    required final bool isJudge, //正解したか?
    required final bool isSaved, //保存したか?
    required final List<String> choices, //選択肢
  }) = _QuizItem;

  QuizItem._();

  factory QuizItem.fromJson(Map<String, dynamic> json) =>
      _$QuizItemFromJson(json);
}
