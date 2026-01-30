FactoryBot.define do
  factory :user do
    username { 'testuser' }
    first_name { '太郎' }
    last_name { '山田' }
    first_name_kana { 'タロウ' }
    last_name_kana { 'ヤマダ' }
    birthday { '2000-01-01' }

    email { Faker::Internet.unique.email }
    password { 'password1' }
    password_confirmation { password }
  end
end
