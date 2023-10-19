import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/model/user/user.model.dart';

import '../../model/dashboard/dashboard_model.dart';

class WeeklyQuizChart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userModel = ref.watch(userModelProvider).userCustom;
    final dailyQuizCountGoal = userModel.dailyQuizCountGoal; //目標値
    final limitMemory = dailyQuizCountGoal * 2; //最大表示メモリ

    final model = ref.watch(dashboardModelProvider);
    final weekDays = model.weekDays;
    final weeklyQuizCounts = model.weeklyQuizCounts;

    return Container(
      height: context.height * 0.25,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,

          ///ボーダー
          borderData: FlBorderData(
            show: true,
            border: const Border.symmetric(
              horizontal: BorderSide(
                color: Colors.grey,
              ),
            ),
          ),

          ///グリッド線
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (value) {
              final color = (value == dailyQuizCountGoal)
                  ? context.mainColor
                  : Colors.grey;
              return FlLine(
                color: color,
                strokeWidth: (value == dailyQuizCountGoal) ? 3 : 1,
              );
            },
          ),

          ///メモリ
          titlesData: FlTitlesData(
            show: true,
            //左軸
            leftTitles: AxisTitles(
              drawBehindEverything: true,
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: context.width * 0.07,
                getTitlesWidget: (value, meta) {
                  final color = (value == dailyQuizCountGoal)
                      ? context.mainColor
                      : Colors.grey;
                  final fontSize = (value == 100)
                      ? context.width * 0.025
                      : context.width * 0.03;
                  return Text(
                    "${value.toInt()}問",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: color,
                      fontSize: fontSize,
                      fontWeight: (value == dailyQuizCountGoal)
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  );
                },
              ),
            ),
            // 下軸
            bottomTitles: AxisTitles(
              drawBehindEverything: true,
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final date = weekDays[value.toInt()];
                  final isToday = DateTime.now().day == date.day &&
                      DateTime.now().weekday == date.weekday;
                  final formattedDate = "${date.month}/${date.day}";
                  return Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text(
                      formattedDate,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color:
                            isToday ? context.mainColor : Colors.grey.shade400,
                        fontSize: context.width * 0.03,
                      ),
                    ),
                  );
                },
              ),
            ),
            rightTitles: AxisTitles(),
            // 上軸
            topTitles: AxisTitles(
              drawBehindEverything: true,
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: context.width * 0.15,
                getTitlesWidget: (value, meta) {
                  final date = weekDays[value.toInt()];
                  final isQuizCountPositive =
                      weeklyQuizCounts[value.toInt()] > 0;
                  final dayOfWeek = DateFormat('E', 'ja_JP')
                      .format(date)
                      .substring(0, 1); // 曜日の略称を取得
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: context.width * 0.1,
                          height: context.width * 0.1,
                          decoration: BoxDecoration(
                            border: isQuizCountPositive
                                ? Border.all(color: context.mainColor, width: 3)
                                : Border.all(
                                    color: Colors.grey.shade400, width: 2),
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            dayOfWeek,
                            textAlign: TextAlign.center,
                            style: isQuizCountPositive
                                ? TextStyle(
                                    color: context.mainColor,
                                    fontSize: context.width * 0.03,
                                    fontWeight: FontWeight.bold,
                                  )
                                : TextStyle(
                                    color: Colors.grey.shade400,
                                    fontSize: context.width * 0.03,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          /// グラフ本体
          barGroups: weekDays.map((day) {
            final quizCount = weeklyQuizCounts[weekDays.indexOf(day)];
            final color = (quizCount >= dailyQuizCountGoal)
                ? context.mainColor
                : Colors.grey.shade400;

            return BarChartGroupData(
              x: weekDays.indexOf(day),
              barsSpace: 1,
              barRods: [
                CustomBarChartRodData(
                  toY: quizCount > limitMemory
                      ? limitMemory + 0.5
                      : quizCount.toDouble(),
                  color: color,
                  width: 30,
                  borderRadius: BorderRadius.circular(5),
                ),
              ],
              showingTooltipIndicators: [],
            );
          }).toList(),
          maxY: limitMemory.toDouble(),
          barTouchData: BarTouchData(
            enabled: true,
            handleBuiltInTouches: true,
            touchTooltipData: BarTouchTooltipData(
              tooltipBgColor: Colors.white10,
              tooltipMargin: -5,
              tooltipPadding: const EdgeInsets.all(0),
              tooltipRoundedRadius: 0,
              getTooltipItem: (
                BarChartGroupData group,
                int groupIndex,
                BarChartRodData rod,
                int rodIndex,
              ) {
                final int dataValue = weeklyQuizCounts[group.x];
                return BarTooltipItem(
                  "$dataValue",
                  TextStyle(
                    fontWeight: FontWeight.bold,
                    color: rod.color,
                    backgroundColor: Colors.transparent,
                    fontSize: context.width * 0.04,
                  ),
                  textAlign: TextAlign.center,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CustomBarChartRodData extends BarChartRodData {
  CustomBarChartRodData({
    required double toY,
    required Color color,
    required double width,
    required BorderRadius borderRadius,
  }) : super(toY: toY, color: color, width: width, borderRadius: borderRadius);
}
