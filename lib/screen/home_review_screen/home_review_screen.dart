import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/color_resource.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';

import '../../controller/home_review/home_review_screen_controller.dart';
import '../../resource/initial_resource.dart';
import '../../resource/quiz_resource.dart';
import '../screen_argument.dart';

part 'home_review_body.dart';

class HomeReviewScreen extends ConsumerWidget {
  const HomeReviewScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ProviderScope(
      // overrides: [
      //   homeReviewScreenControllerProvider.overrideWithProvider(
      //     StateNotifierProvider<HomeReviewScreenController,
      //         HomeReviewScreenState>(
      //       (ref) => HomeReviewScreenController(ref: ref),
      //     ),
      //   ),
      // ],
      child: _Body(),
    );
  }
}
