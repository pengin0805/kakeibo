# アプリ名
kakeibo-app

# 概要
現在、実装中です。<br>
カレンダー機能を実装した家計簿アプリです。<br>
変動費、固定費のカテゴリーから選択して、支出を入力するとカレンダーに反映されます。<br>
カテゴリー別に毎月の合計金額の算出や割合をグラフにしたいと思っています。

# 本番環境
http://18.180.112.172/<br>
※現在、実装途中
開始:2021/05/24〜


# 洗い出した要件定義
## ①支出の登録
[![Image from Gyazo](https://i.gyazo.com/4a8ffb2901831927ad5f63a7b76e9be9.gif)](https://gyazo.com/4a8ffb2901831927ad5f63a7b76e9be9)


# テーブル設計

## fixed_cost テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| fixed_category_id  | integer| null: false |
| fixed_id           | integer| null: false |
| price              | integer| null: false |
| month              | date   | null: false |

### Association


## variable_cost テーブル

| Column               | Type       |Options                        |
| -------------------- | ---------- | ------------------------------ |
| variable_category_id | integer    | null: false |
| variable_name        | string     | null: false |
| price                | integer    | null: false |
| date                 | date       | null: false |

### Association


## special_cost テーブル
| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| special_category_id   | integer    | null: false |
| special_name          | string     | null: false |
| price                 | integer    | null: false |
| year                  | date       | null: false |

### Association


