FactoryBot.define do
  factory :user do
    username { 'testuser'}
    first_name { '太郎'}
    last_name { '山田'}
    first_name_kana { 'テストファースト'}
    last_name_kana { 'テストラスト'}
    birthday { '2000-01-01'}

    sequence(:email) { |n| "test#{n}@example.com"}
    password { 'password1'}
    password_confirmation { 'password1'}
  end
end
