class BuysController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :move_to_root_path, only: :index
  before_action :set_item, only: [:index, :create]

  def index
    @buy_order = BuyOrder.new
  end

  def create
    @buy_order = BuyOrder.new(buy_params)
    if @buy_order.valid?
      pay_item
      @buy_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_order).permit(:post_code, :area_id, :city, :address, :building_name, :phone_number).merge(
      token: params[:token], user_id: current_user.id, item_id: params[:item_id]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_root_path
    redirect_to root_path if current_user.id == Item.find(params[:item_id]).user.id
    redirect_to root_path if Item.find(params[:item_id]).buy.present?
  end
end
