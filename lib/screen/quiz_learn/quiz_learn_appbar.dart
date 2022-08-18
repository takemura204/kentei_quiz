part of 'quiz_learn_screen.dart';

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _AppBar(this.arguments);

  final QuizLearnScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      titleSpacing: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(arguments.item.title),
      leading: Container(
        height: context.height * 0.05,
        alignment: Alignment.bottomRight,
        child: IconButton(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
          iconSize: 25,
          onPressed: () {
            ref
                .read(quizLearnScreenControllerProvider.notifier)
                .tapClearButton();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}