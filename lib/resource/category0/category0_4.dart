import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category0_4 {
  final quizItems = [
    QuizItem(
      question: 'ソフトウェア開発において、ユーザーの要求を基に機能や性能を定義する工程を何というか？',
      ans: '外部設計',
      choices: ["外部設計", "内部設計", "コーディング", "システムテスト"],
      comment: "外部設計は、ユーザーの要求をもとにソフトウェアの機能や性能、インターフェイスなどの仕様を定める工程。",
    ),
    QuizItem(
      question: '外部設計の成果を基に、ソフトウェアの内部構造やデータモデルを設計する工程を何というか？',
      ans: '内部設計',
      choices: ["内部設計", "外部設計", "コーディング", "デバッグ"],
      comment: "内部設計は、外部設計で定められた仕様に基づいて、ソフトウェアの内部構造や動作の詳細を設計する工程。",
    ),
    QuizItem(
      question: 'プログラムの内部構造に基づいてテストを行う手法を何というか？',
      ans: 'ホワイトボックステスト',
      choices: ["ホワイトボックステスト", "ブラックボックステスト", "結合テスト", "システムテスト"],
      comment: "ホワイトボックステストは、プログラムの内部構造やロジックを理解し、その知識に基づいてテストを行う手法。",
    ),
    QuizItem(
      question: 'ソフトウェアテストの手法の一つで、内部構造を見ずに、入力と出力のみをテストする方法を何というか？',
      ans: 'ブラックボックステスト',
      choices: ["ブラックボックステスト", "ホワイトボックステスト", "単体テスト", "結合テスト"],
      comment: "ブラックボックステストは、ソフトウェアの内部構造や動作原理には着目せず、入力と出力のみを基にテストを行う方法。",
    ),
    QuizItem(
      question: '複数のソフトウェアモジュールを組み合わせ、それらが連携して正しく動作するかを検証するテストを何というか？',
      ans: '結合テスト',
      choices: ["結合テスト", "単体テスト", "システムテスト", "運用テスト"],
      comment: "結合テストは、複数のソフトウェアモジュールを組み合わせ、それらが連携して正しく動作するかを検証するテスト。",
    ),
    QuizItem(
      question: 'ソフトウェアが全体として要件を満たしているかを検証するテストを何というか？',
      ans: 'システムテスト',
      choices: ["システムテスト", "単体テスト", "結合テスト", "運用テスト"],
      comment: "システムテストは、ソフトウェアや情報システムが全体として要件を満たしているかを検証するテスト。",
    ),
    QuizItem(
      question: 'ソフトウェアが運用されている間、問題の修正や機能の追加などを行う活動を何というか？',
      ans: 'ソフトウェア保守',
      choices: ["ソフトウェア保守", "ソフトウェア開発", "ソフトウェア導入", "システムテスト"],
      comment: "ソフトウェア保守は、ソフトウェアが運用されている間に発生する問題の修正や機能の更新、性能の向上などを行う活動。",
    ),
    QuizItem(
      question:
          'ソフトウェア開発のパラダイムで、データとそのデータに関連する操作をひとまとめにした「オブジェクト」を基本的な構成要素とする手法は何か？',
      ans: 'オブジェクト指向',
      choices: ["オブジェクト指向", "プロセス中心アプローチ", "データ中心アプローチ", "UML"],
      comment:
          "オブジェクト指向は、データ（属性）とそのデータに対する操作（メソッド）をひとまとめにしたオブジェクトを基本的な構成要素とするソフトウェア開発の手法。",
    ),
    QuizItem(
      question: '情報システム開発におけるプロジェクトの進め方やシステムのライフサイクルなどを体系的にまとめたガイドラインを何というか？',
      ans: '共通フレーム',
      choices: ["共通フレーム", "CMMI", "スクラム", "アジャイル"],
      comment: "共通フレームは、情報システム開発に関する工程や成果物、用語などを標準化し、体系的にまとめたガイドラインのこと。",
    ),
    QuizItem(
      question: '組織の情報システムの管理と運用が適切かどうかを評価するための独立した検証活動を何というか？',
      ans: 'システム監査',
      choices: ["システム監査", "リスクアセスメント", "コンプライアンスチェック", "セキュリティ評価"],
      comment:
          "システム監査は、組織の情報システムの管理と運用が企業の方針、目標、法令等に適切に準拠しているかを独立した立場から評価する活動。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 31, isPremium: false);
  });
}
