import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category3_16 {
  final quizItems = [
    QuizItem(
      question: '立体的な物体を層ごとに造形していくことで物理的なモデルを作成するプリンタは何か？',
      ans: '3Dプリンタ',
      choices: ["3Dプリンタ", "インクジェットプリンタ", "レーザプリンタ", "感熱式プリンタ"],
      comment: "3Dプリンタは、立体的な物体を層ごとに造形していくことで物理的なモデルを作成するプリンタ。",
    ),
    QuizItem(
      question: 'インクを微細な滴として紙に吹き付けることで文字や画像を印刷するプリンタは何か？',
      ans: 'インクジェットプリンタ',
      choices: ["インクジェットプリンタ", "レーザプリンタ", "インパクトプリンタ", "感熱式プリンタ"],
      comment: "インクジェットプリンタは、インクを微細な滴として紙に吹き付けることで文字や画像を印刷するプリンタ。",
    ),
    QuizItem(
      question: '紙に直接物理的な衝撃を与えることで文字を印刷する古いタイプのプリンタは何か？',
      ans: 'インパクトプリンタ',
      choices: ["インパクトプリンタ", "インクジェットプリンタ", "レーザプリンタ", "感熱式プリンタ"],
      comment: "インパクトプリンタは、紙に直接物理的な衝撃を与えることで文字を印刷する古いタイプのプリンタ。",
    ),
    QuizItem(
      question: '熱に反応する特殊な紙を使用し、熱を加えることで文字や画像を印刷するプリンタは何か？',
      ans: '感熱式プリンタ',
      choices: ["感熱式プリンタ", "インクジェットプリンタ", "レーザプリンタ", "インパクトプリンタ"],
      comment: "感熱式プリンタは、熱に反応する特殊な紙を使用し、熱を加えることで文字や画像を印刷するプリンタ。",
    ),
    QuizItem(
      question: 'トナーを用いて紙に高精度の文字や画像を印刷するプリンタは何か？',
      ans: 'レーザプリンタ',
      choices: ["レーザプリンタ", "インクジェットプリンタ", "感熱式プリンタ", "インパクトプリンタ"],
      comment: "レーザプリンタは、トナーを用いて紙に高精度の文字や画像を印刷するプリンタ。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 151 + 3000);
  });
}
