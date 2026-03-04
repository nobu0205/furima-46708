require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase)
  end

  context '購入できるとき' do
    it 'userとitemがあれば保存できる' do
      expect(@purchase).to be_valid
    end
  end

  context '購入できないとき' do
    it 'userがないと保存できない' do
      @purchase.user = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('User must exist')
    end

    it 'itemがないと保存できない' do
      @purchase.item = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Item must exist')
    end
  end
end
