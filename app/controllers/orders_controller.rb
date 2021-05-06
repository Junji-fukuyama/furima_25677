class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index
  
  def index
    @order = PayForm.new
  end

  def create
    @order = PayForm.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    end
    @item = Item.find(params[:item_id])
    render 'index'
  end

  private

  def order_params
    params.require(:pay_form).permit(
      :postal_code,
      :prefecture_id,
      :city,
      :addresses,
      :building,
      :phone_number
    ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    return redirect_to root_path if current_user.id == @item.user.id || @item.order.present?
  end

end