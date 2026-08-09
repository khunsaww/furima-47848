FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city { Faker::Lorem.word }
    house_number { Faker::Lorem.word }
    building_name { Faker::Lorem.word }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
