part of 'account_login_screen.dart';

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
            onPressed: () => ref.read(authProvider.notifier).signInWithGoogle(),
          ),

          ///Twitter
          TwitterIconButton(
            onPressed: () => ref.read(authProvider.notifier).signInWithGoogle(),
          ),

          ///LINE
          LineIconButton(
            onPressed: () => ref.read(authProvider.notifier).signInWithGoogle(),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}
