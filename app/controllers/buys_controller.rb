class BuysController < ApplicationController
  def index
    @buy_order = BuyOrder.new
    @item = Item.find(params[:item_id])
  end

  def create
    @buy_order = BuyOrder.new(buy_params)
    @item = Item.find(params[:item_id])
    if @buy_order.valid?
      @buy_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def buy_params
    params.require(:buy_order).permit(:post_code, :area_id, :city, :address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id]
    )
  end
end
