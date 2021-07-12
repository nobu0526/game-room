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

<img width="464" alt="68394b6571bffc03406dc596ece28948" src="https://user-images.githubusercontent.com/82923269/125224223-267e7f80-e308-11eb-917b-384a44420df2.png">



①左上青色の欄にて自身のユーザ情報等々を表示致します。
②左下緑色の欄にてフォロー及びフォローされているユーザーを表示致します。
③右上淡い青色の欄にて②にて選択されたユーザー情報を表示致します。
④右真ん中の灰色欄にて②で選択されたユーザとのメッセージのやりとりが表示されます。
⑤右下白及び青色にてメッセージのテキスト編集及び送信を行えます。
