import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/view/button.dart';

import '../controller/home_review/home_review_screen_controller.dart';
import '../model/lang/initial_resource.dart';
import '../model/quiz/quiz.dart';
import '../model/quiz/quiz_model.dart';
import '../model/quiz/quizzes.dart';
import '../screen/screen_argument.dart';
import 'icon_button.dart';

class StudyQuizModal extends ConsumerWidget {
  const StudyQuizModal({required this.quiz});

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleDialog(
      insetPadding: EdgeInsets.all(context.width * 0.01),
      contentPadding: EdgeInsets.all(context.width * 0.01),
      children: [
        Container(
          height: context.height * 0.26,
          width: context.width * 0.8,
          child: Column(
            children: [
              ///タイトル
              Row(
                children: [
                  _Title(quiz),
                  const Spacer(),
                  ClearButton(
                    iconSize: context.height * 0.04,
                    onPressed: () {},
                  ),
                ],
              ),

              const Divider(height: 1),

              ///クイズ挑戦結果
              _QuizResult(quiz),

              const Divider(height: 1),

              ///クイズ形式選択
              Container(
                // color: Colors.redAccent,
                height: context.height * 0.15,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const Spacer(),

                    ///一問一答
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.width * 0.02,
                          vertical: context.width * 0.01),
                      child: DefaultButton(
                        width: context.width * 1,
                        height: context.height * 0.06,
                        text: I18n().styleLeanQuiz,
                        onPressed: () {
                          context.showScreen(
                            QuizLearnScreenArguments(
                              quiz: quiz,
                            ).generateRoute(),
                          );
                        },
                      ),
                    ),

                    ///4択形式クイズに挑戦する
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.width * 0.02,
                          vertical: context.width * 0.01),
                      child: PrimaryButton(
                        width: context.width * 1,
                        height: context.height * 0.06,
                        text: I18n().styleChoiceQuiz,
                        onPressed: () {
                          Navigator.of(context).pop();
                          context.showScreen(
                            QuizChoiceScreenArguments(
                              quiz: quiz,
                            ).generateRoute(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Title extends ConsumerWidget {
  const _Title(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.05,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      alignment: Alignment.centerLeft,
      child: Text(
        quiz.title,
        style: TextStyle(
            fontSize: context.width * 0.05, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _QuizResult extends ConsumerWidget {
  const _QuizResult(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.05,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text(
                "前回のクイズ挑戦結果",
                style: TextStyle(
                    fontSize: context.width * 0.04,
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              ///正解数
              Text(
                "${quiz.correctNum}",
                style: TextStyle(
                  fontSize: context.width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),

              ///問題数
              Text(
                "/" + quiz.quizItemList.length.toString(),
                style: TextStyle(
                  fontSize: context.width * 0.04,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

///クイズ選択ボタン1
class _SimpleDialogOption1 extends ConsumerWidget {
  const _SimpleDialogOption1({required this.quiz, required this.text});

  final Quiz quiz;
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleDialogOption(
        padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.02, vertical: context.width * 0.01),
        child: Card(
          elevation: 1,
          margin: const EdgeInsets.all(0),
          child: Container(
            height: context.height * 0.06,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: context.mainColor),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: context.mainColor,
                fontWeight: FontWeight.bold,
                fontSize: context.width * 0.045,
              ),
            ),
          ),
        ),
        onPressed: () {
          ref.read(quizModelProvider.notifier).setQuizType(QuizType.study);
          context.showScreen(
            QuizLearnScreenArguments(
              quiz: quiz,
            ).generateRoute(),
          );
        });
  }
}

///クイズ選択ボタン2
class _SimpleDialogOption2 extends ConsumerWidget {
  const _SimpleDialogOption2({required this.item, required this.text});

  final Quiz item;
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleDialogOption(
        padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.02, vertical: context.width * 0.01),
        child: Card(
          elevation: 1,
          margin: const EdgeInsets.all(0),
          child: Container(
            height: context.height * 0.06,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: context.mainColor,
              border: Border.all(color: context.mainColor),
              borderRadius: BorderRadius.circular(5),
            ),
            child: AutoSizeText(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: context.width * 0.045,
              ),
            ),
          ),
        ),
        onPressed: () {
          ref.read(quizModelProvider.notifier).setQuizType(QuizType.study);
          context.showScreen(
            QuizChoiceScreenArguments(
              quiz: item,
            ).generateRoute(),
          );
        });
  }
}

class TestQuizModal extends ConsumerWidget {
  const TestQuizModal();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final testQuiz = ref.watch(quizModelProvider).testQuiz;
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
                  _DialogTitle(testQuiz),
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

class _DialogTitle extends ConsumerWidget {
  const _DialogTitle(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.07,
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Text(quiz.title,
              style: TextStyle(
                fontSize: context.width * 0.05,
                fontWeight: FontWeight.bold,
              )),
          Text(
            '「${quiz.title}」では全ての問題からランダムに出題します',
            style: TextStyle(
                fontSize: context.width * 0.025, fontWeight: FontWeight.normal),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _QuizRange extends ConsumerWidget {
  const _QuizRange();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final group = ref
        .read(quizModelProvider)
        .quizList
        .map((item) => item.category)
        .toSet()
        .toList();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '問題範囲を選択してください。',
            style: TextStyle(
              fontSize: context.width * 0.03,
            ),
          ),
          const Gap(5),
          _SelectRange(group[0]),
          _SelectRange(group[1]),
          _SelectRange(group[2]),
          _SelectRange(group[3]),
        ],
      ),
    );
  }
}

///出題数
class _SelectRange extends ConsumerWidget {
  const _SelectRange(this.text);

  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected =
        ref.watch(homeReviewScreenProvider).testGroup.contains(text);
    return GestureDetector(
      onTap: () {
        ref.read(homeReviewScreenProvider.notifier).selectGroup(text);
      },
      child: Container(
        width: context.width * 0.8,
        height: context.height * 0.05,
        padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.02, vertical: context.width * 0.01),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(
            width: isSelected ? 1 : 0.5,
            color: isSelected ? context.mainColor : Colors.black45,
          ),
          color: isSelected
              ? context.backgroundColor.withOpacity(0.2)
              : Colors.grey.shade400.withOpacity(0.1),
        ),
        alignment: Alignment.center,
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.task_alt : Icons.circle_outlined,
              color: isSelected ? context.mainColor : Colors.grey,
            ),
            const Gap(5),
            Text(
              text,
              style: TextStyle(
                fontSize: context.width * 0.04,
                color: isSelected ? context.mainColor : Colors.grey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///問題数指定
class _SelectLength extends ConsumerWidget {
  const _SelectLength();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<int> testLength = [10, 20, 50];
    final selectedTestLength = ref.watch(
      homeReviewScreenProvider.select((state) => state.selectedTestLength),
    );
    final initialIndex = testLength.indexOf(selectedTestLength);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.04, vertical: context.width * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '問題数を選択してください。',
            style: TextStyle(fontSize: context.width * 0.03),
          ),
          const Gap(5),
          Container(
            height: context.height * 0.05,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: context.mainColor),
            ),
            child: DefaultTabController(
              length: 3,
              initialIndex: initialIndex,
              child: TabBar(
                  onTap: (index) {
                    ref
                        .read(homeReviewScreenProvider.notifier)
                        .selectTestLength(testLength[index]);
                  },
                  labelColor: Colors.white,
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                  unselectedLabelStyle:
                      const TextStyle(fontWeight: FontWeight.normal),
                  unselectedLabelColor: context.mainColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: context.mainColor),
                  tabs: [
                    Tab(
                      child: Text(
                        "${testLength[0]}問",
                        style: TextStyle(fontSize: context.width * 0.04),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("${testLength[1]}問",
                            style: TextStyle(fontSize: context.width * 0.04)),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("${testLength[2]}問",
                            style: TextStyle(fontSize: context.width * 0.04)),
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

///クイズ選択ボタン
class _SimpleDialogOption extends ConsumerWidget {
  const _SimpleDialogOption({required this.text});

  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isGroup = ref.watch(homeReviewScreenProvider).testGroup.isNotEmpty;
    return SimpleDialogOption(
      onPressed: isGroup
          ? () {
              ref
                  .read(homeReviewScreenProvider.notifier)
                  .tapStartTestQuizButton();
              final testQuiz = ref.read(quizModelProvider).testQuiz;
              context.showScreen(
                QuizChoiceScreenArguments(
                  quiz: testQuiz,
                ).generateRoute(),
              );
            }
          : null,
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.02, vertical: context.width * 0.01),
      child: Card(
        elevation: 1,
        margin: const EdgeInsets.all(0),
        child: Container(
          height: context.height * 0.06,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isGroup ? context.mainColor : Colors.black12,
            border: Border.all(
              color: isGroup ? context.mainColor : Colors.grey.withOpacity(0.1),
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: AutoSizeText(
            text,
            style: TextStyle(
              color: isGroup ? Colors.white : Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: context.width * 0.05,
            ),
          ),
        ),
      ),
    );
  }
}