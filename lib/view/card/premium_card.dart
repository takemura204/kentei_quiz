import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

import '../../screen/screen_argument.dart';

class PremiumCard extends ConsumerWidget {
  const PremiumCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        context
            .showScreen(const PremiumDetailScreenArguments().generateRoute());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          // 全ての辺に一様なボーダーを適用
          border: Border.all(
            color: context.mainColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Gap(10),

            ///タイトル
            Container(
              height: 25,
              width: context.width,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'プレミアムでもっと深く、快適に学ぼう',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(5),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Gap(10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '支払いは一度きり。\nプレミアムプランの購入で、たくさんの特典があるため、もっと学びたい方におすすめです。',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                        const Gap(5),
                        Row(
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              color: context.mainColor,
                              size: 18,
                            ),
                            const Gap(5),
                            const Text(
                              '広告の非表示',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              color: context.mainColor,
                              size: 18,
                            ),
                            const Gap(5),
                            const Text(
                              '用語・クイズの増加',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              color: context.mainColor,
                              size: 18,
                            ),
                            const Gap(5),
                            const Text(
                              '学習状況,進捗状況の可視化 など',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/image/premium_1.svg',
                    height: context.width * 0.25,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            const Gap(10),
            Container(
              height: 20,
              width: context.width,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: context.accentColor,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 10,
                      ),
                    ),
                  ),
                  const Gap(3),
                  Text(
                    'Premium',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: context.accentColor,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade600),
                    alignment: Alignment.center,
                    child: const Text(
                      'くわしく見る',
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(5),
          ],
        ),
      ),
    );
  }
}
