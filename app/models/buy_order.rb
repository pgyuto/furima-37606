class BuyOrder
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'をハイフン(-)を含んだ半角数字で入力してください' }
    validates :area_id, numericality: { other_than: 1, message: 'を入力してください' }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A0\d{9,10}\z/, message: 'を半角数字で入力してください' }
    validates :token
  end
  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Order.create(post_code: post_code, area_id: area_id, city: city, address: address, building_name: building_name,
                 phone_number: phone_number, buy_id: buy.id)
  end
end
