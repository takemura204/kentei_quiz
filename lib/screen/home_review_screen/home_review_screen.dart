import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

import '../../controller/home_review/home_review_screen_controller.dart';
import '../../model/lang/initial_resource.dart';
import '../../model/quiz/quiz.dart';
import '../../model/quiz/quiz_model.dart';
import '../../model/quiz/quizzes.dart';
import '../../view/bar.dart';
import '../../view/icon_button.dart';
import '../screen_argument.dart';

part 'home_review_view.dart';

class HomeReviewScreen extends ConsumerWidget {
  const HomeReviewScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ProviderScope(
      child: _Scaffold(),
    );
  }
}

class _Scaffold extends ConsumerWidget {
  const _Scaffold();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(I18n().titleReview),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            ///今日のクイズ
            _DailyQuiz(),

            ///苦手学習
            _WeakQuiz(),

            ///力試し
            _TestQuiz(),
          ],
        ),
      ),
    );
  }
}

///毎日学習するためのボタン
class _DailyQuiz extends ConsumerWidget {
  const _DailyQuiz();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeReviewScreenProvider);
    final dailyQuiz = state.dailyQuiz!;
    final dailyScore = 0;
    final score = dailyQuiz.correctNum;
    final quizLength = dailyQuiz.quizItemList.length;

    return Column(
      children: [
        _QuizButton(
          title: "今日のクイズ",
          subWidget: ProgressLineBar(
            height: context.height * 0.02,
            width: context.width * 0.4,
            currentScore: score,
            goalScore: quizLength,
            isUnit: true,
          ),
          icon: Icons.help_center_outlined,
          score: dailyScore,
          unit: "日目",
          onTap: () {
            ref.read(quizModelProvider.notifier).setQuizType(QuizType.daily);
            context.showScreen(
              QuizChoiceScreenArguments(
                item: dailyQuiz,
              ).generateRoute(),
            );
          },
        ),
      ],
    );
  }
}

///苦手克服クイズ
class _WeakQuiz extends ConsumerWidget {
  const _WeakQuiz();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weakQuiz = ref.watch(homeReviewScreenProvider).weakQuiz!;
    final weakList = weakQuiz.quizItemList;
    return Column(
      children: [
        if (weakList.isEmpty)
          const _NullQuizButton(
            title: "苦手なクイズはありません!",
          )
        else
          _QuizButton(
              title: "苦手克服",
              subWidget: Text("あなたの苦手問題数:${weakList.length}問"),
              icon: Icons.checklist_rtl_outlined,
              score: weakList.length,
              unit: "問　",
              onTap: () {
                ref.read(quizModelProvider.notifier).setQuizType(QuizType.weak);
                context.showScreen(QuizChoiceScreenArguments(
                  item: weakQuiz,
                ).generateRoute());
              }),
      ],
    );
  }
}

///総合テストクイズ
class _TestQuiz extends ConsumerWidget {
  const _TestQuiz();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizList = ref.watch(quizModelProvider).quizList;
    final testQuiz = ref.watch(homeReviewScreenProvider).testQuiz;
    return Column(
      children: [
        if (quizList.isEmpty)
          const _NullQuizButton(
            title: 'まだテストできません',
          )
        else
          _QuizButton(
            title: "力だめし",
            subWidget: Text((testQuiz!.timeStamp != null)
                ? '挑戦日:${DateFormat('yyyy-MM-dd').format(testQuiz.timeStamp!)}'
                : "未挑戦"),
            icon: Icons.edit_note_outlined,
            score: testQuiz.correctNum,
            unit: "点　",
            onTap: () {
              showDialog(
                  context: context, builder: (_) => const _TestQuizDialog());
            },
          ),
      ],
    );
  }
}

class _TestQuizDialog extends ConsumerWidget {
  const _TestQuizDialog();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final testQuiz = ref.watch(homeReviewScreenProvider).testQuiz;
    return SimpleDialog(
      insetPadding: EdgeInsets.all(context.width * 0.01),
      contentPadding: EdgeInsets.all(context.width * 0.01),
      children: [
        Container(
          height: context.height * 0.5,
          width: context.width * 0.8,
          child: Column(
            children: [
              ///タイトル
              Row(
                children: [
                  _DialogTitle(testQuiz!),
                  const Spacer(),
                  ClearButton(
                    iconSize: context.height * 0.04,
                    onPressed: () {},
                  ),
                ],
              ),

              const Divider(height: 1),
              const Spacer(),

              ///選択範囲
              const _QuizRange(),

              const Gap(5),

              ///問題数
              const _SelectLength(),
              const Spacer(),
              const Divider(height: 1),
              const Spacer(),

              ///クイズに挑戦する
              _SimpleDialogOption(text: I18n().styleTestQuiz),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
