## アプリケーション概要
- DOLLY

## アプリケーション概要
- 女性のファッションサイト。お買い物が失敗しないように、欲しい商品が探しやすくサイズや生地の表記が詳しく書いてある。

## URL
https://dolly-1.herokuapp.com/
## テスト用アカウント
### Basic認証
- ユーザー名：admin
- パスワード：2222

## 利用方法
- 買いたい商品をカテゴリー欄から探して商品を購入したり、検索機能を使ってピンポイントで商品を検索して商品を購入する。
- 気に入った商品はまだ買わずにお気に入りに入れることができ、他の商品と比べてから商品を購入することもできる。

## 目指した課題解決
- このアプリケーションを通じて、よくショッピングで失敗してしまう女性たちの、オンラインショッピングでの、洋服のサイズであったりお洋服の生地の薄さがわかじずらいという課題を解決したいと考えています。

## 洗い出した要件	
- マイページ	:登録内容を変更できるようにするため・注文履歴を知ることができるようにする
- 購入機能	:お客様が書いたい商品を購入することができるようにするため
- タブメニュー機能	:タブをつけることで様々なカテゴリーを絞って商品をみることができるため
- スライドショー機能	:スライドショーがあることで画面に動きがあり、見栄えがいいため
- 商品詳細ページ	:洋服のサイズやカラー展開はどんな感じなのか知るため

## 実装した機能についての画像やGIFおよびその説明
### トップページ
<a href="https://gyazo.com/c7d3a02a8db2b7efb06f797c9922bc4f"><video alt="Video from Gyazo" width="1000" autoplay muted loop playsinline controls><source src="https://i.gyazo.com/c7d3a02a8db2b7efb06f797c9922bc4f.mp4" type="video/mp4" /></video></a>

### ログイン画面(ログイン・新規登録)
[![Image from Gyazo](https://i.gyazo.com/4cc11e7efae40e54e40ab486f3af974b.png)](https://gyazo.com/4cc11e7efae40e54e40ab486f3af974b)

### 新規登録画面
<a href="https://gyazo.com/eabc815b9fcee53e63b9cad65cf17438"><video alt="Video from Gyazo" width="1000" autoplay muted loop playsinline controls><source src="https://i.gyazo.com/eabc815b9fcee53e63b9cad65cf17438.mp4" type="video/mp4" /></video></a>

## 実装予定の機能
- 購入履歴機能	:今までどんな商品を購入したのか確認するためだけでなく、どれぐらい月にお洋服にお金を使ったのか目で確かめることができる
- 全体のランキング機能	:今どんな商品が人気なのか、どんな洋服が今の流行りなのかランキングをみることで知ることができる
- アイテム別ランキング	:全体のランキングだけでなくカテゴリー別のランキングも参考にし、買いたい商品を絞っていけるようにするため
- 検索機能	:検索機能を使ってピンポイントで商品を見つけることができるようにするため
- お気に入り商品一覧 :買いたい商品を今すぐに買うのではなく、いいねを押して他の商品と見比べるためにお気に入りボタンが必要
- カテゴリー別商品一覧	:どんな商品があるのかを一覧で全体の商品を見るため

## データベース設計

#### users テーブル

| Column             | Type     | Options                  |
| ------------------ | -------- | ------------------------ |
| nickname           | string   | null: false              |
| email              | string   | null: false,unique: true |
| encrypted_password | string   | null: false              |
| last_name          | string   | null: false              |
| first_name         | string   | null: false              |
| last_name_kana     | string   | null: false              |
| first_name_kana    | string   | null: false              |
| birthday           | date     | null: false              |

##### Association

- has_many : purchase_users
- has_many : purchase_histories
- has_many : favorite_items

#### items テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| name           | string     | null: false       |
| price          | integer    | null: false       |
| category       | references | foreign_key: true |

##### Association

- has_one : purchase_user
- belongs_to : category
- has_one : favorite_item
- belongs_to : purchase_history
- belongs_to : owner

#### categories テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| ca_name        | string     | null: false       |
| item           | references | foreign_key: true |

##### Association

- has_many : items

#### addresses テーブル
| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal_code   | string     | null: false       |
| prefecture_id | integer    | null: false       |
| city          | string     | null: false       |
| house_number  | string     | null: false       |
| building      | string     |                   |
| phone_number  | string     | null: false       |
| purchase_user | references | foreign_key: true |


##### Association

- has_many : purchase_histories
- belongs_to : purchase_user

#### purchase_users テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |

##### Association

- belongs_to : user
- belongs_to : item
- has_one : address
- belongs_to : purchase_history

#### favorite_items テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| item    | references | foreign_key: true |

##### Association

- belongs_to : item
- belongs_to : favorite_item

#### purchase_histories テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| purchase_users | references | foreign_key: true |

##### Association

- belongs_to : user
- belongs_to : item
- belongs_to : address
- has_one : purchase_user

#### owners

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| item    | references | foreign_key: true |

##### Association

- has_many : items

## ER図
[![Image from Gyazo](https://i.gyazo.com/ef106ddf8389ba0af78a71d6515777c2.jpg)](https://gyazo.com/ef106ddf8389ba0af78a71d6515777c2)



## 使用技術
### バックエンド
Ruby,Ruby on Rails
### フロントエンド
HTML/CSS,JavaScript
### データベース
MySQL,SequelPro
### ソース管理
GitHb,GitHubDesktop
### テスト
RSpec
### エディタ
VSCode