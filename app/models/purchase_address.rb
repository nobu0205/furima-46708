class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building,
                :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code
    validates :city
    validates :addresses
    validates :phone_number
    validates :user_id
    validates :item_id
    validates :token
    validates :prefecture_id
  end

  validates :postal_code,
            format: { with: /\A[0-9]{3}-[0-9]{4}\z/ },
            allow_blank: true

  validates :prefecture_id,
            numericality: { other_than: 1 },
            allow_blank: true

  validates :phone_number,
            format: { with: /\A[0-9]{10,11}\z/ },
            allow_blank: true

  def save
    return false unless valid?

    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      addresses: addresses,
      building: building,
      phone_number: phone_number,
      purchase_id: purchase.id
    )
    true
  end
end
