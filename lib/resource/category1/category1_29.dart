import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category1_29 {
  final quizItems = [
    QuizItem(
      question: '企業が市場や顧客からのフィードバックを活用してイノベーションを起こす方法を何というか？',
      ans: 'MOT',
      choices: ["MOT", "POT", "LOT", "NOT"],
      comment:
          "MOT（Moment of Truth）は、企業が市場や顧客との接点（真実の瞬間）で得たフィードバックを活用し、製品やサービスのイノベーションを起こす方法。",
    ),
    QuizItem(
      question: '組織の業務プロセスを根本的に見直し、効率化や効果の向上を図るイノベーションを何というか？',
      ans: 'プロセスイノベーション',
      choices: ["プロセスイノベーション", "プロダクトイノベーション", "プロジェクトイノベーション", "プログラムイノベーション"],
      comment: "プロセスイノベーションは、組織の業務プロセスを根本的に見直し、効率化や効果の向上を図るためのイノベーション。",
    ),
    QuizItem(
      question: '新しい製品やサービスを開発し、市場に導入することによるイノベーションを何というか？',
      ans: 'プロダクトイノベーション',
      choices: ["プロセスイノベーション", "プロダクトイノベーション", "プロジェクトイノベーション", "プログラムイノベーション"],
      comment: "プロダクトイノベーションは、新しい製品やサービスを開発し、市場に導入することによるイノベーション。",
    ),
    QuizItem(
      question: '将来の技術開発の方向性や目標を示し、イノベーションの計画を立てるために使用されるツールを何というか？',
      ans: '技術ロードマップ',
      choices: ["技術ロードマップ", "技術ナビゲーション", "技術パスウェイ", "技術ブループリント"],
      comment: "技術ロードマップは、将来の技術開発の方向性や目標を示し、イノベーションの計画を立てるために使用されるツール。",
    ),
    QuizItem(
      question: '外部のアイデアや技術を積極的に取り入れ、自社のイノベーションを加速させる手法を何というか？',
      ans: 'オープンイノベーション',
      choices: [
        "オープンイノベーション",
        "オープンソースイノベーション",
        "オープンマインドイノベーション",
        "オープンフィールドイノベーション"
      ],
      comment: "オープンイノベーションは、外部のアイデアや技術を積極的に取り入れることにより、自社のイノベーションを加速させる手法。",
    ),
    QuizItem(
      question: 'イノベーションの過程で遭遇する、技術開発の初期段階における困難を何というか？',
      ans: '魔の川',
      choices: ["オープンイノベーション", "魔の川", "死の谷", "ダーウィンの海"],
      comment:
          "魔の川は、イノベーションの過程で遭遇する可能性のある、技術開発の初期段階における困難や障害を指す比喩的表現。資金調達やリソースの不足などが原因でプロジェクトが停滞するリスクを指す。",
    ),
    QuizItem(
      question: '技術開発が一定の段階を超えた後に直面する、商業化までの資金繰りや市場導入の難しさを指す言葉は何か？',
      ans: '死の谷',
      choices: ["魔の川", "死の谷", "ダーウィンの海", "ハッカソン"],
      comment:
          "死の谷は、技術開発がある程度進行した後に直面する、商業化のための資金繰りや市場導入の難しさを表す比喩的な表現。多くのスタートアップがこの段階で挫折する。",
    ),
    QuizItem(
      question: 'イノベーションの過程で、成功した技術や製品が広く普及し、市場を席巻する状態を指す言葉は何か？',
      ans: 'ダーウィンの海',
      choices: ["死の谷", "ダーウィンの海", "ハッカソン", "キャズム"],
      comment:
          "ダーウィンの海は、イノベーションの過程で、成功した技術や製品が広く普及し、市場を席巻する状態を指す比喩的な表現。生き残ったイノベーションが強く進化し、市場で成功を収める様子を表す。",
    ),
    QuizItem(
      question: '既存のビジネスモデルが新しい技術や市場の変化によって脅かされる状況を指す言葉は何か？',
      ans: 'イノベーションのジレンマ',
      choices: ["キャズム", "イノベーションのジレンマ", "デザイン思考", "ペルソナ法"],
      comment:
          "イノベーションのジレンマは、既存の成功しているビジネスモデルが新しい技術や市場の変化によって脅かされ、適応できない状況を指す。この概念はクレイトン・クリステンセンによって提唱された。",
    ),
    QuizItem(
      question: 'イノベーションが普及する過程で生じる、早期採用者と初期大衆の間のギャップを何というか？',
      ans: 'キャズム',
      choices: ["ハッカソン", "キャズム", "イノベーションのジレンマ", "デザイン思考"],
      comment:
          "キャズムは、新技術や製品の市場普及の過程で、早期採用者と初期大衆の間に生じる採用のギャップを指す。このギャップを超えることがイノベーションの成功には重要。",
    ),
  ];
  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 281);
  });
}