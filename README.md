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

◆トップページ

<img width="931" alt="f9146328596fb78721350b1ec10d2305" src="https://user-images.githubusercontent.com/82923269/126299578-85c84910-0921-4b85-91d5-a4231916bab1.png">

本画面にて、フォロー、フォロワー関係にあるユーザとのメッセージのやりとりを行う予定です。
左上画面にてチャットを開始致します。


◆チャット開始画面
<img width="922" alt="e6f0dcb8b09b7c5c35f2940c3c90bdb9" src="https://user-images.githubusercontent.com/82923269/126299796-f83904f3-ec33-4d43-a73f-bd7307e5a3b7.png">

本画面にて、チャットをするユーザを選択し、チャットルーム名を決めチャットを行う予定です。
そうして作ったチャットルームがトップページ左にて、ユーザ名として出力されます。

◆マイページ（本画面ではuser1)
<img width="922" alt="f92c27f0013d7069b9f5ffcd41661ccb" src="https://user-images.githubusercontent.com/82923269/126299892-0eacf6e1-7712-4469-8aad-3bf8472b0f50.png">

本画面にて、プロフィール等々の編集を行ったりします。
マイページにて、フォロー申請の確認を行うこともします。


◆他ユーザページ（本画面ではuser2)
<img width="918" alt="b19cad8261e538031a12b754929bf7d1" src="https://user-images.githubusercontent.com/82923269/126300093-5728ea28-af69-413f-8008-7c31ca2a93af.png">

本画面にて、他ユーザに対し、フォロー申請を行います。
フォロー申請を行い、フォロワーとなることでチャット選択画面にてユーザを選択できます。


◆工夫したポイント
私が工夫した点はフォロー機能です。

本アプリでは、他ユーザとの交流サイトとなっております、
しかし、誰にでもメッセージを送れる環境下では、悪質なチャットなどが届いたりすることが想定できます。
そのため、フォロー関係にあるユーザ間でのみメッセージを送れるようにフォロー機能を実装する予定です。
想定しているよりも私には難しくMVCの流れやアソシエーション等を理解するのに苦労しております。

