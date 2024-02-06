import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category1_1 {
  final quizItems = [
    QuizItem(
      question: '企業の基本的な価値観や信念を示すものを何というか？',
      ans: '経営理念',
      choices: ["経営戦略", "経営理念", "企業倫理", "組織文化"],
      comment: "経営理念は、企業がどのような価値を提供し、どのような存在でありたいかを示す基本的な信念や考え方。",
    ),
    QuizItem(
      question: '企業の利害関係者を総称して何というか？',
      ans: 'ステークホルダー',
      choices: ["シェアホルダー", "ステークホルダー", "パートナー", "顧客"],
      comment: "ステークホルダーは、企業活動に影響を受ける、または影響を与える全ての個人や団体を指す。",
    ),
    QuizItem(
      question: '企業の総合的なイメージや価値を表すものを何というか？',
      ans: 'コーポレートブランド',
      choices: ["製品ブランド", "サービスブランド", "コーポレートブランド", "パーソナルブランド"],
      comment: "コーポレートブランドは企業そのもののブランドであり、その企業が提供する価値や信頼性を消費者に伝える。",
    ),
    QuizItem(
      question: '計画、実行、評価、改善のサイクルを何というか？',
      ans: 'PDCA',
      choices: ["PDCA", "SWOT", "KPI", "MBO"],
      comment: "PDCAサイクルは、組織のプロセスやシステムの継続的な改善を促進する手法。",
    ),
    QuizItem(
      question: '目標設定に基づく経営手法を何というか？',
      ans: 'MBO',
      choices: ["MBO", "CEO", "COO", "CIO"],
      comment: "MBOは、上司と部下が共同で目標を設定し、その達成を目指す経営手法。",
    ),
    QuizItem(
      question: '人材管理を意味する用語は何か？',
      ans: 'HRM',
      choices: ["HRM", "CRM", "PRM", "ERM"],
      comment: "HRMは、従業員の採用、育成、評価、報酬などを総合的に管理するプロセス。",
    ),
    QuizItem(
      question: '仕事と私生活の調和を指す用語は何か？',
      ans: 'ワークライフバランス',
      choices: ["ワークシェアリング", "タイムマネジメント", "ワークライフバランス", "テレワーク"],
      comment: "ワークライフバランスは、仕事と私生活の間の健全なバランスを維持することを指す。",
    ),
    QuizItem(
      question: '多様性を尊重する経営姿勢を何というか？',
      ans: 'ダイバーシティ',
      choices: ["ユニフォーミティ", "ダイバーシティ", "コンフォーミティ", "セグメンテーション"],
      comment: "ダイバーシティは、性別、人種、宗教、年齢など様々な背景を持つ人々を受け入れ、尊重する経営姿勢。",
    ),
    QuizItem(
      question: '組織内の才能を発見し、育成する過程を何というか？',
      ans: 'タレントマネジメント',
      choices: ["スキルマネジメント", "パフォーマンスマネジメント", "タレントマネジメント", "リーダーシップマネジメント"],
      comment: "タレントマネジメントは、組織内の才能を識別し、育成し、適切に活用する過程。",
    ),
    QuizItem(
      question: '従業員が仕事に対して高い熱意を持つ状態を何というか？',
      ans: 'ワークエンゲージメント',
      choices: ["ワークライフバランス", "ワークプレイスハーモニー", "ワークエンゲージメント", "ワークイーサン"],
      comment: "ワークエンゲージメントは、従業員が仕事に熱心であり、積極的に取り組む状態を指す。",
    ),
  ];

  // quizId を自動的に割り当て
  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 1);
  });
}