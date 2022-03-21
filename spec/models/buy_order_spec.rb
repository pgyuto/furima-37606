require 'rails_helper'

RSpec.describe BuyOrder, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buy_order = FactoryBot.build(:buy_order, user_id: user.id, item_id: item.id)
    end

    context '商品が購入できる場合' do
      it '全ての値が正しく入力できれば保存できること' do
        expect(@buy_order).to be_valid
      end
      it 'building_nameが空でも保存できること' do
        @buy_order.building_name = ''
        expect(@buy_order).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it 'post_code:必須' do
        @buy_order.post_code = ''
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("Post code can't be blank")
      end
      it 'area_id:必須' do
        @buy_order.area_id = ''
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("Area can't be blank")
      end
      it 'city:必須' do
        @buy_order.city = ''
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("City can't be blank")
      end
      it 'address:必須' do
        @buy_order.address = ''
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_number:必須' do
        @buy_order.phone_number = ''
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'userが紐づいていないと購入できない' do
        @buy_order.user_id = nil
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと購入できない' do
        @buy_order.item_id = nil
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("Item can't be blank")
      end
      it 'area_idが1なら購入できない' do
        @buy_order.area_id = 1
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include('Area Select')
      end
      it 'post_codeがハイフンなしだと購入できない' do
        @buy_order.post_code = '1234567'
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'phone_numberが9桁以下だと購入できない' do
        @buy_order.phone_number = '123456789'
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include('Phone number number is too short')
      end
      it 'tokenが空だと購入できない' do
        @buy_order.token = nil
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("Token can't be blank")
      end
      it '電話番号が12桁以上では購入できない' do
        @buy_order.phone_number = '000000000000'
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include('Phone number number is too short')
      end
      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @buy_order.phone_number = '000００００００００'
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include('Phone number number is too short')
      end
    end
  end
end
