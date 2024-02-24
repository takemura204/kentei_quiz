import 'package:freezed_annotation/freezed_annotation.dart';

import '../quiz_item/quiz_item.dart';

part 'quiz.freezed.dart';
part 'quiz.g.dart';

///問題ジャンル
@freezed
class Quiz with _$Quiz {
  const factory Quiz({
    @Default(0) final int id, //問題ID
    @Default(0) final int categoryId, //問題ID
    @Default('') final String category, //問題のジャンル別に分ける
    required final String title, //問題タイトル
    required final List<QuizItem> quizItemList, //クイズ一覧
    @Default(null) final DateTime? timeStamp, //挑戦日
    @Default(false) final bool isCompleted, //全て問題を解いたか
    @Default(0) final int correctNum, //正解数
    @Default(Duration.zero) final Duration duration, // 所要時間
    @Default(StudyType.learn) final StudyType studyType,
    @Default(true) final bool isPremium, //プレミアム機能か
  }) = _Quiz;

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
}

enum StudyType {
  learn,
  choice,
}
