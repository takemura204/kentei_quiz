import 'package:flutter/material.dart';
import 'package:kentei_quiz/entity/quiz_item.dart';
import 'package:kentei_quiz/screen/login_screen/login_screen.dart';
import 'package:kentei_quiz/screen/quiz_choice_screen/quiz_choice_screen.dart';
import 'package:kentei_quiz/screen/quiz_learn_screen/quiz_learn_screen.dart';
import 'package:kentei_quiz/screen/quiz_true_false_screen/quiz_true_false_screen.dart';

import '../resource/controller/screen_argument_resource.dart';
import 'auth_screen/auth_screen.dart';
import 'create_account_screen/create_account_screen.dart';

///一問一答形式へ画面遷移
class QuizLearnScreenArguments with _NoParamsMixin implements IScreenArguments {
  const QuizLearnScreenArguments({required this.item, required this.quizStyle});

  final QuizItem item;
  final String quizStyle;

  @override
  String get screenNameFormat => "/quiz_learn";

  @override
  Route generateRoute() => PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            QuizLearnScreen(this),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return const FadeUpwardsPageTransitionsBuilder().buildTransitions(
              MaterialPageRoute(builder: (context) => QuizLearnScreen(this)),
              context,
              animation,
              secondaryAnimation,
              child);
        },
      );
}

///4択形式へ画面遷移
class QuizChoiceScreenArguments
    with _NoParamsMixin
    implements IScreenArguments {
  const QuizChoiceScreenArguments(
      {required this.item, required this.quizStyle});

  final QuizItem item;
  final String quizStyle;

  @override
  String get screenNameFormat => "/quiz_choice";

  @override
  Route generateRoute() => PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            QuizChoiceScreen(this),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return const FadeUpwardsPageTransitionsBuilder().buildTransitions(
              MaterialPageRoute(builder: (context) => QuizChoiceScreen(this)),
              context,
              animation,
              secondaryAnimation,
              child);
        },
      );
}

///○×クイズ
class QuizTrueFalseScreenArguments
    with _NoParamsMixin
    implements IScreenArguments {
  const QuizTrueFalseScreenArguments(
      {required this.item, required this.quizStyle});

  final QuizItem item;
  final String quizStyle;

  @override
  String get screenNameFormat => "/quiz_true_false";

  @override
  Route generateRoute() => PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            QuizTureFalseScreen(this),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return const FadeUpwardsPageTransitionsBuilder().buildTransitions(
              MaterialPageRoute(
                  builder: (context) => QuizTureFalseScreen(this)),
              context,
              animation,
              secondaryAnimation,
              child);
        },
      );
}

///認証画面
class AuthScreenArguments with _NoParamsMixin implements IScreenArguments {
  const AuthScreenArguments();

  @override
  String get screenNameFormat => "/auth";

  @override
  Route generateRoute() => PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            AuthScreen(this),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return const FadeUpwardsPageTransitionsBuilder().buildTransitions(
              MaterialPageRoute(builder: (context) => AuthScreen(this)),
              context,
              animation,
              secondaryAnimation,
              child);
        },
      );
}

///ログイン画面
class LoginScreenArguments with _NoParamsMixin implements IScreenArguments {
  const LoginScreenArguments();

  @override
  String get screenNameFormat => "/login";

  @override
  Route generateRoute() => PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            LoginScreen(this),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return const FadeUpwardsPageTransitionsBuilder().buildTransitions(
              MaterialPageRoute(builder: (context) => LoginScreen(this)),
              context,
              animation,
              secondaryAnimation,
              child);
        },
      );
}

///新規登録画面
class CreateAccountScreenArguments
    with _NoParamsMixin
    implements IScreenArguments {
  const CreateAccountScreenArguments();

  @override
  String get screenNameFormat => "/create_account";

  @override
  Route generateRoute() => PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            CreateAccountScreen(this),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return const FadeUpwardsPageTransitionsBuilder().buildTransitions(
              MaterialPageRoute(
                  builder: (context) => CreateAccountScreen(this)),
              context,
              animation,
              secondaryAnimation,
              child);
        },
      );
}

mixin _NoParamsMixin<T> implements IScreenArguments<T> {
  @override
  String get screenName => screenNameFormat;
}
