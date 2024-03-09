part of 'home_quiz_screen.dart';

class _QuizList extends ConsumerWidget {
  const _QuizList({required this.category});

  final String category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quizModelProvider);
    final quizList =
        state.quizList.where((x) => x.category == category).toList();
    return CustomScrollView(
      controller: ScrollController(),
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final quiz = quizList[index];
              return _QuizCard(quiz: quiz, index: index);
            },
            childCount: quizList.length,
          ),
        ),
        const SliverToBoxAdapter(
          child: Gap(80),
        ),
      ],
    );
  }
}

///問題一覧
class _QuizCard extends ConsumerWidget {
  const _QuizCard({required this.quiz, required this.index});

  final Quiz quiz;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final correctRate =
        ((quiz.correctNum / quiz.quizItemList.length) * 100).round();
    final isPremium = ref.watch(userModelProvider.select((s) => s.isPremium)) ||
        !quiz.isPremium;
    return GestureDetector(
      onTap: () {
        if (isPremium) {
          ref.read(quizModelProvider.notifier).setQuizType(QuizType.study);
          ref.read(quizModelProvider.notifier).tapQuizCard(quiz.id);
          ref.read(quizModelProvider.notifier).tapQuizIndex(index);
          showDialog(
              context: context, builder: (_) => StudyQuizModal(quiz: quiz));
        } else {
          showDialog(
              context: context,
              builder: (_) => PrimaryDialog(
                    title: '全てのクイズを解放しますか？',
                    subWidget: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            '支払いは一度きり。プレミアムに登録すると、\n全ての用語・クイズを解放できます。',
                            style: TextStyle(color: Colors.black87),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    cancelText: 'キャンセル',
                    doneText: 'プレミアム画面へ',
                    onPressed: () {
                      context.showScreen(
                          const PremiumDetailScreenArguments().generateRoute());
                    },
                  ));
        }
      },
      child: Container(
        color: isPremium ? Colors.white : Colors.grey.shade200,
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
        height: 90,
        child: Row(
          children: [
            ///進捗アイコン
            _ProgressIcon(quiz: quiz),
            const Gap(10),

            ///タイトル
            _Title(quiz: quiz, correctRate: correctRate),
            const Spacer(),
            Icon(LineIcons.angleRight,
                color: isPremium ? context.mainColor : Colors.black26),
            const Gap(5),
          ],
        ),
      ),
    );
  }
}

///進捗アイコン
class _ProgressIcon extends ConsumerWidget {
  const _ProgressIcon({required this.quiz});

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPremium = ref.watch(userModelProvider.select((s) => s.isPremium)) ||
        !quiz.isPremium;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: VerticalDivider(
            color: Colors.grey.shade300,
            thickness: 3,
          ),
        ),
        ProgressCrilcleChart(
          width: 50,
          size: 50,
          goalScore: quiz.quizItemList.length,
          currentScore: quiz.correctNum,
          thickness: 0.1,
          widget: Icon(
            isPremium ? Icons.check : LineIcons.lock,
            color: quiz.isCompleted ? context.mainColor : Colors.black26,
            size: 25,
          ),
        ),
        Expanded(
          child: VerticalDivider(
            color: Colors.grey.shade300,
            thickness: 3,
          ),
        ),
      ],
    );
  }
}

class _Title extends ConsumerWidget {
  const _Title({required this.quiz, required this.correctRate});

  final Quiz quiz;
  final int correctRate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          quiz.title,
          style: context.texts.titleMedium,
        ),
        const Gap(3),
        Text(
          I18n().quizCorrectRate(correctRate),
          style: context.texts.bodyMedium,
        ),
      ],
    );
  }
}
