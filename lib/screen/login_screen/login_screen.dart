import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/controller/extension_resource.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';

import '../../controller/auth/auth_screen_controller.dart';
import '../../controller/login/login_screen_controller.dart';
import '../../resource/lang/initial_resource.dart';
import '../../view/button.dart';
import '../../view/dialog.dart';
import '../../view/text_field.dart';

part 'login_appbar.dart';
part 'login_view.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen(this.arguments);
  final LoginScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValidEmail = ref.watch(loginScreenControllerProvider).isValidEmail;
    final isSafetyPass = ref.watch(loginScreenControllerProvider).isSafetyPass;
    final isObscure = ref.watch(loginScreenControllerProvider).isObscure;
    final emailController =
        ref.watch(loginScreenControllerProvider.notifier).emailController;
    final passwordController =
        ref.watch(loginScreenControllerProvider.notifier).passwordController;
    final formKey = ref.watch(loginScreenControllerProvider.notifier).formKey;
    final focusNode =
        ref.watch(loginScreenControllerProvider.notifier).focusNode;
    final errorText = ref.watch(loginScreenControllerProvider).errorText;

    return Focus(
      focusNode: focusNode,
      child: GestureDetector(
        onTap: focusNode.requestFocus,
        child: Scaffold(
          resizeToAvoidBottomInset: false, //キーボードによって画面サイズを変更させないため
          appBar: const _AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const Spacer(),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      // if (hasError)
                      //   LoginErrorBar(
                      //       errorText: I18n().loginErrorText(errorText))
                      // else
                      //   const Gap(0),
                      // const Gap(20),

                      ///メールアドレス
                      EmailTextField(
                        emailController: emailController,
                        isValidEmail: isValidEmail,
                        onChanged: (email) => ref
                            .read(loginScreenControllerProvider.notifier)
                            .setEmail(email),
                      ),

                      const Gap(10),

                      ///パスワード
                      Stack(
                        children: [
                          PasswordTextField(
                            passwordController: passwordController,
                            isValidEmail: isValidEmail,
                            isSafetyPass: isSafetyPass,
                            isObscure: isObscure,
                            onChanged: (password) => ref
                                .read(loginScreenControllerProvider.notifier)
                                .setPassword(password),
                            obscureIconButtonPressed: () => ref
                                .read(loginScreenControllerProvider.notifier)
                                .switchObscure(),
                          ),
                          Container(
                              alignment: Alignment.bottomRight,
                              height: context.height * 0.1,
                              child: const Text("パスワードを忘れた場合")),
                        ],
                      ),
                    ],
                  ),
                ),

                const Gap(20),

                ///送信ボタン
                LoginWithEmailButton(
                  text: 'ログイン',
                  onPressed: isValidEmail && isSafetyPass
                      ? () {
                          ref
                              .read(loginScreenControllerProvider.notifier)
                              .signIn();
                          showDialog(
                              context: context,
                              builder: (_) => ResultDialog(
                                    title: "a",
                                    content: I18n().loginErrorText(errorText),
                                  ));
                        }
                      : null,
                ),
                const Gap(20),

                ///区切り線
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Text(
                      "または",
                      style: TextStyle(
                        fontSize: context.height * 0.02,
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
                const Gap(10),

                ///ソーシャルログイン
                const _SocialLogin(),

                const Gap(30),

                ///区切り線
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Text(
                      '会員登録をしていない方',
                      style: TextStyle(
                        fontSize: context.height * 0.02,
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),

                const Gap(20),

                ///新規会員登録画面
                CreateAccountWithEmailButton(
                  text: '新規会員登録',
                  onPressed: () => context.showScreen(
                    const CreateAccountScreenArguments().generateRoute(),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
