import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_choice/quiz_choice_screen_controller.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/model/quiz/quiz_model.dart';
import 'package:kentei_quiz/model/quiz/quizzes.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../model/quiz/quiz.dart';
import '../../view/button.dart';
import '../../view/icon_button.dart';
import '../../view/quiz_widget.dart';

part 'quiz_choice_result_view.dart';

class QuizChoiceResultScreen extends StatelessWidget {
  const QuizChoiceResultScreen(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(quiz),
      body: _Body(quiz),
    );
  }
}

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _AppBar(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      titleSpacing: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: const Text("クイズ結果"),
      actions: [
        ClearButton(
          iconSize: context.width * 0.1,
          onPressed: () {
            //問題リセット
            ref.read(quizChoiceScreenProvider.notifier).resetScreen();
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _Body extends ConsumerWidget {
  const _Body(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  QuizStyleTitle(quiz),
                  const Gap(5),

                  ///正解した問題リスト
                  _QuizResultView(quiz),
                ],
              ),
            ),
          ],
        ),
        _NextActionCard(quiz),
      ],
    );
  }
}
