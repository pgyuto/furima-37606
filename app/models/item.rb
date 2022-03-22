class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :area
  belongs_to :post_date
  has_one_attached :image
  belongs_to :user
  has_one :buy

  validates :name, :text, :price, :image, presence: true
  validates :price, numericality: { only_integer: true, message: 'を半角数字のみで入力してください' }
  validates :price,
            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                            message: 'を¥300〜9,999,999で入力してください' }
  validates :category_id, :condition_id, :postage_id, :area_id, :post_date_id,
            numericality: { other_than: 1, message: 'を入力してください' }
end
