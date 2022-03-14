class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :postage, :area, :post_date
  has_one_attached :image

  validates :name, :text, :price, presence: true
  validates :price, format: {with: /\A\d+\z/}, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}
  validates :category_id, :condition_id, :postage_id, :area_id, :post_date_id,
    numericality: { other_than: 1 , message: "can't be blank"}
end
