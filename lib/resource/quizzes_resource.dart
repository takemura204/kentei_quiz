import 'package:kentei_quiz/resource/quiz_resource.dart';

import '../model/lang/initial_resource.dart';
import '../model/quiz/quiz.dart';
import '../model/quiz/quiz_model.dart';
import '../model/quiz_item/quiz_item.dart';

part 'category1/category1_1.dart';
part 'category1/category1_2.dart';
part 'category1_resource.dart';

extension QuizModelEx on QuizModel {
  ///問題ジャンル
  List<Quiz> get initQuizList => [
        ...category1QuizList,
        Quiz(
          id: 1,
          categoryId: 1,
          category: I18n().setCategory(1),
          title: "問題A-1",
          isCompleted: false,
          quizItemList: quiz1,
          correctNum: 0,
          timeStamp: null,
          duration: Duration.zero,
          studyType: StudyType.learn,
        ),
        Quiz(
          id: 2,
          categoryId: 1,
          category: I18n().setCategory(1),
          title: "問題A-2",
          isCompleted: false,
          quizItemList: quiz2,
          correctNum: 0,
          timeStamp: null,
          duration: Duration.zero,
          studyType: StudyType.learn,
        ),
        Quiz(
          id: 3,
          categoryId: 2,
          category: I18n().setCategory(2),
          title: "問題B-1",
          isCompleted: false,
          quizItemList: quiz3,
          correctNum: 0,
          timeStamp: null,
          duration: Duration.zero,
          studyType: StudyType.learn,
        ),
        Quiz(
          id: 4,
          categoryId: 2,
          category: I18n().setCategory(2),
          title: "問題B-2",
          isCompleted: false,
          quizItemList: quiz1,
          correctNum: 0,
          timeStamp: null,
          duration: Duration.zero,
          studyType: StudyType.learn,
        ),
        Quiz(
          id: 5,
          categoryId: 3,
          category: I18n().setCategory(3),
          title: "問題C-1",
          isCompleted: false,
          quizItemList: quiz2,
          correctNum: 0,
          timeStamp: null,
          duration: Duration.zero,
          studyType: StudyType.learn,
        ),
        Quiz(
          id: 6,
          categoryId: 3,
          category: I18n().setCategory(3),
          title: "問題C-2",
          isCompleted: false,
          quizItemList: quiz3,
          correctNum: 0,
          timeStamp: null,
          duration: Duration.zero,
          studyType: StudyType.learn,
        ),
        Quiz(
          id: 7,
          categoryId: 1,
          category: I18n().setCategory(1),
          title: "問題A-3",
          isCompleted: false,
          quizItemList: quiz1,
          correctNum: 0,
          timeStamp: null,
          duration: Duration.zero,
          studyType: StudyType.learn,
        ),
        Quiz(
          id: 8,
          categoryId: 2,
          category: I18n().setCategory(2),
          title: "問題B-3",
          isCompleted: false,
          quizItemList: quiz2,
          correctNum: 0,
          timeStamp: null,
          duration: Duration.zero,
          studyType: StudyType.learn,
        ),
        Quiz(
          id: 9,
          categoryId: 3,
          category: I18n().setCategory(3),
          title: "問題C-3",
          isCompleted: false,
          quizItemList: quiz3,
          correctNum: 0,
          timeStamp: null,
          duration: Duration.zero,
          studyType: StudyType.learn,
        ),
        Quiz(
          id: 10,
          categoryId: 4,
          category: I18n().setCategory(4),
          title: "問題D-1",
          isCompleted: false,
          quizItemList: quiz1,
          correctNum: 0,
          timeStamp: null,
          duration: Duration.zero,
          studyType: StudyType.learn,
        ),
        Quiz(
          id: 11,
          categoryId: 4,
          category: I18n().setCategory(4),
          title: "問題D-2",
          isCompleted: false,
          quizItemList: quiz2,
          correctNum: 0,
          timeStamp: null,
          duration: Duration.zero,
          studyType: StudyType.learn,
        ),
      ];

  ///苦手克服
  Quiz get initWeakQuiz => Quiz(
        id: 2,
        categoryId: 5,
        category: I18n().setCategory(5),
        title: "苦手克服",
        isCompleted: false,
        quizItemList: [],
        correctNum: 0,
        timeStamp: null,
        duration: Duration.zero,
        studyType: StudyType.learn,
      );

  ///力だめし
  Quiz get initTestQuiz => Quiz(
        id: 3,
        categoryId: 4,
        category: I18n().setCategory(4),
        title: "力だめし",
        isCompleted: false,
        quizItemList: [],
        correctNum: 0,
        timeStamp: null,
        duration: Duration.zero,
        studyType: StudyType.learn,
      );
}
