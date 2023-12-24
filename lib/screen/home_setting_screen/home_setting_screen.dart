import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/auth/auth_controller.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/model/user/user.model.dart';
import 'package:line_icons/line_icons.dart';

import '../../model/lang/initial_resource.dart';
import '../../view/bar.dart';
import '../../view/button/primary_button.dart';
import '../../view/dialog.dart';
import '../screen_argument.dart';

part 'home_setting_view.dart';

class HomeSettingScreen extends ConsumerWidget {
  const HomeSettingScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userCustom = ref.watch(userModelProvider).userCustom;
    final dailyQuizCountGoal = userCustom.dailyQuizCountGoal;
    return Scaffold(
      appBar: AppBar(
        title: Text(I18n().titleSetting),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// プロフィール
            Container(
              color: Colors.white,
              height: context.height * 0.22,
              child: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // スプラッシュ画面などに書き換えても良い
                    return const SizedBox();
                  }
                  if (snapshot.hasData) {
                    // User が null でなない、サインイン済みのホーム画面へ
                    return Column(
                      children: [
                        const SettingTitleBar(
                          title: "アカウント情報(サインイン済み)",
                          onTap: null,
                        ),
                        const UserProfile(),
                        DefaultSettingBar(
                          title: "プロフィール編集",
                          onTap: () => context.showScreen(
                            const ProfileScreenArguments().generateRoute(),
                          ),
                        ),
                      ],
                    );
                  }

                  /// 未サインインのサインイン画面
                  return Container(
                    height: context.height * 0.2,
                    child: Column(
                      children: [
                        const SettingTitleBar(
                          title: "アカウント情報(未サインイン)",
                          onTap: null,
                        ),
                        const UserProfile(),

                        ///ログイン・会員登録ボタン
                        SetAccountButton(
                          onPressed: () => context.showScreen(
                            const AccountCreateStep1ScreenArguments()
                                .generateRoute(),
                          ),
                          text: "新規登録・ログイン",
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Column(
              children: [
                const SettingTitleBar(
                  title: "設定",
                  onTap: null,
                ),
                CustomSettingBar(
                  title: "カラーテーマ",
                  customWidget: Container(
                    height: context.width * 0.05,
                    width: context.width * 0.05,
                    margin: EdgeInsets.all(context.width * 0.01),
                    decoration: ShapeDecoration(
                      shape: const CircleBorder(),
                      color: context.mainColor,
                    ),
                  ),
                  onTap: () {
                    context.showScreen(
                        const SettingColorScreenArguments().generateRoute());
                  },
                ),
                _Divider(),
                CustomSettingBar(
                  title: "毎日の目標",
                  customWidget: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$dailyQuizCountGoal",
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: context.width * 0.04,
                        ),
                      ),
                      Text(
                        "問",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: context.width * 0.04,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return PrimaryCloseDialog(
                            title: "目標を設定",
                            subWidget: const _SetDailyQuizCountGoal(),
                            doneText: "保存",
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          );
                        });
                  },
                ),
                _Divider(),
                const DefaultSettingBar(
                  title: "通知",
                  onTap: null,
                ),
                _Divider(),
                const SettingTitleBar(
                  title: "アプリについて",
                  onTap: null,
                ),
                const DefaultSettingBar(
                  title: "お問合せ",
                  onTap: null,
                ),
                const DefaultSettingBar(
                  title: "シェア",
                  onTap: null,
                ),
                const DefaultSettingBar(
                  title: "開発者",
                  onTap: null,
                ),
              ],
            ),

            Container(
              child: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // スプラッシュ画面などに書き換えても良い
                    return const SizedBox();
                  }
                  if (snapshot.hasData) {
                    // User が null でなない、つまりサインイン済みのホーム画面へ
                    return Column(
                      children: [
                        ///アカウント削除
                        const SettingTitleBar(
                          title: "その他",
                          onTap: null,
                        ),
                        DefaultSettingBar(
                          title: "アプリを削除する",
                          onTap: () async {
                            context.showScreen(
                                const AccountDeleteScreenArguments()
                                    .generateRoute());
                          },
                        ),
                        Gap(context.height * 0.025),

                        ///ログアウトボタン
                        SetAccountButton(
                          onPressed: () async {
                            await showDialog(
                                context: context,
                                builder: (context) {
                                  return PrimaryDialog(
                                      onPressed: () {
                                        ref
                                            .read(authProvider.notifier)
                                            .signOut();
                                        Navigator.of(context).pop();
                                      },
                                      title: "ログアウトしますか？",
                                      subWidget: Text(
                                        "ログアウトすると\n一部の機能が制限されます。",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: context.width * 0.04,
                                            color: Colors.black87),
                                        maxLines: 2,
                                      ),
                                      cancelText: "キャンセル",
                                      doneText: "ログアウト");
                                });
                          },
                          text: "ログアウト",
                        ),
                      ],
                    );
                  }

                  // User が null である、つまり未サインインのサインイン画面へ
                  return const SizedBox();
                },
              ),
            ),
            Gap(context.height * 0.025),
          ],
        ),
      ),
    );
  }
}

class _Divider extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: const Divider(height: 1),
    );
  }
}
