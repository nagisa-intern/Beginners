-- +migrate Up

CREATE TABLE beginners.comics(
  id      INT           NOT NULL  COMMENT '作品ID'  PRIMARY KEY,
  title   VARCHAR(255)  NOT NULL  COMMENT '作品タイトル',
  summary Text          NOT NULL  COMMENT '作品説明文'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='作品一覧';

CREATE TABLE beginners.authors(
  id    INT           NOT NULL  COMMENT '作者ID'  PRIMARY KEY,
  name  VARCHAR(255)  NOT NULL  COMMENT '作者名',
  info  Text          NOT NULL  COMMENT '作者紹介文'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='作者一覧';

CREATE TABLE beginners.comic_data(
  id        INT           NOT NULL  COMMENT '作品データid'  PRIMARY KEY,
  comic_id  INT           NOT NULL  COMMENT '作品id',
  title     VARCHAR(255)  NOT NULL  COMMENT '作品データタイトル',
  episode   INT           NOT NULL  COMMENT '話数',
  FOREIGN KEY(comic_id)   REFERENCES comics(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='作品データ';

CREATE TABLE beginners.comic_author(
  comic_id  INT NOT NULL  COMMENT '作品id',
  author_id INT NOT NULL  COMMENT '作者id',
  FOREIGN KEY(comic_id)   REFERENCES comics(id),
  FOREIGN KEY(author_id)  REFERENCES authors(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='作品と作者の中間テーブル';


INSERT INTO beginners.comics (
  id,
  title,
  summary
) VALUES (
  1,
  "電波青年",
  "ある夜、逃亡中の殺人犯・瀬良不二夫は泣きながらデリヘルを呼ぶ。現れたデリヘル嬢・伊丹洋子は、彼の個人ラジオ「フジオのラジオ」の大ファンで、彼の正体に気付いてしまいーー。WEBラジオによって結びつけられた、笑わせることに飢えたDJとリスナー。二人の歪んだ秘密の逃避行が始まる……。"
);

INSERT INTO beginners.comics (
  id,
  title,
  summary
) VALUES (
  2,
  "ワンダーリングアラウンドプリズナー",
  "明治24年、日本政府は、北の大地で通称“囚人道路”と呼ばれる国家計画を行った。ある日、ロシアから炭疽菌に覆われた死体が漂着。首相以下上層部数名は、大国の細菌兵器を恐れ、ある極秘計画を密行。その折、ロシア皇太子が日本人警官に襲われる'大津事件'が勃発……網走監獄を舞台に、極秘実験がとんでもないモンスターを生み出す!?"
);

INSERT INTO beginners.comics (
  id,
  title,
  summary
) VALUES (
  3,
  "標本のイデア",
  "5回目の結婚記念日を迎える前日、妻が消えたーー。人口増加で人の主食が昆虫となった大食糧難の時代。'神の国'神モルタの教会には、救いを求めて人々が列を為す。教会の裏側には'洗礼'を受けた者しか立ち入れない'聖域'があった。記者のウォルターは妻を探すため、それに手を伸ばす……。そこで彼が知る世界の真実とはーー。"
);

INSERT INTO beginners.comics (
  id,
  title,
  summary
) VALUES (
  4,
  "神様の思し召し",
  "天界の新米役人の陣内くんは神様たちの点呼係。未熟で色衣を着られない。なのに、下界に降りた勝手気ままな幸福の女神・吉祥天様の担当にされてしまい、先輩から神様の取り扱い説明書を渡されたのだがーー。下界を見守る神様たちとそれを裏で支える天界の新米役人の孤軍奮闘コメディ!!"
);

INSERT INTO beginners.comics (
  id,
  title,
  summary
) VALUES (
  5,
  "アンパンメン",
  "相川コウジは小さなベンチャー企業の社長。投資家から見放され、友人たちが順調な人生を歩む中、トラックにハネられる。気がつくとそこには、刀に着物、ちょんまげ姿の武士たちが……。タイムスリップした先は明治時代。ここで彼はある男と出会い「アンパン」を売ることにーー?! 旧時代で未来を切り開く、超異色の起業家ストーリー開幕！"
);

INSERT INTO beginners.comics (
  id,
  title,
  summary
) VALUES (
  6,
  "オンラインの羊たち",
  "1999年片田舎。3人の中学生男女は、誰にも知られることなく発信できる新たなツールを手に入れた。密かに始まるオンラインの青春。ネット時代の新感覚ノスタルジックストーリー！"
);

INSERT INTO beginners.comics (
  id,
  title,
  summary
) VALUES (
  7,
  "マグネット島通信",
  "磁辺島に移住してきたタイ語翻訳者・本山田。彼を待っていたのは、都会に憧れる人懐っこい島娘。憧れのロハスな生活から一転、空から降ってきた金属片により、島の大きな“秘密”が徐々に明らかに――!?『片隅乙女ワンスモア』『人魚姫の水族館』の伊藤正臣が紡ぐ、新感覚アイランドストーリー!!"
);

INSERT INTO beginners.comics (
  id,
  title,
  summary
) VALUES (
  8,
  "のんびりヌルントゥルン",
  "海、太陽、戦闘機、この景色が私の故郷なんだよ――沖縄に撮影でやってきた、新米カメラマンの大山もりみちは、師匠の無茶振りで長期取材し、オバァと出会うーー。沖縄地元民たちとの触れ合いから沖縄の今昔を見つける！ 『うきわ』『満月エンドロール』の野村宗弘が贈る渾身作‼︎"
);

INSERT INTO beginners.comics (
  id,
  title,
  summary
) VALUES (
  9,
  "アルキメデスのお風呂",
  "弁当屋の店員でぽっちゃり女子の原陽子は駅構内で自殺を図る。そこへ陽子のバイト先を訪れていた超ド級理系男子の大池学が通りかかり間一髪救助！ 一目惚れする陽子だが、大池が助けた理由は人命よりも他にあったようで……。第16回文化庁メディア芸術祭マンガ部門審査委員会推薦作品『ナガサレール イエタテール』、『ニコニコ妖画』、『わたしのお婆ちゃん』のニコ・ニコルソンが描く、超理系素粒子級ラブコメ!!"
);

INSERT INTO beginners.comics (
  id,
  title,
  summary
) VALUES (
  10,
  "クランクUP!!",
  "ゲーム業界への就職を諦めた女性ゲーマーの城宮区藍（クラン）は、某有名ゲーム雑誌の元編集長に連れられ、ゲーマーの聖地「８４」を訪れる。そこで、'実在する'ゲームクリエイターらと出会い、クリエイターの本質を知っていくーーフィクションとリアルが融合する新感覚ゲーマー物語開幕‼︎"
);

INSERT INTO beginners.comics (
  id,
  title,
  summary
) VALUES (
  11,
  "GATO -ゼロイチの戦場-",
  "サークル活動でサイパンに向かった大学生の羽場涼介たちは、戦争の過酷さを体感できるVR装置を身につけ、仮想現実へとダイブする。本物と見紛う迫力に圧倒される中で、涼介は自分たちを見つめる視線を感じて……。大戦ロマンの旗手が切り拓く、虚構と現実の狭間を描いた新時代仮想戦記、開戦‼︎"
);

INSERT INTO beginners.comics (
  id,
  title,
  summary
) VALUES (
  12,
  "ボストーク",
  "ロシアがまだソビエトだった頃、ユーリは誰もが見上げる「宇宙」を目指す。時代が求める、英雄となるために……。そして、同じ志を持ったゲルマンとの出会いが、人類の宇宙史を大きく動かしていく！ 「地球は青かった。」ーー人類初の有人宇宙飛行に挑んだ男たちを描くヒューマンドラマ、開演！！"
);

INSERT INTO beginners.comics (
  id,
  title,
  summary
) VALUES (
  13,
  "霊能探偵事件簿",
  "引っ越し祝いにケーキを食べようとしていた大学生・女金 駆（めがね かける）の目の前に、突如女性の幽霊が現れる。幽霊事件を担当する探偵・真零源 翔（しんれいげん しょう）へ除霊を依頼するも、どうやら彼はインチキ探偵のようでーー。ボケとツッコミが溢れて止まらない、痛快ギャグ漫画！"
);

INSERT INTO beginners.comics (
  id,
  title,
  summary
) VALUES (
  14,
  "レオの柩",
  "世界有数のバックギャモンプレイヤー 速水翆は、空港で“賭けギャモン”をする少女 三浦レオと出会う。危険な戦法でプレイするレオに魅せられた速水は、“賭けギャモン”で彼女に挑み……。「バックギャモンは運のゲームではない」ーー魔力を象徴する盤上で描かれるヒューマンゲーム、スタート‼︎"
);

INSERT INTO beginners.comics (
  id,
  title,
  summary
) VALUES (
  15,
  "21世紀坊っちゃん's",
  "ーキヨ、お前以外に心許せる友達なんか持ったことないのに、大丈夫かよ俺。
夏目漱石が描く名作『坊っちゃん』を、講談社漫画賞受賞作家・逢坂みえこ氏が、現代の大学を舞台に漫画化
お馴染みのキヨを始め、寮生の山嵐や赤シャツ先輩たちが登場し、無鉄砲な主人公・坊っちゃんが織り成す青春群像劇。"
);

INSERT INTO beginners.comics (
  id,
  title,
  summary
) VALUES (
  16,
  "ビックリビッグ",
  "植物を巨大化できる肥料”ビックリビッグ”の開発に成功した学生・きな子。この偉大な開発に学校中が喜んだのも束の間、町の動物たちが巨大化していて大騒ぎ！薬は植物しか巨大化できないはずなのに。これはきな子の開発ミス？それとも誰かの陰謀ーー？町を救うべく、きな子が真相に迫る!"
);

INSERT INTO beginners.comics (
  id,
  title,
  summary
) VALUES (
  17,
  "微分、積分、世界の終わり",
  "天才博士を母に持つ男子学生のヨナは、微分積分が理解できず母に”次元”についてのレッスンを受ける。ヨナのために母が発明した”イージー次元イジリ機”が、世界を別次元へと誘ってーー。現役理系学生の芦藻氏が描く、すこしふしぎな短編読み切り作品！！"
);


INSERT INTO beginners.authors (
  id,
  name,
  info
) VALUES (
  "1",
  "安田佳澄",
  "ヘロヘロの20代です。自分には分不相応な場所で分不相応な漫画を描いています。"
);

INSERT INTO beginners.authors (
  id,
  name,
  info
) VALUES (
  "2",
  "械依ゆう",
  "初めまして。今作を通して出会った皆様に恩返しできるよう頑張ります。よろしくお願いします！"
);

INSERT INTO beginners.authors (
  id,
  name,
  info
) VALUES (
  "3",
  "河原映里",
  "元々は「河田映介」というペンネームでした。おじさんを描くのが苦手なのに漫画におじさんばかり出てきます。"
);

INSERT INTO beginners.authors (
  id,
  name,
  info
) VALUES (
  "4",
  "山本なぎさ",
  "作り置きのためにごはんを多めに作っても、一度で食べきってしまいます。
人生は計画的に頑張ります。"
);

INSERT INTO beginners.authors (
  id,
  name,
  info
) VALUES (
  "5",
  "内田麻美",
  "100キロまでなら徒歩で行けます。よろしくおねがいします。"
);

INSERT INTO beginners.authors (
  id,
  name,
  info
) VALUES (
  "6",
  "詩原ヒロ",
  "山形県出身。第1回即日新人賞で『モーニング・ツー』大賞受賞。ゆとり第一世代です。よろしくお願いします。"
);

INSERT INTO beginners.authors (
  id,
  name,
  info
) VALUES (
  "7",
  "伊藤正臣",
  "過去作に「片隅乙女ワンスモア」「タネも仕掛けもないラブストーリー」など。
水を描くのが大好きです。"
);

INSERT INTO beginners.authors (
  id,
  name,
  info
) VALUES (
  "8",
  "野村宗弘",
  "協力してくださった沖縄のおっちゃんやら姉様方、がんばりまーす。"
);

INSERT INTO beginners.authors (
  id,
  name,
  info
) VALUES (
  "9",
  "ニコ・ニコルソン",
  "16回文化庁メディア芸術祭マンガ部門審査委員会推薦作品『ナガサレール イエタテール』、『ニコニコ妖画』、『わたしのお婆ちゃん』のニコ・ニコルソンが描く、超理系素粒子級ラブコメ!!"
);

INSERT INTO beginners.authors (
  id,
  name,
  info
) VALUES (
  "10",
  "大関詠嗣",
  "ゲームが好きが高じて漫画を描く機会を頂けました、大関詠嗣です。皆様よろしくお願いいたします。"
);

INSERT INTO beginners.authors (
  id,
  name,
  info
) VALUES (
  "11",
  "須本壮一",
  "アナログ漫画家35年生ついにデジタル世界へ！優しく見守ってね"
);

INSERT INTO beginners.authors (
  id,
  name,
  info
) VALUES (
  "12",
  "鳥維そうし",
  ""
);

INSERT INTO beginners.authors (
  id,
  name,
  info
) VALUES (
  "13",
  "菊地大吾",
  "自分でも予想外の受賞でとてもうれしいです。この結果で満足せず、次に繋げられるよう頑張ります。また皆さんに読んでもらえるような漫画を作りますので、よろしくお願い致します。"
);

INSERT INTO beginners.authors (
  id,
  name,
  info
) VALUES (
  "14",
  "くさか里樹",
  "「鼻息も荒くペダルを踏んでる割には空回って前に進んでない状態に似てます。
バックギャモンが好きすぎて、伝えたいのに技術が足りずもがいてます。
みなさ～～ん、バックギャモン、おもしろいです！
いっしょにプレーしましょう！！！！！
「レオの柩」よろしくお願いいたします！」"
);

INSERT INTO beginners.authors (
  id,
  name,
  info
) VALUES (
  "15",
  "逢坂みえこ",
  "明治時代の『坊っちゃん』を現代の大学寮に持ってきたらどうなるか。やってみました。
漱石先生無断借用すみません。
読者の皆様も広い心で読んでね♡"
);

INSERT INTO beginners.authors (
  id,
  name,
  info
) VALUES (
  "16",
  "こおにたびらこ",
  "期待賞受賞、嬉しく思っております。楽しんでもらえたら幸いです。よろしくお願いします。"
);

INSERT INTO beginners.authors (
  id,
  name,
  info
) VALUES (
  "17",
  "芦藻彬",
  "お初にお目にかかります、芦藻彬と申します。すこしふしぎな小噺をどうぞ。クスッと楽しんでいただければ幸いです。"
);


INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  1,
  1,
  "第1話",
  1
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  2,
  1,
  "第2話",
  2
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  3,
  1,
  "第3話",
  3
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  4,
  1,
  "第4話",
  4
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  5,
  1,
  "第5話",
  5
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  6,
  1,
  "第6話",
  6
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  7,
  1,
  "第7話",
  7
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  8,
  1,
  "第8話",
  8
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  9,
  1,
  "第9話",
  9
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  10,
  1,
  "第10話",
  10
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  11,
  1,
  "第11話",
  11
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  12,
  1,
  "第12話",
  12
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  13,
  1,
  "第13話",
  13
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  14,
  1,
  "第14話",
  14
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  15,
  1,
  "第15話",
  15
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  16,
  1,
  "第16話",
  16
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  17,
  1,
  "第17話",
  17
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  18,
  1,
  "第18話",
  18
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  19,
  1,
  "第19話",
  19
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  20,
  1,
  "第20話",
  20
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  21,
  1,
  "第21話",
  21
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  22,
  2,
  "第1話",
  1
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  23,
  2,
  "第2話",
  2
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  24,
  2,
  "第3話",
  3
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  25,
  2,
  "第4話",
  4
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  26,
  2,
  "【特集】作家&担当 本作舞台裏大取材！",
  5
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  27,
  2,
  "第5話",
  6
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  28,
  2,
  "第6話",
  7
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  29,
  2,
  "第7話",
  8
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  30,
  2,
  "第8話",
  9
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  31,
  2,
  "第9話",
  10
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  32,
  2,
  "第10話",
  11
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  33,
  2,
  "第11話",
  12
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  34,
  3,
  "第1話",
  1
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  35,
  3,
  "第2話",
  2
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  36,
  3,
  "第3話",
  3
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  37,
  3,
  "第4話",
  4
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  38,
  3,
  "第5話",
  5
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  39,
  3,
  "第6話",
  6
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  40,
  3,
  "第7話",
  7
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  41,
  3,
  "第8話",
  8
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  42,
  3,
  "第9話",
  9
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  43,
  3,
  "第10話",
  10
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  44,
  3,
  "第11話",
  11
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  45,
  3,
  "第12話",
  12
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  46,
  3,
  "第13話",
  13
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  47,
  3,
  "第14話",
  14
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  48,
  3,
  "第15話",
  15
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  49,
  3,
  "第16話",
  16
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  50,
  3,
  "第17話",
  17
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  51,
  4,
  "第1話",
  1
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  52,
  4,
  "第2話",
  2
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  53,
  4,
  "第3話",
  3
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  54,
  4,
  "第4話",
  4
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  55,
  4,
  "第5話",
  5
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  56,
  4,
  "第6話",
  6
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  57,
  4,
  "第7話",
  7
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  58,
  4,
  "第8話",
  8
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  59,
  4,
  "第9話",
  9
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  60,
  4,
  "第10話",
  10
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  61,
  4,
  "第11話",
  11
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  62,
  4,
  "第12話",
  12
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  63,
  4,
  "第13話",
  13
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  64,
  4,
  "第14話",
  14
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  65,
  4,
  "第15話",
  15
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  66,
  4,
  "第16話",
  16
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  67,
  4,
  "第17話",
  17
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  68,
  4,
  "第18話",
  18
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  69,
  4,
  "第19話",
  19
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  70,
  4,
  "第20話",
  20
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  71,
  5,
  "第1話",
  1
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  72,
  5,
  "第2話",
  2
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  73,
  5,
  "第3話",
  3
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  74,
  5,
  "第4話",
  4
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  75,
  5,
  "第5話",
  5
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  76,
  5,
  "第6話",
  6
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  77,
  5,
  "第7話",
  7
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  78,
  5,
  "第8話",
  8
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  79,
  5,
  "第9話",
  9
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  80,
  5,
  "第10話",
  10
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  81,
  5,
  "第11話",
  11
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  82,
  5,
  "第12話",
  12
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  83,
  5,
  "第13話",
  13
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  84,
  5,
  "第14話",
  14
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  85,
  5,
  "第15話",
  15
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  86,
  5,
  "第16話",
  16
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  87,
  5,
  "第17話",
  17
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  88,
  6,
  "第1話",
  1
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  89,
  6,
  "第2話",
  2
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  90,
  6,
  "第3話",
  3
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  91,
  6,
  "第4話",
  4
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  92,
  6,
  "第5話",
  5
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  93,
  6,
  "第6話",
  6
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  94,
  6,
  "第7話",
  7
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  95,
  6,
  "第8話",
  8
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  96,
  6,
  "番外編/ログアウト",
  9
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  97,
  6,
  "第9話",
  10
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  98,
  6,
  "第10話",
  11
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  99,
  6,
  "第11話",
  12
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  100,
  6,
  "第12話",
  13
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  101,
  6,
  "第13話",
  14
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  102,
  6,
  "番外編②/家出騒動、その後",
  15
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  103,
  6,
  "第14話",
  16
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  104,
  7,
  "第1話",
  1
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  105,
  7,
  "第2話",
  2
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  106,
  7,
  "第3話",
  3
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  107,
  7,
  "第4話",
  4
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  108,
  7,
  "第5話",
  5
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  109,
  7,
  "第6話",
  6
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  110,
  7,
  "第7話",
  7
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  111,
  7,
  "第8話",
  8
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  112,
  7,
  "第9話",
  9
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  113,
  7,
  "第10話",
  10
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  114,
  7,
  "第11話",
  11
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  115,
  7,
  "第12話",
  12
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  116,
  7,
  "第13話",
  13
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  117,
  7,
  "第14話",
  14
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  118,
  8,
  "第2話",
  2
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  119,
  8,
  "第1話",
  1
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  120,
  8,
  "第3話",
  3
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  121,
  8,
  "第4話",
  4
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  122,
  8,
  "第5話",
  5
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  123,
  8,
  "第6話",
  6
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  124,
  8,
  "第7話",
  7
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  125,
  8,
  "第8話",
  8
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  126,
  8,
  "第9話",
  9
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  127,
  8,
  "第10話",
  10
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  128,
  8,
  "第11話",
  11
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  129,
  8,
  "第12話",
  12
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  130,
  8,
  "第13話",
  13
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  131,
  8,
  "第14話",
  14
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  132,
  8,
  "第15話",
  15
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  133,
  8,
  "第16話",
  16
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  134,
  8,
  "第17話",
  17
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  135,
  8,
  "第18話",
  18
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  136,
  8,
  "第19話",
  19
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  137,
  8,
  "第20話",
  20
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  138,
  8,
  "第21話",
  21
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  139,
  8,
  "第22話",
  22
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  140,
  8,
  "第23話",
  23
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  141,
  8,
  "第24話",
  24
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  142,
  8,
  "第25話",
  25
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  143,
  8,
  "第26話",
  26
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  144,
  8,
  "第27話",
  27
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  145,
  8,
  "第28話",
  28
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  146,
  8,
  "第29話",
  29
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  147,
  9,
  "第1話",
  1
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  148,
  9,
  "第2話",
  2
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  149,
  9,
  "第3話",
  3
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  150,
  9,
  "第4話",
  4
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  151,
  9,
  "第5話",
  5
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  152,
  10,
  "第1話",
  1
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  153,
  10,
  "第2話",
  2
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  154,
  10,
  "第3話",
  3
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  155,
  10,
  "第4話",
  4
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  156,
  10,
  "第5話",
  5
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  157,
  10,
  "第6話",
  6
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  158,
  10,
  "第7話",
  7
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  159,
  10,
  "第8話",
  8
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  160,
  11,
  "第1話",
  1
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  161,
  11,
  "第2話",
  2
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  162,
  11,
  "第3話",
  3
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  163,
  11,
  "第4話",
  4
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  164,
  11,
  "第5話",
  5
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  165,
  11,
  "第6話",
  6
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  166,
  11,
  "第7話",
  7
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  167,
  11,
  "第8話",
  8
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  168,
  12,
  "第1話",
  1
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  169,
  12,
  "第2話",
  2
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  170,
  12,
  "第3話",
  3
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  171,
  13,
  "第1話",
  1
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  172,
  14,
  "第1話",
  1
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  173,
  14,
  "第2話",
  2
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  174,
  14,
  "第3話",
  3
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  175,
  14,
  "第4話",
  4
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  176,
  14,
  "第5話",
  5
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  177,
  14,
  "第6話",
  6
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  178,
  14,
  "第7話",
  7
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  179,
  14,
  "第8話",
  8
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  180,
  14,
  "第9話",
  9
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  181,
  15,
  "第1話",
  1
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  182,
  15,
  "第2話",
  2
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  183,
  15,
  "第3話",
  3
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  184,
  15,
  "第4話",
  4
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  185,
  16,
  "第1話",
  1
);

INSERT INTO beginners.comic_data (
  id,
  comic_id,
  title,
  episode
) VALUES (
  186,
  17,
  "第1話",
  1
);


INSERT INTO beginners.comic_author (
  comic_id,
  author_id
) VALUES (
  1,
  1
);

INSERT INTO beginners.comic_author (
  comic_id,
  author_id
) VALUES (
  2,
  2
);

INSERT INTO beginners.comic_author (
  comic_id,
  author_id
) VALUES (
  3,
  3
);

INSERT INTO beginners.comic_author (
  comic_id,
  author_id
) VALUES (
  4,
  4
);

INSERT INTO beginners.comic_author (
  comic_id,
  author_id
) VALUES (
  5,
  5
);

INSERT INTO beginners.comic_author (
  comic_id,
  author_id
) VALUES (
  6,
  6
);

INSERT INTO beginners.comic_author (
  comic_id,
  author_id
) VALUES (
  7,
  7
);

INSERT INTO beginners.comic_author (
  comic_id,
  author_id
) VALUES (
  8,
  8
);

INSERT INTO beginners.comic_author (
  comic_id,
  author_id
) VALUES (
  9,
  9
);

INSERT INTO beginners.comic_author (
  comic_id,
  author_id
) VALUES (
  10,
  10
);

INSERT INTO beginners.comic_author (
  comic_id,
  author_id
) VALUES (
  11,
  11
);

INSERT INTO beginners.comic_author (
  comic_id,
  author_id
) VALUES (
  12,
  12
);

INSERT INTO beginners.comic_author (
  comic_id,
  author_id
) VALUES (
  13,
  13
);

INSERT INTO beginners.comic_author (
  comic_id,
  author_id
) VALUES (
  14,
  14
);

INSERT INTO beginners.comic_author (
  comic_id,
  author_id
) VALUES (
  15,
  15
);

INSERT INTO beginners.comic_author (
  comic_id,
  author_id
) VALUES (
  16,
  16
);

INSERT INTO beginners.comic_author (
  comic_id,
  author_id
) VALUES (
  17,
  17
);


-- +migrate Down
drop table beginners.comic_author;
drop table beginners.comic_data;
drop table beginners.authors;
drop table beginners.comics;