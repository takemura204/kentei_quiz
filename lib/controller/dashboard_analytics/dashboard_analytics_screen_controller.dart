import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

import '../dashboard_analytics/bar_data_state.dart';
import '../quiz/quiz_state.dart';
import 'dashboard_analytics_screen_state.dart';

final dashboardAnalyticsScreenProvider = StateNotifierProvider<
    DashboardAnalyticsScreenController, DashboardAnalyticsScreenState>(
  (ref) => DashboardAnalyticsScreenController(ref: ref),
);

class DashboardAnalyticsScreenController
    extends StateNotifier<DashboardAnalyticsScreenState> with LocatorMixin {
  DashboardAnalyticsScreenController({required this.ref})
      : super(DashboardAnalyticsScreenState()) {
    initState();
  }
  final Ref ref;
  final tabs = [7, 31];
  final now = DateTime.now();
  final days = DateTime.now().weekday - 1;

  @override
  void initState() {
    // _resetData();
    state = state.copyWith(isLoading: true); // データロード開始を反映
    _initQuizData().then((_) {
      state = state.copyWith(isLoading: false); // データロード終了を反映
    });
    _initDayRangeText();
  }

  ///ダッシュボードデータ取得
  Future _initQuizData() async {
    await _getTotalData();
    _getDailyData();
    _getWeeklyData();
    _getMonthlyData();
  }

  ///「全期間」のダッシュボードデータ取得
  Future _getTotalData() async {
    final prefs = await SharedPreferences.getInstance();
    final totalDataJson = prefs.getString('total_data');
    if (totalDataJson != null) {
      final totalData = (json.decode(totalDataJson) as List)
          .map((data) => BarData.fromJson(data as Map<String, dynamic>))
          .toList();

      // 新規に起動した日が前回のtotalDataに含まれていない場合、それらの日にちを追加する
      final lastSavedDate = totalData.last.day;
      final differenceInDays = now.difference(lastSavedDate).inDays;
      bool _isSameDay(DateTime day1, DateTime day2) {
        return day1.year == day2.year &&
            day1.month == day2.month &&
            day1.day == day2.day;
      }

      // 新規起動日（"今日"）がtotalDataに含まれていなければ追加する
      if (differenceInDays >= 0) {
        for (int i = 0; i <= differenceInDays; i++) {
          final dateToAdd = now.subtract(Duration(days: i));
          if (!totalData.any((barData) => _isSameDay(barData.day, dateToAdd))) {
            totalData.add(_createBarData(i));
          }
        }
      }
      state = state.copyWith(totalData: totalData);
      _saveData('total_data', totalData);
    } else {
      const days = 90; //3ヶ月分のデータ
      final totalData = List.generate(days, (i) => _createBarData(i));
      state = state.copyWith(totalData: totalData);
      _saveData('total_data', totalData);
    }
  }

  BarData _createBarData(int daysAgo) {
    final day = now.subtract(Duration(days: daysAgo));
    return BarData(quizData: [], day: day); // quizDataは初期値0とする
  }

  ///「今日」のデータ取得
  void _getDailyData() {
    final totalData = [...state.totalData];
    final dailyData = totalData.first;
    state = state.copyWith(dailyData: dailyData);
  }

  ///「週間」のデータ取得
  void _getWeeklyData() {
    final totalData = [...state.totalData];
    final weeklyData = _groupDataByPeriod(
      totalData,
      (date) => DateTime(
          date.year, date.month, date.day - (date.weekday - 1 + 7) % 7),
      7,
    );
    state = state.copyWith(weeklyData: weeklyData);
  }

  ///「月間」のデータ取得
  void _getMonthlyData() {
    final totalData = [...state.totalData];
    final currentMonthDays = DateTime(now.year, now.month + 1, 0).day;
    final monthlyData = _groupDataByPeriod(
      totalData,
      (date) => DateTime(date.year, date.month, 1),
      currentMonthDays,
    );
    state = state.copyWith(monthlyData: monthlyData);
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
      if (day.isAfter(DateTime.now())) {
        if (dataByPeriod[periodStart] == null ||
            (dataByPeriod[periodStart]?.any((d) => d.day == day) ?? false) ==
                false) {
          (dataByPeriod[periodStart] ??= [])
              .add(BarData(quizData: [], day: day));
        }
      }
    }

    for (var periodData in dataByPeriod.values) {
      periodData.sort((a, b) => a.day.compareTo(b.day));
    }

    return dataByPeriod.values.toList();
  }

  ///Quizを保存
  Future _saveData(String type, List<BarData> data) async {
    final prefs = await SharedPreferences.getInstance();
    final dataJson = json.encode(data.map((data) => data.toJson()).toList());
    await prefs.setString(type, dataJson);
  }

  /// スコア更新
  Future updateScore(List<QuizState> quizList) async {
    final totalData = [...state.totalData];
    // 当日のデータを更新
    final todayQuizData = [...totalData.first.quizData];
    todayQuizData.addAll(quizList);
    final updatedDailyData = totalData.first.copyWith(quizData: todayQuizData);
    // 更新された当日のデータを全データの最初に設定して保存
    totalData[0] = updatedDailyData;
    state = state.copyWith(totalData: totalData);
    _saveData('total_data', totalData);
    // 各データの更新
    _getDailyData();
    _getWeeklyData();
    _getMonthlyData();
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

  ///目標設定
  void setGoalY(int index) {
    if (index >= 10 && index <= 50) {
      state = state.copyWith(goalScore: index);
    }
  }

  ///期間
  void _setDayRange(int index) {
    final selectedDayRange = tabs[index];
    final tabIndex = index;
    state =
        state.copyWith(selectedDayRange: selectedDayRange, tabIndex: tabIndex);
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

  Future _resetData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("total_data");
  }
}