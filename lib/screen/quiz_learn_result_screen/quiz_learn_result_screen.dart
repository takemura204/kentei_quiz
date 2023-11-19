import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/view/card/quiz_card.dart';

import '../../../controller/quiz_learn/quiz_learn_screen_controller.dart';
import '../../model/quiz/quiz.dart';
import '../../model/quiz/quiz_model.dart';
import '../../view/button/defalut_button.dart';
import '../../view/button/primary_button.dart';
import '../../view/icon_button.dart';
import '../screen_argument.dart';

part 'quiz_learn_result_view.dart';

class QuizLearnResultScreen extends StatelessWidget {
  const QuizLearnResultScreen(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppBar(),
      body: _Body(quiz),
    );
  }
}

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      titleSpacing: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: const Text("結果"),
      actions: [
        ClearButton(
            iconSize: 30,
            onPressed: () {
              ref.read(quizLearnScreenProvider.notifier).updateHistoryQuiz();
              Navigator.of(context).pop();
              ref.read(quizLearnScreenProvider.notifier).tapClearButton();
            }),
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
                  const _QuizResultView(),
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
