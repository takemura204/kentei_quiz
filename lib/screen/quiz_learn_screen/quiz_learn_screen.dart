import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_item/quiz_item_state.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';
import 'package:kentei_quiz/resource/lang/initial_resource.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../controller/quiz_learn/quiz_learn_screen_controller.dart';
import '../../view/admob.dart';
import '../../view/button.dart';
import '../../view/quiz_widget.dart';
import '../quiz_learn_result_screen/quiz_learn_result_screen.dart';

part 'quiz_learn_view.dart';

class QuizLearnScreen extends ConsumerWidget {
  const QuizLearnScreen(this.item);
  final QuizItemState item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        quizLearnScreenProvider.overrideWith(
          (ref) => QuizLearnScreenController(ref: ref, item: item),
        ),
      ],
      child: _Scaffold(item),
    );
  }
}

class _Scaffold extends ConsumerWidget {
  const _Scaffold(this.item);
  final QuizItemState item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isResultScreen = ref.watch(quizLearnScreenProvider).isResultScreen;

    return isResultScreen

        ///結果画面
        ? QuizLearnResultScreen(item)

        ///クイズ画面
        : Scaffold(
            appBar: _AppBar(item),
            body: _Body(item),
          );
  }
}

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _AppBar(this.item);

  final QuizItemState item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      titleSpacing: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(item.group),
      leading: CustomBackButton(onPressed: () {
        ref.read(quizLearnScreenProvider.notifier).tapClearButton();
        Navigator.pop(context);
      }),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _Body extends ConsumerWidget {
  const _Body(this.item);

  final QuizItemState item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ///問題形式表示
        QuizStyleTitle(item),
        const Spacer(),

        ///問題
        Card(
          elevation: 3,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: context.mainColor,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: context.width * 0.85,
            alignment: Alignment.center,
            child: Column(
              children: [
                Column(
                  children: [
                    ///問題文
                    _Question(item),

                    ///問題進捗状況
                    _QuizProgress(item),
                  ],
                ),
                Divider(thickness: 1.5, height: 1, color: context.mainColor),

                ///確認ボタン
                _ConfirmButton(item),
              ],
            ),
          ),
        ),
        const Spacer(),

        ///何周目か確認
        _LapInfoBar(item),

        ///広告
        AdBanner(),
      ],
    );
  }
}
