part of '../quiz_choice_screen.dart';

class ChoiceChallengeBody extends ConsumerWidget {
  const ChoiceChallengeBody(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPremium = ref.watch(userModelProvider.select((s) => s.isPremium));
    return Column(
      children: [
        Gap(context.height * 0.01),

        ///問題画面
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Card(
                elevation: 1,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: context.secondColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Container(
                  width: context.width * 0.9,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Spacer(),

                      ///問題文
                      _Question(quiz),

                      const Spacer(),

                      ///進捗状況
                      _QuizProgress(quiz),
                      Gap(context.height * 0.01),
                    ],
                  ),
                ),
              ),
              _JudgeIcon(quiz),
            ],
          ),
        ),

        const Gap(10),

        ///選択肢
        _SelectAnswer(quiz),

        if (!isPremium) AdBanner(),
      ],
    );
  }
}
