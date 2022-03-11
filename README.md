## users

|Column            |Type  |Options                  |
|------------------|------|-------------------------|
|nickname          |string|null: false              |
|email             |string|null: false, unique: true|
|encrypted_password|string|null: false              |
|first_name        |string|null: false              |
|last_name         |string|null: false              |
|first_name_kana   |string|null: false              |
|last_name_kana    |string|null: false              |
|birthday          |date  |null: false              |

### Association
has_many :items
has_many :buys

## items

|Column   |Type      |Options                       |
|---------|----------|------------------------------|
|name     |string    |null: false                   |
|text     |text      |null: false                   |
|category |string    |null: false                   |
|condition|string    |null: false                   |
|postage  |string    |null: false                   |
|area     |string    |null: false                   |
|post_data|string    |null: false                   |
|price    |integer   |null: false                   |
|user     |references|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :buy
has_one :buy

## buys

|Column |Type      |Options                       |
|-------|----------|------------------------------|
|user   |references|null: false, foreign_key: true|
|item   |references|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :item
has_one :order

### orders
|Column       |Type      |Options                       |
|-------------|----------|------------------------------|
|post_code    |string    |null: false                   |
|prefecture   |string    |null: false                   |
|city         |string    |null: false                   |
|address      |string    |null: false                   |
|building_name|string    |                              |
|phone_number |string    |null: false                   |
|buy          |references|null: false, foreign_key: true|

### Association
belongs_to :buy