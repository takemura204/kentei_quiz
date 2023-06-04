import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../quiz/quiz_state.dart';

part 'bar_data_state.freezed.dart';
part 'bar_data_state.g.dart';

@freezed
class BarData with _$BarData {
  const factory BarData({
    required final List<QuizState> quizData,
    required final DateTime day,
  }) = _BarData;

  factory BarData.fromJson(Map<String, dynamic> json) =>
      _$BarDataFromJson(json);
}

extension BarDataEX on BarData {
  int get score => quizData.length;

  String get weekDay {
    switch (day.weekday) {
      case 1:
        return "(月)";
      case 2:
        return "(火)";
      case 3:
        return "(水)";
      case 4:
        return "(木)";
      case 5:
        return "(金)";
      case 6:
        return "(土)";
      case 7:
        return "(日)";
      default:
        return "";
    }
  }
}

class CustomBarChartRodData extends BarChartRodData {
  CustomBarChartRodData({
    required int toY,
    required Color color,
    required double width,
    required BorderRadius borderRadius,
  }) : super(
            toY: toY.toDouble(),
            color: color,
            width: width,
            borderRadius: borderRadius);
}
