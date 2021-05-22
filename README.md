# テーブル設計

## filed_cost テーブル
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


