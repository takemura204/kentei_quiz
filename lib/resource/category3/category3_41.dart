import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category3_41 {
  final quizItems = [
    QuizItem(
      question: '物理的または論理的な改ざんから保護されたシステムの特性は何か？',
      ans: '耐タンパ性',
      choices: ["耐タンパ性", "セキュアブート", "TPM", "PCI DSS"],
      comment: "耐タンパ性は、物理的または論理的な改ざんからデバイスやシステムを保護するための特性または能力。",
    ),
    QuizItem(
      question: 'システムが信頼できるソフトウェアからのみ起動することを保証するプロセスは何か？',
      ans: 'セキュアブート',
      choices: ["セキュアブート", "耐タンパ性", "TPM", "PCI DSS"],
      comment:
          "セキュアブートは、コンピュータが信頼できるソフトウェア、例えば正規のオペレーティングシステムからのみ起動することを保証するセキュリティプロセス。",
    ),
    QuizItem(
      question: 'ハードウェアベースのセキュリティ機能を提供するマイクロコントローラは何か？',
      ans: 'TPM',
      choices: ["TPM", "セキュアブート", "耐タンパ性", "PCI DSS"],
      comment:
          "TPM（Trusted Platform Module）は、パスワード、証明書、暗号キーなどのセキュリティ関連の情報を安全に保存し、ハードウェアベースのセキュリティ機能を提供するマイクロコントローラ。",
    ),
    QuizItem(
      question: 'クレジットカード情報の安全な取り扱いを定める国際的なセキュリティ基準は何か？',
      ans: 'PCI DSS',
      choices: ["PCI DSS", "TPM", "セキュアブート", "耐タンパ性"],
      comment:
          "PCI DSS（Payment Card Industry Data Security Standard）は、クレジットカード情報の安全な取り扱いを定める国際的なセキュリティ基準。",
    ),
    QuizItem(
      question: '未使用の文書やメディアを机の上に放置しないことを奨励するポリシーは何か？',
      ans: 'クリアデスク',
      choices: ["クリアデスク", "クリアスクリーン", "共通鍵暗号方式", "公開鍵暗号方式"],
      comment: "クリアデスクポリシーは、機密性の高い文書やメディアを机の上に放置せず、適切に保管することを奨励するセキュリティポリシー。",
    ),
    QuizItem(
      question: '退席時にコンピュータの画面をロックするなど、情報漏洩を防ぐためのポリシーは何か？',
      ans: 'クリアスクリーン',
      choices: ["クリアスクリーン", "クリアデスク", "共通鍵暗号方式", "公開鍵暗号方式"],
      comment:
          "クリアスクリーンポリシーは、退席時にコンピュータの画面をロックするなどして、画面上の情報が他人に見られることを防ぐためのセキュリティポリシー。",
    ),
    QuizItem(
      question: '暗号化と復号に同じ鍵を使用する暗号方式は何か？',
      ans: '共通鍵暗号方式',
      choices: ["共通鍵暗号方式", "公開鍵暗号方式", "ハイブリッド暗号方式", "WPA2"],
      comment: "共通鍵暗号方式（対称鍵暗号方式）は、暗号化と復号に同じ鍵を使用する暗号方式。鍵の配送と管理が課題となる。",
    ),
    QuizItem(
      question: '暗号化には公開鍵、復号には秘密鍵を使用する暗号方式は何か？',
      ans: '公開鍵暗号方式',
      choices: ["公開鍵暗号方式", "共通鍵暗号方式", "ハイブリッド暗号方式", "WPA2"],
      comment:
          "公開鍵暗号方式（非対称鍵暗号方式）は、暗号化に公開鍵を、復号には対応する秘密鍵を使用する暗号方式。公開鍵は公開され、秘密鍵は所有者のみが保持する。",
    ),
    QuizItem(
      question: '共通鍵暗号方式と公開鍵暗号方式を組み合わせて使用する暗号方式は何か？',
      ans: 'ハイブリッド暗号方式',
      choices: ["ハイブリッド暗号方式", "公開鍵暗号方式", "共通鍵暗号方式", "WPA2"],
      comment:
          "ハイブリッド暗号方式は、共通鍵暗号方式の効率性と公開鍵暗号方式の鍵配送の安全性を組み合わせた暗号方式。実際にデータを暗号化する共通鍵を公開鍵暗号方式で安全に交換する。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 401 + 3000);
  });
}
