require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    purchase = Purchase.create(user_id: user.id, item_id: item.id)

    @address = Address.new(
      postal_code: '123-4567',
      prefecture_id: 2,
      city: '横浜市',
      addresses: '青山1-1-1',
      building: '', # 空でもOK
      phone_number: '09012345678',
      purchase_id: purchase.id
    )
  end

  it 'building が空でも保存できる' do
    expect(@address).to be_valid
  end

  it 'postal_code が空だと保存できない' do
    @address.postal_code = ''
    expect(@address).not_to be_valid
  end
end
