class ItemPurchasesController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!
  before_action :contributor_confirmation
  before_action :purchased

  def index
    @item_purchase_shipping_address = ItemPurchaseShippingAddress.new

  end

  def new
  end

  def create
    @item_purchase_shipping_address = ItemPurchaseShippingAddress.new(item_purchase_shipping_address_params)
    if @item_purchase_shipping_address.valid?
      pay_item
      @item_purchase_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_purchase_shipping_address_params
    params.require(:item_purchase_shipping_address).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: item_purchase_shipping_address_params[:token],
      currency: 'jpy'
    )
  end

  def contributor_confirmation
    redirect_to root_path unless current_user != @item.user
  end

  def purchased
    redirect_to root_path unless @item.item_purchase.blank?
  end

end
