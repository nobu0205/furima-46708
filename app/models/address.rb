class Address < ApplicationRecord
  belongs_to :purchase

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :addresses
    validates :phone_number
    validates :purchase_id
  end

  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }, allow_blank: true

  validates :prefecture_id, numericality: { other_than: 1 }, allow_blank: true

  validates :phone_number, format: { with: /\A[0-9]{10,11}\z/ }, allow_blank: true
end
