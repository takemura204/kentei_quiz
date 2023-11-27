import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

class ResultTryCard extends ConsumerWidget {
  const ResultTryCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: context.mainColor,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Gap(context.width * 0.05),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NICE TRY!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: context.width * 0.1,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  'もう少しで合格です！頑張っていきましょう！',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: context.width * 0.03,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.thumb_up,
              color: Colors.white,
              size: context.height * 0.085,
            ),
          ),
          Gap(context.width * 0.05),
        ],
      ),
    );
  }
}
