import '../../../entity/quiz_item.dart';

///問題形式　<一問一答>
final List<ChoiceQuiz> choiceQuiz1 = [
  const ChoiceQuiz(
    quizId: 1,
    question: '1 + 1 = 2',
    ans: '2',
    isWeak: false,
    choices: ["1", "2", "3", "4"],
  ),
  const ChoiceQuiz(
      quizId: 2,
      question: '更新世は氷河時代とも呼ばれる',
      ans: '氷河時代',
      isWeak: false,
      choices: ["氷河時代", "地質時代", "縄文時代", "旧石器時代"]),
  const ChoiceQuiz(
    quizId: 3,
    question: '猫の目には、 タンペム という反射板が網膜の裏側にあり、光の乏しい暗闇でもしっかりとものを見ることができる.\n',
    ans: 'タンペム',
    isWeak: false,
    choices: [
      "グアニン",
      'タンペム',
      "キトゥンブルー",
      "キャッツアイ",
    ],
  ),
];

final List<ChoiceQuiz> choiceQuiz2 = [
  const ChoiceQuiz(
    quizId: 1,
    question: '1 + 2 = 3',
    ans: '3',
    isWeak: false,
    choices: ["1", "2", "3", "4"],
  ),
  const ChoiceQuiz(
    quizId: 2,
    question: '更新世は氷河時代とも呼ばれる',
    ans: '氷河時代',
    isWeak: false,
    choices: ["氷河時代", "地質時代", "縄文時代", "旧石器時代"],
  ),
  const ChoiceQuiz(
    quizId: 3,
    question: '猫の目には、 タンペム という反射板が網膜の裏側にあり、光の乏しい暗闇でもしっかりとものを見ることができる.\n',
    ans: 'タンペム',
    isWeak: false,
    choices: [
      "グアニン",
      'タンペム',
      "キトゥンブルー",
      "キャッツアイ",
    ],
  ),
];
