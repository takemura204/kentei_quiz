import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category3_12 {
  final quizItems = [
    QuizItem(
      question: '物理的なリソースを抽象化し、複数の仮想環境を作り出す技術は何か？',
      ans: '仮想化',
      choices: ["仮想化", "コンテナ化", "クラウドコンピューティング", "マイクロサービス"],
      comment: "仮想化は、物理的なリソース（サーバ、ストレージなど）を抽象化し、複数の仮想環境を作り出す技術。",
    ),
    QuizItem(
      question: '仮想マシンを実行するための環境やプラットフォームは何か？',
      ans: 'VM',
      choices: ["VM", "VDI", "コンテナ", "クラウド"],
      comment: "VM（Virtual Machine）は、仮想マシンを実行するための環境やプラットフォームを指す。",
    ),
    QuizItem(
      question: '仮想デスクトップインフラストラクチャの略で、仮想化技術を用いてユーザーのデスクトップ環境を提供するシステムは何か？',
      ans: 'VDI',
      choices: ["VDI", "VM", "NAS", "RAID"],
      comment:
          "VDI（Virtual Desktop Infrastructure）は、仮想化技術を用いてユーザーのデスクトップ環境をサーバ上で実行し、提供するシステム。",
    ),
    QuizItem(
      question: '稼働中の仮想マシンを別の物理ホストに移動させる技術は何か？',
      ans: 'ライブマイグレーション',
      choices: ["ライブマイグレーション", "スナップショット", "クローニング", "バックアップ"],
      comment: "ライブマイグレーションは、稼働中の仮想マシンをダウンタイムなしに別の物理ホストに移動させる技術。",
    ),
    QuizItem(
      question: 'システムが要求に応答するまでの時間は何と呼ばれるか？',
      ans: 'レスポンスタイム',
      choices: ["レスポンスタイム", "スループット", "ターンアラウンドタイム", "待機時間"],
      comment: "レスポンスタイムは、システムが要求に応答するまでの時間を指し、システムの応答性能を示す指標。",
    ),
    QuizItem(
      question: 'システムが単位時間あたりに処理できる仕事の量は何と呼ばれるか？',
      ans: 'スループット',
      choices: ["スループット", "レスポンスタイム", "ターンアラウンドタイム", "処理速度"],
      comment: "スループットは、システムが単位時間あたりに処理できる仕事の量を指し、システムの性能を示す重要な指標。",
    ),
    QuizItem(
      question: 'ジョブが開始されてから完了するまでの総時間は何と呼ばれるか？',
      ans: 'ターンアラウンドタイム',
      choices: ["ターンアラウンドタイム", "レスポンスタイム", "スループット", "実行時間"],
      comment: "ターンアラウンドタイムは、ジョブが開始されてから完了するまでの総時間を指し、システムの効率性を示す指標。",
    ),
    QuizItem(
      question: 'システムの性能を評価するために実行されるテストのことは何か？',
      ans: 'ベンチマーク',
      choices: ["ベンチマーク", "パフォーマンステスト", "ストレステスト", "負荷テスト"],
      comment: "ベンチマークは、システムの性能を定量的に評価するために実行されるテストで、様々な基準やワークロードを用いて性能を比較する。",
    ),
    QuizItem(
      question: 'システムが故障なしに稼働し続けることができる確率、または稼働時間の割合は何と呼ばれるか？',
      ans: '稼働率',
      choices: ["稼働率", "可用性", "信頼性", "継続性"],
      comment: "稼働率は、システムが故障なしに稼働し続けることができる確率、または稼働時間の割合を指し、システムの可用性を示す指標。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 111 + 3000);
  });
}
