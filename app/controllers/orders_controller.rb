class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index, only: [:index]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def new
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(order_params)

    if @purchase_address.valid?
      # token が空でないかチェック
      if order_params[:token].present?
        begin
          pay_item
          @purchase_address.save
          redirect_to root_path, notice: '購入が完了しました。'
        rescue Payjp::CardError => e
          # カード情報エラーは token に紐づける
          @purchase_address.errors.add(:token, 'カード情報に誤りがあります')
          render :index
        end
      else
        @purchase_address.errors.add(:token, "can't be blank")
        render :index
      end
    else
      # フォーム入力エラーは赤文字で表示
      render :index
    end
  end

  private

  def order_params
    params.require(:purchase_address).permit(
      :postal_code,
      :prefecture_id,
      :city,
      :addresses,
      :building,
      :phone_number,
      :token
    ).merge(
      user_id: current_user.id,
      item_id: @item.id
    )
  end

  def pay_item
    Payjp.api_key = ENV.fetch('PAYJP_SECRET_KEY', nil)
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
    return unless current_user == @item.user || @item.purchase.present?

    redirect_to root_path
  end
end
