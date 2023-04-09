import 'package:kentei_quiz/resource/quiz/quiz_resource.dart';

import '../../controller/quiz_item/quiz_item_state.dart';

///問題ジャンル
List<QuizItemState> quizItems = [
  QuizItemState(
    id: 1,
    group: "TeamA",
    title: "問題A-1",
    isCompleted: false,
    quizList: quiz1,
  ),
  QuizItemState(
    id: 2,
    group: "TeamA",
    title: "問題A-2",
    isCompleted: false,
    quizList: quiz2,
  ),
  QuizItemState(
    id: 3,
    group: "TeamB",
    title: "問題B-1",
    isCompleted: false,
    quizList: quiz1,
  ),
  QuizItemState(
    id: 4,
    group: "TeamB",
    title: "問題B-2",
    isCompleted: false,
    quizList: quiz1,
  ),
  QuizItemState(
    id: 5,
    group: "TeamC",
    title: "問題C-1",
    isCompleted: false,
    quizList: quiz1,
  ),
  QuizItemState(
    id: 6,
    group: "TeamC",
    title: "問題C-2",
    isCompleted: false,
    quizList: quiz1,
  ),
  QuizItemState(
    id: 7,
    group: "TeamA",
    title: "問題A-3",
    isCompleted: false,
    quizList: quiz1,
  ),
  QuizItemState(
    id: 8,
    group: "TeamB",
    title: "問題B-3",
    isCompleted: false,
    quizList: quiz1,
  ),
  QuizItemState(
    id: 9,
    group: "TeamC",
    title: "問題C-3",
    isCompleted: false,
    quizList: quiz1,
  ),
  QuizItemState(
    id: 10,
    group: "TeamD",
    title: "問題D-1",
    isCompleted: false,
    quizList: quiz1,
  ),
];

///「復習リスト」
List<QuizItemState> reviewItem = [
  const QuizItemState(
    id: 1,
    group: "rememberQuestions",
    title: "一問一答で復習する",
    isCompleted: false,
    quizList: [],
  ),
];
