import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'mission.dart';
import 'missions.dart';

part 'missions_resorce.dart';

final missionModelProvider =
    StateNotifierProvider<MissionModel, Missions>((ref) => MissionModel(ref));

class MissionModel extends StateNotifier<Missions> with LocatorMixin {
  MissionModel(this.ref) : super(Missions()) {
    () async {
      await initState();
    }();
  }

  final Ref ref;
  final _auth = FirebaseAuth.instance;
  //初期ミッション
  List<Mission> get defaultMissions => [
        defaultMission1,
        defaultMission2,
        defaultMission3,
        randomMission1[state.mission1Index],
        randomMission2[state.mission2Index],
      ];

  CollectionReference<Mission> get _missionsRef => FirebaseFirestore.instance
      .collection('score')
      .doc(_auth.currentUser?.uid)
      .collection('missions')
      .withConverter(
        fromFirestore: (snapshot, _) => Mission.fromDocumentSnapshot(snapshot),
        toFirestore: (Mission mission, _) =>
            mission.toJsonWithoutUnnecessaryFields(),
      );

  @override
  Future initState() async {
    state = state.copyWith(isLoading: true);
    _loadMissions().then((_) {
      state = state.copyWith(isLoading: false);
    });
    super.initState();
  }

  ///Missionデータ読み込み
  Future _loadMissions() async {
    try {
      final getMissions = await _getMissions(); //Firestoreから取得

      // データが存在しない場合
      if (getMissions.isEmpty) {
        state = state.copyWith(missions: defaultMissions);
        _saveMissions(defaultMissions);
      }
      //データが存在している場合
      else {
        final updatedMissions = _updateMissions(getMissions);
        //createdAtが今日の日付でない場合
        state = state.copyWith(missions: updatedMissions);
        if (!_isSameDay(getMissions[0].updatedAt!, DateTime.now())) {
          _saveMissions(updatedMissions);
        }
      }
      print({"Success：_loadMissions", state.missions.last.updatedAt});
    } catch (e, s) {
      print({e, s, "Error：_loadMissions"});
    }
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  ///ミッション取得
  Future<List<Mission>> _getMissions() async {
    try {
      final snapshots = await _missionsRef.get();
      return snapshots.docs.map((doc) => doc.data()).toList();
    } on Exception catch (e, s) {
      print({e, s, 'Error：_getMissions'});
      rethrow;
    }
  }

  ///ミッション作成
  Future _saveMissions(List<Mission> missions) async {
    try {
      for (var mission in missions) {
        final saveMission =
            mission.copyWith(isReceived: false, updatedAt: DateTime.now());
        final doc = _missionsRef.doc(mission.missionId.toString());
        await doc.set(saveMission, SetOptions(merge: true));
      }
    } on Exception catch (e, s) {
      print({'Error：_saveMissions', e, s});
      rethrow;
    }
  }

  ///ミッション更新
  List<Mission> _updateMissions(List<Mission> missions) {
    final List<Mission> updatedMissions = [];

    for (var mission in missions) {
      final matchMission = defaultMissions.firstWhere(
          (defaultMission) => defaultMission.missionId == mission.missionId,
          orElse: () => defaultMission1);

      updatedMissions.add(Mission(
        docId: mission.docId,
        missionId: mission.missionId,
        title: matchMission.title,
        point: matchMission.point,
        isReceived: mission.isReceived,
        updatedAt: DateTime.now(),
      ));
    }
    return updatedMissions;
  }

  ///ミッション報酬受け取り
  Future receiveMission(Mission mission) async {
    try {
      final receivedMission =
          mission.copyWith(isReceived: true, updatedAt: DateTime.now());
      final doc = _missionsRef.doc(mission.missionId.toString());
      await doc.set(receivedMission, SetOptions(merge: true));
      final receivedMissions = state.missions.map((e) {
        if (e.missionId == mission.missionId) {
          return receivedMission;
        }
        return e;
      }).toList();
      state = state.copyWith(missions: receivedMissions);
    } on Exception catch (e, s) {
      print({'Error：receiveMission', e, s});
      rethrow;
    }
  }

  Future shuffleMission1Index() async {
    final missions = randomMission1;
    final currentMission1Index = state.mission1Index;
    final otherMissions = List.from(missions);
    otherMissions.removeAt(currentMission1Index);
    final randomIndex = Random().nextInt(otherMissions.length);
    final newMission1Index = missions.indexOf(otherMissions[randomIndex]);
    state = state.copyWith(mission1Index: newMission1Index);
    _loadMissions();
  }

  Future shuffleMission2Index() async {
    final missions = randomMission2;
    final currentMission2Index = state.mission2Index;
    final otherMissions = List.from(missions);
    otherMissions.removeAt(currentMission2Index);
    final randomIndex = Random().nextInt(otherMissions.length);
    final newMission2Index = missions.indexOf(otherMissions[randomIndex]);
    state = state.copyWith(mission2Index: newMission2Index);
    _loadMissions();
  }
}
