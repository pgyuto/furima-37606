class Buy < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :area
end
