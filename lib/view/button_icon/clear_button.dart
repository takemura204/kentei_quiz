import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:line_icons/line_icons.dart';

///Clearボタン
class ClearButton extends ConsumerWidget {
  const ClearButton({required this.iconSize, required this.onPressed});

  final double iconSize;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.05,
      child: IconButton(
        padding: EdgeInsets.all(context.width * 0.01),
        alignment: Alignment.topRight,
        iconSize: iconSize,
        onPressed: () {
          onPressed();
          Navigator.of(context).pop();
        },
        icon: Icon(
          LineIcons.times,
          color: context.mainColor,
        ),
      ),
    );
  }
}