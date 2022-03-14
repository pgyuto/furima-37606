class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :postage, :area, :post_date

  validates :name, :text, :price, presence: true
  validates :category_id, :condition_id, :postage_id, :area_id, :post_date_id,
    numericality: { other_than: 1 , message: "can't be blank"}
end
