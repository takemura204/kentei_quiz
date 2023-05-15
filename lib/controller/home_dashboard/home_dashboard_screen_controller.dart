import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:state_notifier/state_notifier.dart';

import 'home_dashboard_screen_state.dart';

final homeDashboardScreenProvider = StateNotifierProvider<
    HomeDashboardScreenController, HomeDashboardScreenState>(
  (ref) => HomeDashboardScreenController(ref: ref),
);

class HomeDashboardScreenController
    extends StateNotifier<HomeDashboardScreenState> with LocatorMixin {
  HomeDashboardScreenController({required this.ref})
      : super(HomeDashboardScreenState()) {
    initState();
  }

  final Ref ref;
  final tabs = [7, 31, 12];
  final now = DateTime.now();
  final days = DateTime.now().weekday - 1;

  @override
  void initState() {
    _initDayRangeText();
    _initDataList();
  }

  void _initDataList() {
    _getTotalDataList();
    _getWeeklyDataList();
    _getMonthlyDataList();
  }

  void _getTotalDataList() {
    final random = Random();
    const days = 90;
    final totalDataList = List.generate(days, (i) => _createBarData(i, random));
    state = state.copyWith(totalDataList: totalDataList);
  }

  BarData _createBarData(int daysAgo, Random random) {
    final day = now.subtract(Duration(days: daysAgo));
    final score = random.nextInt(40) + 1;
    return BarData(score, day);
  }

  void _getWeeklyDataList() {
    final totalDataList = [...state.totalDataList];
    final weeklyDataList = _groupDataByPeriod(
      totalDataList,
      (date) => DateTime(date.year, date.month, date.day - (date.weekday - 1)),
      7,
    );
    state = state.copyWith(weeklyDataList: weeklyDataList);
  }

  void _getMonthlyDataList() {
    final totalDataList = [...state.totalDataList];
    final currentMonthDays = DateTime(now.year, now.month + 1, 0).day;
    final monthlyDataList = _groupDataByPeriod(
      totalDataList,
      (date) => DateTime(date.year, date.month, 1),
      currentMonthDays,
    );
    state = state.copyWith(monthlyDataList: monthlyDataList);
  }

  ///各期間ごとにデータを集計
  List<List<BarData>> _groupDataByPeriod(
    List<BarData> dataList,
    DateTime Function(DateTime) getStartOfPeriod,
    int periodDays,
  ) {
    final Map<DateTime, List<BarData>> dataByPeriod = {};

    for (var data in dataList) {
      final periodStart = getStartOfPeriod(data.day);
      (dataByPeriod[periodStart] ??= []).add(data);
    }
    final periodStart = getStartOfPeriod(DateTime.now());
    for (var day = DateTime.now();
        day.isBefore(periodStart.add(Duration(days: periodDays)));
        day = day.add(const Duration(days: 1))) {
      if (dataByPeriod[periodStart] == null ||
          (dataByPeriod[periodStart]?.any((d) => d.day == day) ?? false) ==
              false) {
        (dataByPeriod[periodStart] ??= []).add(BarData(0, day));
      }
    }

    for (var periodData in dataByPeriod.values) {
      periodData.sort((a, b) => a.day.compareTo(b.day));
    }

    return dataByPeriod.values.toList();
  }

  int _getScore(List<BarData> dataList) {
    return dataList.map((data) => data.score).reduce((a, b) => a + b);
  }

  List<BarData> _createYearlyDataList(Random random) {
    final Map<int, List<BarData>> yearDataByMonth = {};
    for (int i = 0; i < 365; i++) {
      final barData = _createBarData(i, random);
      yearDataByMonth.putIfAbsent(barData.day.month, () => []);
      yearDataByMonth[barData.day.month]!.add(barData);
    }
    final List<BarData> yearDataList = [];
    for (int i = 1; i <= 12; i++) {
      if (yearDataByMonth.containsKey(i)) {
        final List<BarData> barData = yearDataByMonth[i]!;
        final int totalScore =
            barData.map((data) => data.score).reduce((a, b) => a + b);
        final DateTime firstDay = barData.first.day;
        yearDataList.add(BarData(totalScore, firstDay));
      } else {
        // データが存在しない月はスコア0のデータを作成
        yearDataList.add(BarData(0, DateTime(now.year, i, 1)));
      }
    }
    yearDataList.sort((a, b) => a.day.month.compareTo(b.day.month));
    return yearDataList;
  }

  ///TabBarをタップした時
  void tapTabBar(int index) {
    _setDayRange(index);
    _initDayRangeText();
  }

  /// 前の期間に戻るボタンをタップした時
  void tapPreButton() {
    final selectedDayRange = state.selectedDayRange;
    if (selectedDayRange == 7) {
      _goPrevWeek();
    } else if (selectedDayRange == 31) {
      _goPrevMonth();
    }
    _initDayRangeText();
  }

  /// 前の期間に戻るボタンをタップした時
  void tapNextButton() {
    final selectedDayRange = state.selectedDayRange;
    if (selectedDayRange == 7) {
      _goNextWeek();
    } else if (selectedDayRange == 31) {
      _goNextMonth();
    }
    _initDayRangeText();
  }

  ///今日の日付を取得
  void setTodayData(int value) {
    final weekList = [...state.totalDataList];
    final newValue = weekList[days].score + value;
    weekList[days] = BarData(newValue,
        state.totalDataList[days].day); // using `day` instead of `weekDay`

    state = state.copyWith(dayScore: newValue);
  }

  ///選択期間のText取得
  void _initDayRangeText() {
    final weekText = getWeekText();
    final monthText = getMonthText();
    final selectedDayRange = state.selectedDayRange;
    if (selectedDayRange == 7) {
      state = state.copyWith(dayRangeText: weekText);
    } else if (selectedDayRange == 31) {
      state = state.copyWith(dayRangeText: monthText);
    }
  }

  void selectXIndex(int selectedXIndex) {
    state = state.copyWith(selectedXIndex: selectedXIndex);
  }

  void setGoalY(int index) {
    if (index >= 10 && index <= 50) {
      state = state.copyWith(goalY: index);
    }
  }

  ///期間
  void _setDayRange(int index) {
    final selectedDayRange = tabs[index];
    final tabIndex = index;
    state =
        state.copyWith(selectedDayRange: selectedDayRange, tabIndex: tabIndex);
    ;
  }

  ///先週へ
  void _goPrevWeek() {
    final weekOffset = state.weekOffset;
    final weeklyIndex = state.weeklyIndex;
    if (weekOffset > -3) {
      state = state.copyWith(
          weekOffset: weekOffset - 1, weeklyIndex: weeklyIndex + 1);
    }
  }

  ///来週へ
  void _goNextWeek() {
    final weekOffset = state.weekOffset;
    final weeklyIndex = state.weeklyIndex;
    if (weekOffset < 0) {
      state = state.copyWith(
          weekOffset: weekOffset + 1, weeklyIndex: weeklyIndex - 1);
    }
  }

  ///先月へ
  void _goPrevMonth() {
    final monthOffset = state.monthOffset;
    final monthlyIndex = state.monthlyIndex;
    if (monthOffset > -2) {
      state = state.copyWith(
          monthOffset: monthOffset - 1, monthlyIndex: monthlyIndex + 1);
    }
  }

  ///来月へ
  void _goNextMonth() {
    final monthOffset = state.monthOffset;
    final monthlyIndex = state.monthlyIndex;
    if (monthOffset < 0) {
      state = state.copyWith(
          monthOffset: monthOffset + 1, monthlyIndex: monthlyIndex - 1);
    }
  }

  String getWeekText() {
    final weekOffset = state.weekOffset;
    final startOfWeek =
        now.subtract(Duration(days: days)).add(Duration(days: 7 * weekOffset));
    final endOfWeek = startOfWeek.add(const Duration(days: 6));

    final formatter = DateFormat('M/d');
    return '${formatter.format(startOfWeek)}〜${formatter.format(endOfWeek)}';
  }

  String getMonthText() {
    final monthOffset = state.monthOffset;
    final currentMonth = now.month + monthOffset;

    final year = now.year + (currentMonth - 1) ~/ 12;
    final month = (currentMonth - 1) % 12 + 1;

    return '$year年$month月';
  }

  BarChartGroupData generateBarGroup(int x, Color color, double value) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: color,
          width: 30, // 棒グラフの太さ
          borderRadius: BorderRadius.circular(5),
        ),
      ],
      showingTooltipIndicators: state.selectedXIndex == x ? [0] : [],
    );
  }
}

class BarData {
  BarData(this.score, this.day) : weekDay = _getWeekDayString(day);

  final int score;
  final DateTime day;
  final String weekDay;

  static String _getWeekDayString(DateTime dateTime) {
    // 1が月曜日、7が日曜日
    switch (dateTime.weekday) {
      case 1:
        return "Mon";
      case 2:
        return "Tue";
      case 3:
        return "Wed";
      case 4:
        return "Thu";
      case 5:
        return "Fri";
      case 6:
        return "Sat";
      case 7:
        return "Sun";
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
