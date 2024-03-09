import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category0_8 {
  final quizItems = [
    QuizItem(
      question: 'より多くのデバイスをインターネットに接続するために設計された新しいIPアドレス体系は何か？',
      ans: 'IPv6',
      choices: ["IPv6", "IPアドレス", "サブネットマスク", "DNS"],
      comment:
          "IPv6（Internet Protocol version 6）は、より多くのデバイスをインターネットに接続するために設計された新しいIPアドレス体系。",
    ),
    QuizItem(
      question: '電子メールで、メッセージのコピーを受信者に送ることを示す略語は何か？',
      ans: 'cc',
      choices: ["cc", "bcc", "同報メール", "メーリングリスト"],
      comment: "cc（carbon copy）は、電子メールで、メッセージのコピーを受信者に送ることを示す略語。",
    ),
    QuizItem(
      question: '電子メールで、他の受信者には見えない形でメッセージのコピーを送ることを示す略語は何か？',
      ans: 'bcc',
      choices: ["bcc", "cc", "同報メール", "メーリングリスト"],
      comment:
          "bcc（blind carbon copy）は、電子メールで、他の受信者には見えない形でメッセージのコピーを送ることを示す略語。",
    ),
    QuizItem(
      question: 'ウェブサイトがユーザーのブラウザに保存する小さなデータファイルは何か？',
      ans: 'cookie',
      choices: ["cookie", "CGI", "CMS", "MIME"],
      comment:
          "cookieは、ウェブサイトがユーザーのブラウザに保存する小さなデータファイルで、ユーザーの設定やログイン情報などを記憶するために使用される。",
    ),
    QuizItem(
      question: 'ウェブフィードを使用して、ウェブサイトの更新情報を自動的に配信するためのフォーマットは何か？',
      ans: 'RSS',
      choices: ["RSS", "MIME", "CMS", "CGI"],
      comment:
          "RSS（Really Simple Syndication）は、ウェブフィードを使用して、ウェブサイトの更新情報を自動的に配信するためのフォーマット。",
    ),
    QuizItem(
      question: '人の心理や行動の弱点を利用して情報を盗み出す詐術は何というか？',
      ans: 'ソーシャルエンジニアリング',
      choices: ["ソーシャルエンジニアリング", "クラッキング", "盗み見", "ビジネスメール詐欺"],
      comment: "ソーシャルエンジニアリングは、人間の心理や行動の弱点を利用して、パスワードや機密情報を不正に入手する詐術。",
    ),
    QuizItem(
      question: '自動的に他のコンピュータを攻撃するために制御される不正プログラムは何か？',
      ans: 'ボット',
      choices: ["ボット", "マルウェア", "ダークウェブ", "スパイウェア"],
      comment:
          "ボットは、自動的に他のコンピュータを攻撃するために遠隔操作される不正プログラムのことで、ボットネットの一部として機能することが多い。",
    ),
    QuizItem(
      question: 'ウェブアプリケーションにおいて、悪意のあるスクリプトを埋め込むことで他のユーザーを攻撃する手法は何か？',
      ans: 'クロスサイトスクリプティング',
      choices: [
        "クロスサイトスクリプティング",
        "クロスサイトリクエストフォージェリ",
        "クリックジャッキング",
        "ドライブバイダウンロード"
      ],
      comment:
          "クロスサイトスクリプティング（XSS）は、ウェブアプリケーションにおいて、悪意のあるスクリプトを埋め込むことで他のユーザーを攻撃する手法。",
    ),
    QuizItem(
      question: '複数のボットネットを使用してサービスを停止させる攻撃は何か？',
      ans: 'DDoS攻撃',
      choices: ["DDoS攻撃", "DoS攻撃", "クリプトジャッキング", "標的型攻撃"],
      comment:
          "DDoS攻撃（Distributed Denial of Service Attack）は、複数のボットネットを使用して大量の通信を送りつけ、サービスを停止させる攻撃。",
    ),
    QuizItem(
      question: '正規のウェブサイトや電子メールを偽装して個人情報を盗み出そうとする詐欺は何か？',
      ans: 'フィッシング',
      choices: ["フィッシング", "やり取り型攻撃", "水飲み場型攻撃", "ワンクリック詐欺"],
      comment:
          "フィッシングは、正規のウェブサイトや電子メールを偽装し、ユーザーにログイン情報やクレジットカード情報などの個人情報の入力を促して盗み出そうとする詐欺。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 71, isPremium: false);
  });
}
