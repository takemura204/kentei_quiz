import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_choice/quiz_choice_screen_state.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../model/quiz/quiz.dart';
import '../../model/quiz/quiz_model.dart';
import '../../model/quiz_item/quiz_item.dart';

final quizChoiceScreenProvider =
    StateNotifierProvider<QuizChoiceScreenController, QuizChoiceScreenState>(
  (ref) => throw UnimplementedError(),
);

class QuizChoiceScreenController extends StateNotifier<QuizChoiceScreenState>
    with LocatorMixin, WidgetsBindingObserver {
  QuizChoiceScreenController({required this.ref, required this.quiz})
      : super(const QuizChoiceScreenState()) {
    initState();
  }

  final Ref ref;
  Quiz quiz;
  final Stopwatch _stopwatch = Stopwatch();

  @override
  void initState() {
    _startStopwatch(); //学習時間計測
    _loadQuizList(); //クイズ読み込み
    _shuffleChoice(); //選択肢ランダム表示
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _stopwatch.start(); // アプリが前面に戻ったときにタイマーを再開
    } else if (state == AppLifecycleState.paused) {
      _stopwatch.stop(); // アプリが背景に移動したときにタイマーを停止
    }
  }

  ///クイズ更新
  void _loadQuizList() {
    //クイズリスト更新
    final quizItemList = [...state.quizItemList];
    quizItemList.addAll(quiz.quizItemList);
    state = state.copyWith(quizItemList: quizItemList);
  }

  ///学習時間計測
  void _startStopwatch() {
    WidgetsBinding.instance.addObserver(this);
    _stopwatch.start(); //学習時間記録
  }

  ///選択肢を混ぜる
  void _shuffleChoice() {
    final choices = [...state.choices]..clear();
    final argumentsChoices = [...quiz.quizItemList[state.quizIndex].choices];
    argumentsChoices.shuffle();
    choices.addAll(argumentsChoices);
    state = state.copyWith(choices: choices);
  }

  ///選択肢を押した時
  void tapAnsButton(String ans) {
    _judgeQuiz(ans); //正誤判定,スコア判定
    _switchAnsView(); //答え表示,次の問題
  }

  ///クイズ判定
  void _judgeQuiz(String ans) {
    final quizItemList = [...state.quizItemList];
    final quizIndex = state.quizIndex;
    //正解
    if (ans == quizItemList[quizIndex].ans) {
      quizItemList[quizIndex] = QuizItem(
        quizId: quizItemList[quizIndex].quizId,
        question: quizItemList[quizIndex].question,
        ans: quizItemList[quizIndex].ans,
        choices: quizItemList[quizIndex].choices,
        comment: quizItemList[quizIndex].comment,
        isJudge: true,
        //正解
        isSaved: quizItemList[quizIndex].isSaved,
        isWeak: false, //苦手リストから除外
      );
      state = state.copyWith(isJudge: true, quizItemList: quizItemList);
    }
    //不正解
    else {
      quizItemList[quizIndex] = QuizItem(
        quizId: quizItemList[quizIndex].quizId,
        question: quizItemList[quizIndex].question,
        ans: quizItemList[quizIndex].ans,
        choices: quizItemList[quizIndex].choices,
        comment: quizItemList[quizIndex].comment,
        isJudge: false,
        //不正解
        isSaved: quizItemList[quizIndex].isSaved,
        isWeak: true, //苦手リスト追加
      );
      state = state.copyWith(isJudge: false, quizItemList: quizItemList);
    }
  }

  ///正解表示
  void _switchAnsView() {
    state = state.copyWith(isAnsView: true);
    Future.delayed(const Duration(milliseconds: 600), () {
      state = state.copyWith(isAnsView: false);
      _nextQuiz(); //次のクイズ
    });
  }

  ///次の問題
  void _nextQuiz() {
    final quizIndex = state.quizIndex;
    //問題が終わった時
    if (quizIndex == quiz.quizItemList.length - 1) {
      _stopwatch.stop();
      state = state.copyWith(
          duration: _stopwatch.elapsed, quizIndex: 0, isResultScreen: true);
      _updateQuiz();
    }
    //問題がまだある時
    else {
      state = state.copyWith(quizIndex: quizIndex + 1);
    }
    _shuffleChoice();
  }

  ///チェックボックス切り替え
  void tapCheckBox(int index) {
    final quizItemList = [...state.quizItemList];
    quizItemList[index] = QuizItem(
      quizId: quizItemList[index].quizId,
      question: quizItemList[index].question,
      ans: quizItemList[index].ans,
      comment: quizItemList[index].comment,
      isWeak: !quizItemList[index].isWeak,
      isJudge: quizItemList[index].isJudge,
      isSaved: quizItemList[index].isSaved,
      choices: quizItemList[index].choices,
    );
    state = state.copyWith(quizItemList: quizItemList);

    _updateQuiz();
  }

  ///クリアボタン
  void resetScreen() {
    _stopwatch.reset();
    state = state.copyWith(
      quizItemIndex: 0,
      quizIndex: 0,
      isAnsView: false,
      isResultScreen: false,
    );
  }

  ///クイズ結果更新(端末保存)
  void _updateQuiz() {
    final quizItemList = state.quizItemList;
    final duration = state.duration;
    final correctNum =
        quizItemList.where((x) => x.isJudge == true).toList().length;
    final isCompleted = quizItemList.length == correctNum;
    final updateQuiz = quiz.copyWith(
      duration: duration,
      quizItemList: quizItemList,
      correctNum: correctNum,
      isCompleted: isCompleted,
      timeStamp: DateTime.now(),
    );
    ref.read(quizModelProvider.notifier).updateQuiz(updateQuiz);
  }
}
