// import 'package:rxdart/rxdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/home_review/home_review_screen_controller.dart';
import 'package:state_notifier/state_notifier.dart';

import 'home_root_screen_state.dart';

final homeRootScreenControllerProvider =
    StateNotifierProvider<HomeRootScreenController, HomeRootScreenState>(
  (ref) => HomeRootScreenController(ref: ref),
);

class HomeRootScreenController extends StateNotifier<HomeRootScreenState>
    with LocatorMixin {
  HomeRootScreenController({required this.ref})
      : super(const HomeRootScreenState()) {
    initState();
  }

  final Ref ref;

  @override
  void initState() {
    ref.read(homeReviewScreenControllerProvider.notifier).initState();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  ///BttomNavigationBar変更
  void changeTabIndex(int index) {
    state = state.copyWith(currentIndex: index);
  }
}
