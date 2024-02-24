import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category0_2 {
  final quizItems = [
    QuizItem(
      question: '著作者の作品に対する権利を保護する法律は何か？',
      ans: '著作権法',
      choices: ["著作権法", "特許法", "実用新案法", "意匠法"],
      comment: "著作権法は、文学、音楽、美術などの創作物に対して著作者に与えられる権利を保護する法律。",
    ),
    QuizItem(
      question: '発明を保護するための法律は何か？',
      ans: '特許法',
      choices: ["商標法", "著作権法", "特許法", "実用新案法"],
      comment: "特許法は、新規性、進歩性、産業上の利用可能性を有する発明に対して一定期間独占的な権利を与える法律。",
    ),
    QuizItem(
      question: 'ビジネスの方法やシステムに関する特許を何というか？',
      ans: 'ビジネスモデル特許',
      choices: ["ビジネスモデル特許", "実用新案権", "意匠権", "著作権"],
      comment: "ビジネスモデル特許は、特定のビジネス方法やシステムに関する新規性や独自性を保護する特許。",
    ),
    QuizItem(
      question: '製品の形状やデザインを保護する法律は何か？',
      ans: '意匠法',
      choices: ["実用新案法", "意匠法", "著作権法", "特許法"],
      comment: "意匠法は、製品の外観の形状、模様、色彩などのデザインを保護する法律。",
    ),
    QuizItem(
      question: '他社の商品やサービスを模倣することを防止する法律は何か？',
      ans: '不正競争防止法',
      choices: ["商標法", "著作権法", "不正競争防止法", "意匠法"],
      comment:
          "不正競争防止法は、他者の商品やサービス、商標、宣伝方法などを模倣することによる不正競争を防止し、公正な競争を保持するための法律。",
    ),
    QuizItem(
      question: '個人の情報を保護するための法律は何か？',
      ans: '個人情報保護法',
      choices: ["個人情報保護法", "サイバーセキュリティ基本法", "不正アクセス禁止法", "プロバイダ責任制限法"],
      comment: "個人情報保護法は、個人情報の適正な取り扱いや保護を規定し、個人の権利と利益を守るための法律。",
    ),
    QuizItem(
      question: '労働者を他の事業者に派遣して働かせることを規制する法律は何か？',
      ans: '労働者派遣法',
      choices: ["労働基準法", "労働契約法", "労働者派遣法", "独占禁止法"],
      comment: "労働者派遣法は、労働者を他の事業者に派遣して働かせる派遣労働に関するルールや条件を定めることで、派遣労働者の保護を図る法律。",
    ),
    QuizItem(
      question: '企業の経営構造や運営の仕組みをどのように整えるかを示す概念は何か？',
      ans: 'コーポレートガバナンス',
      choices: ["コーポレートガバナンス", "コンプライアンス", "内部統制", "ソーシャルメディアガイドライン"],
      comment: "コーポレートガバナンスは、企業が健全な経営を行い、株主や関係者の信頼を確保するための経営構造や運営の仕組みを整える概念。",
    ),
    QuizItem(
      question: '商品の識別情報を表すために使用される、バーコードの一種は何か？',
      ans: 'JANコード',
      choices: ["QRコード", "JANコード", "ISBN", "IEEE"],
      comment: "JANコードは、日本で広く使用されている商品の識別情報を表すバーコードの一種で、主に小売業で利用される。",
    ),
    QuizItem(
      question: '品質マネジメントシステムの要求事項を定めた国際標準は何か？',
      ans: 'ISO 9000',
      choices: ["ISO 9000", "ISO 14000", "ISO 26000", "ISO/IEC 27000"],
      comment:
      "ISO 9000シリーズは、組織が顧客満足を達成し、製品やサービスの品質を継続的に向上させるための品質マネジメントシステムの要求事項を定めた国際標準。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 11);
  });
}
