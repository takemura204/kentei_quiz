import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';

import '../../controller/auth/auth_controller.dart';
import '../../view/button.dart';
import '../../view/icon_button.dart';

class TestScreen extends ConsumerWidget {
  const TestScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          ///説明画面

          const Spacer(),

          ///認証方法選択
          Padding(
            padding: EdgeInsets.all(context.height * 0.02),
            child: Column(
              children: [
                ///ログインボタン
                PrimaryButton(
                  width: context.width * 0.8,
                  height: context.height * 0.07,
                  text: 'ログイン',
                  onPressed: () => context.showScreen(
                    const AccountLoginScreenArguments().generateRoute(),
                  ),
                ),

                Gap(context.height * 0.012),

                DefaultButton(
                  width: context.width * 0.8,
                  height: context.height * 0.07,
                  text: '新規会員登録',
                  onPressed: () => context.showScreen(
                    const AccountCreateStep1ScreenArguments().generateRoute(),
                  ),
                ),

                Gap(context.height * 0.01),

                ///区切り線
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Text(
                      "または",
                      style: TextStyle(
                        fontSize: context.height * 0.018,
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),

                ///Googleから登録
                SignInWithGoogleButton(
                  text: 'Googleアカウントで続ける',
                  onPressed: () =>
                      ref.read(authProvider.notifier).signInWithGoogle(),
                ),
                SignInWithGoogleButton(
                  text: 'Googleアカウントで続ける',
                  onPressed: () =>
                      ref.read(authProvider.notifier).signInWithGoogle(),
                ),
                SignInWithGoogleButton(
                  text: 'Googleアカウントで続ける',
                  onPressed: () =>
                      ref.read(authProvider.notifier).signInWithGoogle(),
                ),

                Gap(context.height * 0.015),

                Text(
                  "登録することで 利用規約 と プライバシーポリシー に同意することになります",
                  style: TextStyle(
                    fontSize: context.height * 0.01,
                  ),
                ),
                Gap(context.height * 0.01),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
