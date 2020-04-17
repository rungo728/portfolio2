# README

# KAblog

ご覧いただきましてありがとうございます。
<br>私はプログラミングスクールを卒業して、現在もプログラミングのご依頼を受けながら新しいアプリや機能を作成することでいろんな人に強く良い影響を与えたくて、フロントエンド・サーバーサイドで作成してみた機能や、
<br>私がアウトプットしてきたものをご紹介するページです。

# コンセプト

構造としてはいたって単純なブログアプリではあるが、javascript を使って動的な動きのある見やすいサイトにする。
Twetter との連携や、画像の埋め込み,投稿した記事の編集・更新・削除,いいね機能などのやったこのない機能にチャレンジする。
また、スクール最終課題の時の経験を活かした機能を実装する。(アウトプット)
デプロイ経験が AWS でのみのため,heroku を用いたデプロイに挑戦する。

## これから実装する部分

- 記事を書く際に画像だけではなくて、行セパレーターと動画を入れることができる。
- トップページではピックアップカテゴリーごとのページへ進むことができ、カテゴリーごとの新着の記事や画像を表示します。
- カテゴリー詳細ページにて記事が新しい順に並んでいます。
- 記事のテーマ別に一覧を画像で見れるようにする。
- ユーザーのプロフィールページ作成。
- ページネーションによって 5 ページずつ表示されるようにします。
- 投稿した記事は、詳細画面より編集・削除ができます。
- 投稿した記事は更新することができる
- キーワードでタイトルから投稿された記事をあいまい検索ができるようにする。

# DB 設計

# ER 図

<img src="https://i.gyazo.com/5820675fbe13b25a65e2d8bcbd9528ff.png" alt="Image from Gyazo" width="980"/>

## users テーブル

ユーザーはニックネームと自己紹介文、アイコンを設定できる。

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| profile  | text   |             |
| icon     | string |             |

### Association

- has_many :articles
- has_many :articles, through: :comments
- has_many :articles,through: :favorites

## articles テーブル

投稿されたブログは複数の画像・動画・行セパレートを投稿できる。
<br>複数のタグをつけることができ、コメントやいいねをつけることができる。

| Column  | Type    | Options     |
| ------- | ------- | ----------- |
| title   | string  | null: false |
| content | text    | null: false |
| user_id | integer | null: false |

## Association

- has_many :users, through: :comments
- has_many :users, through: :favorite
- belongs_to :user
- has_many :favorites
- has_many :tags, through: :article_tags

## comments テーブル

投稿された記事にコメントを投稿できる

- 文字が入力されてない状態では送信ボタン disabled にする

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| content    | text    | null: false |
| user_id    | integer | null: false |
| article_id | integer | null: false |

## Association

- belongs_to :user
- belongs_to :article

## tags テーブル

記事にはタグをつけることができる

- すでにあるものに関してはタグの id を紐付け、新しいものに関しては作成した上で紐づける。

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

## Association

- belongs_to :article
- belongs_to :tag

## article_tags テーブル

一つの記事は複数のタグを持ち、一つのタグは複数の記事を持つ。

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| article_id | integer | null: false |
| tag_id     | integer | null: false |

## Association

## favorites テーブル

記事にはお気に入り(いいね)をつけることができ、その数を表示したりいいね欄から記事に飛べる。

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| article_id | integer | null: false |
| user_id    | integer | null: false |

## Association

- belongs_to :user
- belongs_to :article

## images テーブル

一つの記事に複数の画像投稿が可能

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| content    | string  | null: false |
| article_id | integer | null: false |

## Association

- belongs_to :article
