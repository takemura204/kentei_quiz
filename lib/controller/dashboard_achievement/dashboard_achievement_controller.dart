import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../model/mission/mission.dart';
import '../../model/mission/mission_model.dart';
import '../../model/rank/rank_model.dart';
import 'dashboard_achievement_state.dart';

final dashboardAchievementProvider = StateNotifierProvider<
    DashboardAchievementController, DashboardAchievementState>(
  (ref) => DashboardAchievementController(ref: ref),
);

class DashboardAchievementController
    extends StateNotifier<DashboardAchievementState> with LocatorMixin {
  DashboardAchievementController({required this.ref})
      : super(DashboardAchievementState()) {
    initState();
  }

  final Ref ref;
  Timer? _timer;

  @override
  void initState() {
    _startLimitTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startLimitTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(
        const Duration(minutes: 1), (timer) => _updateTimeLimit());
    _updateTimeLimit();
  }

  void _updateTimeLimit() {
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day + 1);
    final difference = midnight.difference(now);
    final hours = difference.inHours;
    final minutes = difference.inMinutes % 60;
    final timeLimitText = hours > 0 ? '$hours 時間' : '$minutes 分';
    state = state.copyWith(timeLimit: timeLimitText);
  }

  ///受け取るボタン
  void tapMissionReceiveButton(Mission mission) {
    ref.read(rankModelProvider.notifier).updateScore(mission.point);
    ref.read(missionModelProvider.notifier).receiveMission(mission);
  }
}