# README

# コンセプト
構造としてはいたって単純なブログアプリではあるが、javascriptを使って動的な動きのある見やすいサイトにする。
Twetterとの連携や、画像の埋め込み,投稿した記事の編集・更新・削除,いいね機能などのやったこのない機能にチャレンジする。
また、スクール最終課題の時の経験を活かした機能を実装する。(アウトプット)
デプロイ経験がAWSでのみのため,herokuを用いたデプロイに挑戦する。

## これから実装する部分
* トップページではピックアップカテゴリーごとのページへ進むことができ、カテゴリーごとの新着の記事や画像を表示します。
* カテゴリー詳細ページにて記事が新しい順に並んでいます。
* 記事のテーマ別に一覧を画像で見れるようにする。
* ユーザーのプロフィールページ作成。
* ページネーションによって5ページずつ表示されるようにします。
* 投稿した記事は、詳細画面より編集・削除ができます。
* 投稿した記事は更新することができる
* キーワードでタイトルから投稿された記事をあいまい検索ができるようにする。

# DB設計

## usersテーブル
ユーザーはニックネームと自己紹介文、アイコンを設定できる。

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|profile|text||
|icon|string||

### Association

## articlesテーブル
投稿されたブログは複数の画像を投稿できる。
<br>複数のタグをつけることができ、コメントやいいねをつけることができる。

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|content|string|null: false|
|user_id|integer|null: false|

## commentsテーブル
投稿された記事にコメントを投稿できる。
* 文字が入力されてない状態では送信ボタンdisabledにする

|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|integer|null: false|
|article_id|integer|null: false|

## Association

## tagsテーブル
記事にはタグをつけることができる。
* すでにあるものに関してはタグのidを紐付け、新しいものに関しては作成した上で紐づける。

|Column|Type|Options|
|------|----|-------|
|tag|string|null: false|

## Association

# KAblog
ご覧いただきましてありがとうございます。
<br>ポートフォリオサイトはいろんな依頼を受けて、フロントエンド・サーバーサイドで作成してみた機能をご覧いただき、
<br>自分のスキルをアウトプットするページです。