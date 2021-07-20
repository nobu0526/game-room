1, タイトル、概要
◆タイトル：game-room
◆概要：コロナ禍の中、休日を自宅にて過ごされる方が増えていく中、ゲーム需要が伸び続けております。
        オンライン環境でのゲームができる環境であるものの、現在見知らぬ人とマッチングを行いゲームを進めるものとなっております。
        そのような環境下でも楽しめますが、より一層楽しむためにも知り合いを作りゲームを行える環境下を作るためにも、
        ゲーム交流のマッチングアプリを制作しております。

2, 使用技術
◆使用技術：ruby

3, 構成図
◆以下にてテーブル添付


4, 機能、非機能一覧
◆機能：フォロー関係にあるユーザ間でのみメッセージの送受信が可能なアプリを製作中




## users table

| Column               | Type                | Options                 |
|----------------------|---------------------|-------------------------|
| nickname             | string              | null: false             |
| email                | string              | null: false,unique:true |
| encrypted_password   | string              | null: false             |
### Association

- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## Relationshipsテーブル

| Column        | Type    | Options     |
| --------------| ------- | ------------|
| content       | string  |             |
| follower_id   | integer | null: false |
| room          | integer | null: false |

以下画面モックにてアプリ構想ご紹介させていただきます。

トップページ
<img width="464" alt="68394b6571bffc03406dc596ece28948" src="https://user-images.githubusercontent.com/82923269/125224223-267e7f80-e308-11eb-917b-384a44420df2.png">

本画面にて、フォロー、フォロワー関係にあるユーザとのメッセージのやりとりを行う予定です。
左上画面にてチャットを開始致します。


チャット開始画面


本画面にて、チャットをするユーザを選択し、チャットルーム名を決めチャットを行う予定です。

マイページ

本画面にて、プロフィール等々の編集を行ったりします。


他ユーザページ（本画面てはuser2)


本画面にて、他ユーザに対し、フォロー申請を行います。
フォロー申請を行い、フォロワーとなることでチャット選択画面にてユーザを選択できます。


工夫したポイント
本アプリでは、他ユーザとの交流サイトとなっております、
しかし、誰にでもメッセージを送れる環境下では、悪質なチャットなどが届いたりすることが想定できます。
そのため、フォロー関係にあるユーザ間でのみメッセージを送れるようにフォロー機能を実装する予定です。
想定しているよりも私には難しくMVCの流れやアソシエーション等を理解するのに苦労しております。

