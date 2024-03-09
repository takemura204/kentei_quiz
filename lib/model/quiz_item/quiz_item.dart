import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_item.freezed.dart';
part 'quiz_item.g.dart';

@freezed
class QuizItem with _$QuizItem {
  factory QuizItem({
    @Default(0) final int quizId, //問題番号
    required final String question, //問題文
    required final String ans, //答え
    required final List<String> choices, //選択肢
    required final String comment, //解説
    @Default(false) final bool isWeak, //苦手か？
    @Default(false) final bool isJudge, //正解したか?
    @Default(false) final bool isSaved, //保存したか?
    @Default(0) final int lapIndex, //何周目か？
    @Default(true) final bool isPremium, //プレミアムか？
  }) = _QuizItem;

  QuizItem._();

  ///新しくデータを追加するとき、??で初期データを追加する。
  factory QuizItem.fromJson(Map<String, dynamic> json) => _$_QuizItem(
        quizId: json['quizId'] as int,
        question: json['question'] as String,
        ans: json['ans'] as String,
        comment: json['comment'] as String,
        isWeak: json['isWeak'] as bool,
        isJudge: json['isJudge'] as bool,
        isSaved: json['isSaved'] as bool,
        lapIndex: json['lapIndex'] as int,
        choices:
            (json['choices'] as List<dynamic>).map((e) => e as String).toList(),
      );
}
