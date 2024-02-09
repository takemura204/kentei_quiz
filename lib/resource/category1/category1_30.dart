import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category1_30 {
  final quizItems = [
    QuizItem(
      question: 'プログラマーやデザイナーなどが集まり、限られた時間内でアイデアを出し合い、プロトタイプを作成するイベントは何か？',
      ans: 'ハッカソン',
      choices: ["ダーウィンの海", "ハッカソン", "キャズム", "イノベーションのジレンマ"],
      comment:
          "ハッカソンは、プログラマーやデザイナー、その他のクリエイティブな人材が集まり、限られた時間内でアイデアを出し合い、プロトタイプを作成するイベント。新しい技術やサービスの開発を促進する。",
    ),
    QuizItem(
      question: '問題解決やイノベーションのプロセスにおいて、ユーザー中心のアプローチを取る思考方法は何か？',
      ans: 'デザイン思考',
      choices: ["イノベーションのジレンマ", "デザイン思考", "ペルソナ法", "バックキャスティング"],
      comment:
          "デザイン思考は、創造的な問題解決のプロセスで、ユーザーのニーズや経験を深く理解し、その視点からイノベーションを生み出そうとするユーザー中心のアプローチを指す。",
    ),
    QuizItem(
      question: 'ターゲットユーザーの詳細なプロファイルを作成することで、製品やサービスの設計に役立てる手法は何か？',
      ans: 'ペルソナ法',
      choices: ["デザイン思考", "ペルソナ法", "バックキャスティング", "ビジネスモデルキャンバス"],
      comment:
          "ペルソナ法は、架空の典型的なユーザー「ペルソナ」の詳細なプロファイルを作成し、そのペルソナを基に製品やサービスの設計を行う手法。ユーザー中心の設計を促進する。",
    ),
    QuizItem(
      question: '望ましい未来の状態を設定し、その状態を実現するために現在から逆算して計画を立てる手法は何か？',
      ans: 'バックキャスティング',
      choices: ["ペルソナ法", "バックキャスティング", "ビジネスモデルキャンバス", "リーンスタートアップ"],
      comment:
          "バックキャスティングは、望ましい未来の状態を設定し、その目標を達成するために現在から必要な手順や戦略を逆算して計画を立てる手法。未来志向のアプローチを指す。",
    ),
    QuizItem(
      question: 'ビジネスの構想段階で、価値提案や顧客セグメント、収益モデルなどを体系的に整理するツールは何か？',
      ans: 'ビジネスモデルキャンバス',
      choices: ["バックキャスティング", "ビジネスモデルキャンバス", "リーンスタートアップ", "APIエコノミー"],
      comment:
          "ビジネスモデルキャンバスは、9つの構成要素（価値提案、顧客セグメント、チャネルなど）を用いてビジネスモデルを体系的に整理し、ビジネスの構想を視覚的に表現するツール。スタートアップや新事業の企画段階で広く利用される。",
    ),
    QuizItem(
      question: 'スタートアップがリソースの制約の中で製品開発を行い、顧客のフィードバックを基に継続的に製品を改善していくアプローチは何か？',
      ans: 'リーンスタートアップ',
      choices: ["ビジネスモデルキャンバス", "リーンスタートアップ", "APIエコノミー", "ベンチャーキャピタル"],
      comment:
          "リーンスタートアップは、最小限の機能を持つ製品（最小実行可能製品、MVP）を早期に市場に投入し、顧客のフィードバックを得ながら製品を継続的に改善していくアプローチ。",
    ),
    QuizItem(
      question: '第三者のアプリケーションやサービスが企業の機能やデータを利用できるようにする経済活動は何か？',
      ans: 'APIエコノミー',
      choices: ["リーンスタートアップ", "APIエコノミー", "ベンチャーキャピタル", "コーポレートベンチャーキャピタル"],
      comment:
          "APIエコノミーは、企業が提供するAPI（Application Programming Interface）を通じて、外部のアプリケーションやサービスが企業の機能やデータを利用できるようにすることで、新たな価値創造やビジネスチャンスを生み出す経済活動。",
    ),
    QuizItem(
      question: 'スタートアップや新事業に対して資金を提供し、成長を支援する投資家や投資ファンドは何というか？',
      ans: 'ベンチャーキャピタル',
      choices: ["APIエコノミー", "ベンチャーキャピタル", "コーポレートベンチャーキャピタル", "デルファイ法"],
      comment:
          "ベンチャーキャピタルは、高いリスクを伴うスタートアップや新事業に対して資金を提供し、事業の成長を支援する投資家や投資ファンドのこと。",
    ),
    QuizItem(
      question:
          '大企業が設立するベンチャーキャピタルで、社外の革新的なスタートアップに投資し、新技術やビジネスモデルの獲得を目指すものは何か？',
      ans: 'コーポレートベンチャーキャピタル',
      choices: ["ベンチャーキャピタル", "コーポレートベンチャーキャピタル", "デルファイ法", "バックキャスティング"],
      comment:
          "コーポレートベンチャーキャピタルは、大企業が設立または関与するベンチャーキャピタルで、社外の革新的なスタートアップへの投資を通じて、新技術やビジネスモデルの獲得、事業シナジーの創出を目指す。",
    ),
    QuizItem(
      question: '専門家の意見を集約し、将来の予測や意思決定を行う手法を何というか？',
      ans: 'デルファイ法',
      choices: ["コーポレートベンチャーキャピタル", "デルファイ法", "バックキャスティング", "ビジネスモデルキャンバス"],
      comment:
          "デルファイ法は、複数の専門家にアンケートを行い、その意見を集約して将来の予測や意思決定を支援する手法。匿名性を保ちながら、専門家の意見を反復的に調整し合意に至るプロセスが特徴。",
    )
  ];
  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 291);
  });
}
