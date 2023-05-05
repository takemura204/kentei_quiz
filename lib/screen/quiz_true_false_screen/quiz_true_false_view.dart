part of 'quiz_true_false_screen.dart';

///問題形式表示
class _QuizStyleTitle extends ConsumerWidget {
  const _QuizStyleTitle(this.arguments);

  final QuizTrueFalseScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.all(0),
      child: Container(
        height: context.height * 0.05,
        color: context.backgroundColor,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                arguments.quizStyle,
                style: context.texts.titleMedium,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

///問題文
class _Question extends ConsumerWidget {
  const _Question(this.arguments);

  final QuizTrueFalseScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAns = ref.watch(quizTureFalseScreenControllerProvider).isAnsView;

    return Container(
      height: context.height * 0.45,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const Spacer(),
          AnimatedSwitcher(
            /// アニメーションがおかしい
            duration: const Duration(milliseconds: 0),

            // reverseDuration: const Duration(milliseconds: 100),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(child: child, opacity: animation);
            },
            child: isAns ? _AnsQuestion(arguments) : _QuizQuestion(arguments),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _AnsQuestion extends ConsumerWidget {
  const _AnsQuestion(this.arguments);
  final QuizTrueFalseScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizIndex =
        ref.watch(quizTureFalseScreenControllerProvider).quizIndex;
    final isJudge = ref.watch(quizTureFalseScreenControllerProvider).isJudge;
    return SubstringHighlight(
      text: arguments.item.quizList[quizIndex].question,
      term: arguments.item.quizList[quizIndex].ans,
      textStyle: const TextStyle(
        color: Colors.black54,
        fontWeight: FontWeight.w500,
        fontSize: 21,
      ),
      textStyleHighlight: TextStyle(
        fontWeight: FontWeight.bold,
        color: isJudge ? Colors.green.withOpacity(0.7) : context.mainColor,
        decoration: TextDecoration.underline,
      ),
    );
  }
}

class _QuizQuestion extends ConsumerWidget {
  const _QuizQuestion(this.arguments);
  final QuizTrueFalseScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizIndex =
        ref.watch(quizTureFalseScreenControllerProvider).quizIndex;
    final randomAns =
        ref.watch(quizTureFalseScreenControllerProvider).randomAns;

    return SubstringHighlight(
      text: arguments.item.quizList[quizIndex].question
          .replaceAll(arguments.item.quizList[quizIndex].ans, randomAns),
      term: randomAns,
      textStyle: const TextStyle(
        color: Colors.black54,
        fontWeight: FontWeight.w500,
        fontSize: 21,
      ),
      textStyleHighlight: const TextStyle(
        color: Colors.black54,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
      ),
    );
  }
}

class _QuizProgress extends ConsumerWidget {
  const _QuizProgress(this.arguments);
  final QuizTrueFalseScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizIndex =
        ref.watch(quizTureFalseScreenControllerProvider).quizIndex + 1;

    return Container(
      height: context.height * 0.05,
      child: Row(
        children: [
          const Spacer(),
          AutoSizeText(
            quizIndex.toString(),
            style: context.texts.titleMedium,
            minFontSize: 20,
          ),
          const Text("/"),
          AutoSizeText(
            arguments.item.quizList.length.toString(),
            style: context.texts.bodyLarge,
            minFontSize: 16,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _SelectAnswer extends ConsumerWidget {
  const _SelectAnswer(this.arguments);
  final QuizTrueFalseScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAnsView =
        ref.watch(quizTureFalseScreenControllerProvider).isAnsView;

    return Container(
      width: context.width * 1.0,
      height: context.height * 0.2,
      alignment: Alignment.center,
      child: Column(children: [
        Row(
          children: [
            const Spacer(),

            ///◯ボタンを押した時
            GestureDetector(
              onTap: isAnsView
                  ? null
                  : () => ref
                      .read(quizTureFalseScreenControllerProvider.notifier)
                      .tapBoolButton(true),
              child: Card(
                elevation: 6,
                child: Container(
                  width: context.width * 0.4,
                  height: context.height * 0.15,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Colors.black45)),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.circle_outlined,
                    color: Colors.green.withOpacity(0.6),
                    size: context.height * 0.1,
                  ),
                ),
              ),
            ),
            const Spacer(),

            ///×ボタンを押した時
            GestureDetector(
              onTap: isAnsView
                  ? null
                  : () => ref
                      .read(quizTureFalseScreenControllerProvider.notifier)
                      .tapBoolButton(false),
              child: Card(
                elevation: 6,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Colors.black45)),
                  width: context.width * 0.4,
                  height: context.height * 0.15,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.clear,
                    color: context.mainColor,
                    size: context.height * 0.1,
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ]),
    );
  }
}

class _JudgeIcon extends ConsumerWidget {
  const _JudgeIcon(this.arguments);
  final QuizTrueFalseScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isJudge = ref.watch(quizTureFalseScreenControllerProvider).isJudge;
    final isAnsView =
        ref.watch(quizTureFalseScreenControllerProvider).isAnsView;

    return isAnsView
        ? Align(
            alignment: Alignment.center,
            child: Container(
              // height: context.height * 1.0,
              width: context.width * 1.0,

              child: isJudge
                  ? Icon(
                      Icons.circle_outlined,
                      color: Colors.green.withOpacity(0.6),
                      size: context.width * 1.0,
                    )
                  : Icon(Icons.clear,
                      color: context.mainColor, size: context.width * 1.0),
            ),
          )
        : const SizedBox.shrink();
  }
}
