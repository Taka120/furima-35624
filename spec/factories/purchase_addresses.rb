FactoryBot.define do
  factory :purchase_address do
    postal_number { '123-4567' }
    prefecture_id { 3 }
    municipalities { 'テスト市' }
    address { 'テスト群１ー１ー１' }
    building_name { 'テストビル' }
    telephone_number { '1234567890' }
    token { 'tok_abcdefghijk00000000000000000 '}
  end
end
