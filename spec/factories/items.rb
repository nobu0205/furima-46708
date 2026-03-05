FactoryBot.define do
  factory :item do
    name { 'テスト商品' }
    description { 'テスト商品の説明' }
    category_id { 2 }
    condition_id { 2 }
    shipping_fee_id { 2 }
    prefecture_id { 2 }
    shipping_day_id { 2 }
    price { 500 }

    association :user

    after(:build) do |item|
      file_path = Rails.root.join('spec/fixtures/files/test_image.png')
      if File.exist?(file_path)
        item.image.attach(
          io: File.open(file_path),
          filename: 'test_image.png',
          content_type: 'image/png'
        )
      end
    end
  end
end
