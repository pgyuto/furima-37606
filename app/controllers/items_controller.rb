class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to action: :index
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :text, :category_id, :condition_id, :postage_id, :area_id, :post_date_id, :price, :image
    ).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == Item.find(params[:id]).user.id
    redirect_to action: :index if Item.find(params[:id]).buy.present?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
