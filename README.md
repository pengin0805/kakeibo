# アプリ名
kakeibo-app

# 概要
現在、実装中です。<br>
カレンダー機能を実装した家計簿アプリです。<br>
変動費、固定費、特別費の項目から、支出を入力するとカレンダーに反映されます。<br>
プルダウン方式でカテゴリーを選択できるようにしています。<br>
カテゴリー別に毎月の合計金額を円グラフ、棒グラフに表示しています。<br>

# 本番環境
http://35.75.35.96/<br>
※現在、実装途中
開始:2021/05/24〜


# 洗い出した要件定義
## ①支出の登録
[![Image from Gyazo](https://i.gyazo.com/0b8eb74d50636f91616de01c4d182a17.gif)](https://gyazo.com/0b8eb74d50636f91616de01c4d182a17)


# テーブル設計

## fixed_costs テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| fixecate_id        | integer| null: false |
| fixecate_name_id   | integer| null: false |
| price              | integer| null: false |
| month              | date   | null: false |

### Association
belongs_to :fixecate
belongs_to :fixecate_name

## fixecates テーブル

| Column               | Type       |Options      |
| -------------------- | ---------- | ----------- |
| name                 | string     | null: false |

### Association
has_many :fixed_costs

## fixecate_names テーブル

| Column               | Type       |Options      |
| -------------------- | ---------- | ----------- |
| name                 | string     | null: false |

### Association
has_many :fixed_costs




## variable_costs テーブル

| Column               | Type       |Options            |
| -------------------- | ---------- | ----------------- |
| varicate_id          | references | foreign_key: true |
| variable_name        | string     | null: false |
| price                | integer    | null: false |
| start_time           | date       | null: false |

### Association
belongs_to :varicate

## varicates テーブル

| Column               | Type       |Options                        |
| -------------------- | ---------- | ------------------------------ |
| name                 | string     | null: false |

### Association
has_many :variable_costs




## special_costs テーブル
| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| special_category_id   | integer    | null: false |
| special_name          | string     | null: false |
| price                 | integer    | null: false |
| year                  | date       | null: false |

### Association
belongs_to :specate

## specates テーブル

| Column               | Type       |Options      |
| -------------------- | ---------- | ----------- |
| name                 | string     | null: false |

### Association
has_many :special_costs
