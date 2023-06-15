part of 'account_create_screen1.dart';

class _SocialLogin extends ConsumerWidget {
  const _SocialLogin();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Row(
        children: [
          const Spacer(),

          ///Google
          GoogleIconButton(
            onPressed: () =>
                ref.read(authScreenProvider.notifier).signInWithGoogle(),
          ),

          ///Twitter
          TwitterIconButton(
            onPressed: () =>
                ref.read(authScreenProvider.notifier).signInWithGoogle(),
          ),

          ///LINE
          LineIconButton(
            onPressed: () =>
                ref.read(authScreenProvider.notifier).signInWithGoogle(),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}