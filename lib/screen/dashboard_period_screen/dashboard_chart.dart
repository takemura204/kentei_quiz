part of 'dashboard_period_screen.dart';

class PeriodChart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeDashboardScreenProvider);
    final unitY = state.unitY;
    final valueX = state.valueX;
    final valueY = state.valueY;
    final maxValue =
        valueY * 2 % 5 == 0 ? valueY * 2 : (valueY * 2 ~/ 5 + 1) * 5;

    final days = state.days;
    final selectedPeriodType = state.selectedPeriodType;

    return Container(
      height: 270,
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
              final color = (value == valueY.toDouble())
                  ? context.mainColor
                  : Colors.grey;
              return FlLine(
                color: color,
                strokeWidth: (value == valueY.toDouble()) ? 3 : 1,
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
                reservedSize: 30,
                getTitlesWidget: (value, meta) {
                  final color = (value == valueY.toDouble())
                      ? context.mainColor
                      : Colors.grey;
                  final fontSize = (value >= 100) ? 10.0 : 12.0;
                  return Text(
                    "${value.toInt()}$unitY",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: color,
                      fontSize: fontSize,
                      fontWeight: (value == valueY.toDouble())
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
                  final date = days[value.toInt()];
                  final isToday = DateTime.now().day == date.day &&
                      DateTime.now().weekday == date.weekday;
                  final weeklyDateText = "${date.month}/${date.day}";
                  final monthlyDateText =
                      (date.day % 5 != 1) ? "" : "${date.day}";
                  switch (selectedPeriodType) {
                    case PeriodType.weekly:
                      return Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text(
                          weeklyDateText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isToday
                                ? context.mainColor
                                : Colors.grey.shade400,
                            fontSize: 14,
                          ),
                        ),
                      );
                    case PeriodType.monthly:
                      return Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text(
                          monthlyDateText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isToday
                                ? context.mainColor
                                : Colors.grey.shade400,
                            fontSize: 14,
                          ),
                        ),
                      );
                  }
                },
              ),
            ),
            rightTitles: AxisTitles(
              drawBehindEverything: true,
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: context.width * 0.03,
                getTitlesWidget: (value, meta) {
                  final color = (value == valueY.toDouble())
                      ? context.mainColor
                      : Colors.grey;
                  final fontSize = (value == 100) ? 12.0 : 10.0;
                  return Text(
                    "",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: color,
                      fontSize: fontSize,
                      fontWeight: (value == valueY.toDouble())
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  );
                },
              ),
            ),
            // 上軸
            topTitles: AxisTitles(
              drawBehindEverything: true,
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: context.width * 0.12,
                getTitlesWidget: (value, meta) {
                  final date = days[value.toInt()];
                  final isQuizCountPositive = valueX[value.toInt()] > 0;
                  final dayOfWeek = DateFormat('E', 'ja_JP')
                      .format(date)
                      .substring(0, 1); // 曜日の略称を取得
                  switch (selectedPeriodType) {
                    case PeriodType.weekly:
                      return Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: context.width * 0.08,
                              height: context.width * 0.08,
                              decoration: BoxDecoration(
                                border: isQuizCountPositive
                                    ? Border.all(
                                        color: context.mainColor, width: 3)
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

                    case PeriodType.monthly:
                      return Container(
                        // color: Colors.green,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: context.width * 0.02,
                              height: context.width * 0.02,
                              decoration: BoxDecoration(
                                  border: isQuizCountPositive
                                      ? Border.all(
                                          color: context.mainColor, width: 1)
                                      : Border.all(
                                          color: Colors.grey.shade400,
                                          width: 1),
                                  shape: BoxShape.circle,
                                  color: isQuizCountPositive
                                      ? context.mainColor
                                      : Colors.grey.shade400),
                              alignment: Alignment.center,
                            ),
                          ],
                        ),
                      );
                  }
                },
              ),
            ),
          ),

          /// グラフ本体
          barGroups: days.map((day) {
            final quizCount = valueX[days.indexOf(day)];
            final color = (quizCount >= valueY)
                ? context.mainColor
                : Colors.grey.shade400;

            switch (selectedPeriodType) {
              case PeriodType.weekly:
                return BarChartGroupData(
                  x: days.indexOf(day),
                  barsSpace: 1,
                  barRods: [
                    CustomBarChartRodData(
                      toY: quizCount > maxValue
                          ? maxValue + 0.5
                          : quizCount.toDouble(),
                      color: color,
                      width: 30,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ],
                  showingTooltipIndicators: [],
                );
              case PeriodType.monthly:
                return BarChartGroupData(
                  x: days.indexOf(day),
                  barsSpace: 1,
                  barRods: [
                    CustomBarChartRodData(
                      toY: quizCount > maxValue
                          ? maxValue + 0.5
                          : quizCount.toDouble(),
                      color: color,
                      width: 10,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ],
                  showingTooltipIndicators: [],
                );
            }
          }).toList(),
          maxY: maxValue.toDouble(),
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
                final int dataValue = valueX[group.x];
                return BarTooltipItem(
                  "$dataValue",
                  TextStyle(
                    fontWeight: FontWeight.bold,
                    color: rod.color,
                    backgroundColor: Colors.transparent,
                    fontSize: context.width * 0.03,
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
