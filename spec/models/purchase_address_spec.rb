require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(
      :purchase_address,
      user_id: @user.id,
      item_id: @item.id
    )
  end

  context '購入できるとき' do
    it '全ての値が正しく入力されていれば保存できる' do
      expect(@purchase_address).to be_valid
    end

    it 'buildingは空でも保存できる' do
      @purchase_address.building = ''
      expect(@purchase_address).to be_valid
    end
  end

  context '購入できないとき' do
    it 'postal_codeが空だと保存できない' do
      @purchase_address.postal_code = ''
      expect(@purchase_address).not_to be_valid
    end

    it 'postal_codeの形式が正しくないと保存できない' do
      @purchase_address.postal_code = '1234567'
      expect(@purchase_address).not_to be_valid
    end

    it 'prefecture_idが1だと保存できない' do
      @purchase_address.prefecture_id = 1
      expect(@purchase_address).not_to be_valid
    end

    it 'cityが空だと保存できない' do
      @purchase_address.city = ''
      expect(@purchase_address).not_to be_valid
    end

    it 'addressesが空だと保存できない' do
      @purchase_address.addresses = ''
      expect(@purchase_address).not_to be_valid
    end

    it 'phone_numberが空だと保存できない' do
      @purchase_address.phone_number = ''
      expect(@purchase_address).not_to be_valid
    end

    it 'phone_numberが9桁以下だと保存できない' do
      @purchase_address.phone_number = '090123456'
      expect(@purchase_address).not_to be_valid
    end

    it 'phone_numberが12桁以上だと保存できない' do
      @purchase_address.phone_number = '090123456789'
      expect(@purchase_address).not_to be_valid
    end

    it 'phone_numberにハイフンがあると保存できない' do
      @purchase_address.phone_number = '090-1234-5678'
      expect(@purchase_address).not_to be_valid
    end

    it 'user_idが空だと保存できない' do
      @purchase_address.user_id = nil
      expect(@purchase_address).not_to be_valid
    end

    it 'item_idが空だと保存できない' do
      @purchase_address.item_id = nil
      expect(@purchase_address).not_to be_valid
    end

    it 'tokenが空だと保存できない' do
      @purchase_address.token = nil
      expect(@purchase_address).not_to be_valid
    end
  end
end
