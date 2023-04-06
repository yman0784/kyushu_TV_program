# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :comments

## tv_programs テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     |                                |
| time          | string     |                                |
| overview      | text       |                                |
| detail        | text       |                                |
| performer     | text       |                                |
| prefecture_id | integer    | null: false, foreign_key: true |

### Association


## prefecture_programs テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     |                                |
| time          | string     |                                |
| overview      | text       |                                |
| detail        | text       |                                |
| performer     | text       |                                |
| prefecture_id | integer    | null: false, foreign_key: true |
| extract_time  | string     |                                |

### Association

- has_many :comments

## comments テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| text          | text       |                                |
| user_id       | integer    | null: false, foreign_key: true |
| prefecture_id | integer    | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :prefecture_program