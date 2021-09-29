FactoryBot.define do
  factory :item do
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    item_name {"テスト"}
    explanation {"テストの詳細"}
    category_id {2}
    status_id {2}
    delivery_fee_id {2}
    area_id {2}
    days_to_ship_id {2}
    item_price {1000}
  end

end
