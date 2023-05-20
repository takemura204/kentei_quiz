import 'package:freezed_annotation/freezed_annotation.dart';

import 'bar_data_state.dart';

part 'dashboard_analytics_screen_state.freezed.dart';

@freezed
class DashboardAnalyticsScreenState with _$DashboardAnalyticsScreenState {
  const DashboardAnalyticsScreenState._();
  factory DashboardAnalyticsScreenState({
    @Default(0) final int tabIndex, //タブ
    @Default(-1) final int selectedXIndex,
    @Default(0) final int weeklyIndex, //1週間の単位
    @Default(0) final int monthlyIndex, //1ヶ月の単位
    @Default(10) final int goalScore, //毎日の目標
    @Default(0) final int totalScore, //1日のトータルスコア
    @Default(0) final int dailyScore, //1日のトータルスコア
    @Default(0) final int weekScore, //1週間のトータルスコア
    @Default(0) final int monthScore, //1ヶ月のトータルスコア
    @Default(7) final int selectedDayRange, //
    @Default(0) final int weekOffset, //週の操作
    @Default(0) final int monthOffset, //今月・先月・来月
    @Default("") final String dayRangeText, //タブ
    @Default([]) final List<BarData> totalData, //全部のスコア(3ヶ月)
    @Default([]) final List<BarData> dailyData, //全部のスコア(3ヶ月)
    @Default([]) final List<List<BarData>> weeklyData, //1週間のスコア
    @Default([]) final List<List<BarData>> monthlyData, //1ヶ月のスコア
  }) = _Create;
}
